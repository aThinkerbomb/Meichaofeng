//
//  QZProductPageItemVC.m
//  QZFinancialSupermarket
//
//  Created by wzh on 2017/9/13.
//  Copyright © 2017年 wzh. All rights reserved.
//

#import "QZProductPageItemVC.h"
#import "QZProductCellItem.h"
#import "QZProductDetailPageVC.h"
#import "QZLoanFilterView.h"
#import "SGAdvertScrollView.h"

#define AdvertHeight 30
#define FilterViewHeight 55

@interface QZProductPageItemVC ()
{
    NSInteger oldPageNo;
}

/**
 公告view
 */
@property (nonatomic, strong) SGAdvertScrollView * advertView;
/**
 筛选view
 */
@property (nonatomic, strong) QZLoanFilterView * loanFilterView;

@property (nonatomic, strong) NSArray * allArray;  //全部
@property (nonatomic, strong) NSArray * fastArray; //放款快
@property (nonatomic, strong) NSArray * downArray; //低利率
@property (nonatomic, strong) NSArray * passArray; //易通过
@end

@implementation QZProductPageItemVC

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [QZAnalyticsManager event:tab_loan];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (CGFloat)otherViewHeight{
//    return self.myOtherHeight;
    return AdvertHeight+FilterViewHeight;
}

- (CGFloat)tableViewY {
    return AdvertHeight+FilterViewHeight;
}

- (CGFloat)tabBarHeight {
    return kTabBarHeigth;
}

- (void)viewDidLayoutSubviews {
    [self.loanFilterView setFrame:CGRectMake(10, 0, kScreenWidth-20, FilterViewHeight)];
}

- (void)setDefautUI {
    
    // 自适应关闭
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    // 公告
    [self.view addSubview:self.advertView];
    
    // 筛选view
    UIView * filterBackView = [[UIView alloc] initWithFrame:CGRectMake(0, AdvertHeight, kScreenWidth, FilterViewHeight)];
    filterBackView.backgroundColor = [UIColor whiteColor];
    [filterBackView addSubview:self.loanFilterView];
    
    // 筛选View点击事件
    __weak typeof(self)WeakSelf = self;
    [self.loanFilterView didSelectedHandle:^(NSInteger index) {
        NSLog(@"index = %lu", (long)index);
        
        // 选择 tab 类型
        WeakSelf.type = index;
        
        if ([WeakSelf isNeedRefrsh]) {
            // 重制 当前要刷新页数、前一页数
            WeakSelf.pageNo = 0;
            oldPageNo   = 0;
            
            // 重新刷新数据
            [WeakSelf loadNewDataNoLoading];
        }
 
    }];
    [self.view addSubview:filterBackView];
    [filterBackView addSubview:self.loanFilterView];
    
    
    self.pageNo = 0; //当前页数
    oldPageNo = 0;   //当前页的前一页
    
    // 接入上拉、下拉
    [self setMJRefresh];
    [self setLoadMore];
}

// 默认数据请求
- (void)loadDataList {
    [self productDatsSource];
    [self loanAdvertDataSource];
}

// 下拉刷新请求
- (void)loadNewDataNoLoading {
    [super loadNewDataNoLoading];
    oldPageNo = 0;
}

// 重写父类 加载更多
-(void)loadMoreData {
    self.pageNo++;
    [self productDatsSource];
}

#pragma mark - 贷款公告请求
- (void)loanAdvertDataSource {
    [QZAFNetwork postWithBaseURL:QZ_LOAN_ADVERT_URL success:^(NSURLSessionDataTask *task, id json) {
        NSMutableArray * titles = [NSMutableArray array];
        NSArray * data = json[@"data"];
        for (NSDictionary * dic in data) {
            
            NSString * notice =[dic objectForKey:@"notice"];
            [titles addObject:notice];
        }
        self.advertView.titles = titles;
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
}


#pragma mark - 贷款列表数据请求
- (void)productDatsSource {
    
    NSMutableDictionary * params = [NSMutableDictionary dictionary];
    [params setValue:@(self.type?:4) forKey:@"sta"];
    [params setValue:@(self.pageNo?:0) forKey:@"page"];
    
    [QZAFNetwork postWithBaseURL:QZ_PRODUCT_URL params:params success:^(NSURLSessionDataTask *task, id json) {
        if ([QZConfig checkResponseObject:json]) {
            
            NSArray *array = [NSArray yy_modelArrayWithClass:[QZProductCellItem class] json:json[@"data"]];
            
            if (self.pageNo > oldPageNo && array.count == 0) {
                
                // 没有新数据了
                [self showHint:QZAlreadyLastPage];
                self.pageNo--;
                
            } else if (self.pageNo > oldPageNo && array.count > 0) {
                
                // 加载更多数据
                for (QZProductCellItem *proModel in array) {
                    [self.dataArray addObject:proModel];
                }
                oldPageNo++;
                
                // 分别缓存数据
                [self saveDataByType:self.type datasource:self.dataArray];
                
            } else {
                self.dataArray = [NSMutableArray arrayWithArray:array];
                // 分别缓存数据
                [self saveDataByType:self.type datasource:self.dataArray];
            }
            
            [self.tableView reloadData];
        }
        [self endRefreshing];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        [self endRefreshing];
    }];
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return [UIView new];
    }
    return nil;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return 8;
    }
    return 0.001;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    QZProductCellItem *itemModel = self.dataArray[indexPath.row];
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setValue:itemModel.proid forKey:@"id"];
    [dic setValue:@"0" forKey:@"page"];
    [dic setValue:@"1" forKey:@"app_open"];
    
    [self pushWebVCWithParameters:dic Url:QZ_LOAN_DETAIL_URL productItemModel:itemModel];
}


// 跳转咨询详情页
- (void)pushWebVCWithParameters:(NSDictionary *)dic Url:(NSString *)url productItemModel:(QZProductCellItem *)itemModel{
    
    QZProductDetailPageVC * productDetailPageVC = [[QZProductDetailPageVC alloc] init];
    
    NSString *webUrl = [QZConfig getCompleteURLWithParameterDic:dic url:url];
    productDetailPageVC.urlStr = webUrl;
    productDetailPageVC.commentId = [itemModel.proid integerValue];
    productDetailPageVC.proTitle = itemModel.name;
    productDetailPageVC.url = [webUrl substringFromIndex:6];
    productDetailPageVC.h5link = itemModel.h5link;
    
    [self.navigationController pushViewController:productDetailPageVC animated:YES];
    
}

#pragma mark - 分别缓存数据
- (void)saveDataByType:(NSInteger)type datasource:(NSArray *)datasource {
    if (datasource.count > 0) {
        if (type == 4) {
            self.allArray = [NSArray arrayWithArray:datasource];
            
        } else if (type == 1) {
            self.fastArray = [NSArray arrayWithArray:datasource];
            
        } else if (type == 2) {
            self.downArray = [NSArray arrayWithArray:datasource];
            
        } else if (type == 3) {
            self.passArray = [NSArray arrayWithArray:datasource];
        }
    }
}

#pragma mark - 判断是否需要刷新
- (BOOL)isNeedRefrsh {
    BOOL isNeed = YES;
    if (self.type == 4) {
        if (self.allArray.count > 0) {
            self.dataArray = [NSMutableArray arrayWithArray:self.allArray];
            [self.tableView reloadData];
            return NO;
        }
    } else if (self.type == 1) {
        [QZAnalyticsManager event:loan_fkk];
        if (self.fastArray.count > 0) {
            self.dataArray = [NSMutableArray arrayWithArray:self.fastArray];
            [self.tableView reloadData];
            return NO;
        }
    } else if (self.type == 2) {
        [QZAnalyticsManager event:loan_dll];
        if (self.downArray.count > 0) {
            self.dataArray = [NSMutableArray arrayWithArray:self.downArray];
            [self.tableView reloadData];
            return NO;
        }
    } else if (self.type == 3) {
        [QZAnalyticsManager event:loan_ytg];
        if (self.passArray.count > 0) {
            self.dataArray = [NSMutableArray arrayWithArray:self.passArray];
            [self.tableView reloadData];
            return NO;
        }
    }
    return isNeed;
}

#pragma mark - lazyloading
- (SGAdvertScrollView *)advertView {
    if (!_advertView) {
        _advertView = [[SGAdvertScrollView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, AdvertHeight)];
//        _advertView.titles = @[@"敌军还有30秒到达战场", @"碾碎他们", @"王者审判", @"王者不可阻挡"];
        _advertView.titleColor = [UIColor colorWithHexString:@"ff2a2a"];
        _advertView.titleFont = [UIFont textFont14];
        _advertView.textAlignment = NSTextAlignmentCenter;
        _advertView.backgroundColor = [UIColor colorWithHexString:@"fffac4"];
    }
    return _advertView;
}

- (QZLoanFilterView *)loanFilterView {
    if (!_loanFilterView) {
        _loanFilterView = [[[NSBundle mainBundle] loadNibNamed:@"QZLoanFilterView" owner:self options:nil] firstObject];
        [_loanFilterView setFrame:CGRectMake(10, 0, kScreenWidth-20, FilterViewHeight)];
    }
    return _loanFilterView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
