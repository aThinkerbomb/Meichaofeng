//
//  QZNewProductListVC.m
//  QZFinancialSupermarket
//
//  Created by 张宇轩 on 2017/11/2.
//  Copyright © 2017年 wzh. All rights reserved.
//

#import "QZNewProductListVC.h"
#import "SGAdvertScrollView.h"
#import "QZProductDetailPageVC.h"
#import "QZNewProductModel.h"

#define AdvertHeight 30
@interface QZNewProductListVC ()
{
    NSInteger oldPageNo;
}
/**
 公告view
 */
@property (nonatomic, strong) SGAdvertScrollView * advertView;

/**
 * 类型 4-全部 1-放款快 2-低利率 3-易通过
 */
@property (nonatomic, assign) NSInteger type;

@end

@implementation QZNewProductListVC
- (void)viewDidLoad {
    [super viewDidLoad];
}

- (CGFloat)tableViewY {
    return AdvertHeight;
}

- (CGFloat)otherViewHeight {
    return AdvertHeight;
}

- (void)setDefautUI {
    
    self.title = @"每日新产品";
    
    // 公告
    [self.view addSubview:self.advertView];
    
    self.pageNo = 0; //当前页数
    oldPageNo = 0;   //当前页的前一页
    
    // 接入上拉、下拉
    [self setMJRefresh];
//    [self setLoadMore];
    
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
//-(void)loadMoreData {
//    self.pageNo++;
//    [self productDatsSource];
//}



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
    
    [QZAFNetwork postWithBaseURL:QZ_DAY_NEW_PRO_URL success:^(NSURLSessionDataTask *task, id json) {
        if ([QZConfig checkResponseObject:json]) {
            
            NSArray *array = [NSArray yy_modelArrayWithClass:[QZNewProductModel class] json:json[@"data"]];
            self.dataArray = [NSMutableArray arrayWithArray:array];
//            if (self.pageNo > oldPageNo && array.count == 0) {
//
//                // 没有新数据了
//                [self showHint:QZAlreadyLastPage];
//                self.pageNo--;
//
//            } else if (self.pageNo > oldPageNo && array.count > 0) {
//
//                // 加载更多数据
//                for (QZNewProductModel *proModel in array) {
//                    [self.dataArray addObject:proModel];
//                }
//                oldPageNo++;
//
//            } else {
//                // 下拉
//                self.dataArray = [NSMutableArray arrayWithArray:array];
//            }
            
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
    
    QZNewProductModel *itemModel = self.dataArray[indexPath.row];
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setValue:itemModel.productId forKey:@"id"];
    [dic setValue:@"0" forKey:@"page"];
    [dic setValue:@"1" forKey:@"app_open"];
    
    [self pushWebVCWithParameters:dic Url:QZ_LOAN_DETAIL_URL productItemModel:itemModel];
}


// 跳转咨询详情页
- (void)pushWebVCWithParameters:(NSDictionary *)dic Url:(NSString *)url productItemModel:(QZNewProductModel *)itemModel{
    
    QZProductDetailPageVC * productDetailPageVC = [[QZProductDetailPageVC alloc] init];
    
    NSString *webUrl = [QZConfig getCompleteURLWithParameterDic:dic url:url];
    productDetailPageVC.urlStr = webUrl;
    productDetailPageVC.commentId = [itemModel.productId integerValue];
    productDetailPageVC.proTitle = itemModel.name;
    productDetailPageVC.url = [webUrl substringFromIndex:6];
    productDetailPageVC.h5link = itemModel.h5link;
    
    [self.navigationController pushViewController:productDetailPageVC animated:YES];
    
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
