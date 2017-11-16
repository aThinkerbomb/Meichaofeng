//
//  QZInformationPageVC.m
//  QZFinancialSupermarket
//
//  Created by wzh on 2017/9/11.
//  Copyright © 2017年 wzh. All rights reserved.
//

#import "QZInformationPageVC.h"
#import "QZInforDetailPageVC.h"
#import "QZInformationItem.h"
#import "QZInfoCarousel.h"
#import "CycleScrollView.h"
#import "QZInfoDataModel.h"
@interface QZInformationPageVC ()
{
    NSInteger oldPageNo;
}
@property (nonatomic, strong) QZInformationItem * infoItem;

@end

@implementation QZInformationPageVC

- (UIView *)settableHeaderView{
    
    // 如果重写父类 tableHeaderView get方法，在轮播图滚动的时候修改tableview的frame 会引发崩溃，所以写到加载出数据后
    
    // 背景View
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 190 * kScaleOfX)];
    view.backgroundColor = [UIColor clearColor];
    
    // 轮播图
    __weak typeof(self)WeakSelf = self;
    CGRect rect = view.bounds;
    CycleScrollView *cycView = [[CycleScrollView alloc] initWithFrame:rect totleCount:self.infoItem.carousel.count currentIndexShow:^(NSInteger currentIndex, UIImageView *imageView, UILabel * label) {
        
        QZInfoCarousel * carouselModel = WeakSelf.infoItem.carousel[currentIndex];
        NSString * imageStr = [ImageUrl stringByAppendingPathComponent:carouselModel.smallimage];
        [imageView sd_setImageWithURL:[NSURL URLWithString:imageStr] placeholderImage:PlaceholderMax];
        label.text = carouselModel.title;
        
    } sourceHandler:^(NSInteger indexClick) {
        
        QZInfoCarousel * carouselModel = WeakSelf.infoItem.carousel[indexClick];
        
        [QZAnalyticsManager event:news_banner];
        
        NSMutableDictionary *dic = [NSMutableDictionary dictionary];
        [dic setValue:carouselModel.carouselId forKey:@"id"];
        [dic setValue:@"0" forKey:@"page"];
        
        [self pushWebVCWithParameters:dic Url:QZ_CYCLE_PIC_DETAIL_URL commentId:[carouselModel.carouselId integerValue] commnetType:3];

    }];
    
    // 开始自动滚动
    [cycView startScrollAnimation];
    [view addSubview:cycView];
    
    return view;
}

- (UITableViewStyle)tableViewStyle {
    return UITableViewStyleGrouped;
}

- (CGFloat)tabBarHeight {
    return kTabBarHeigth;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}



- (void)setDefautUI {
    
    self.tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 190 * kScaleOfX)];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.pageNo = 0;
    oldPageNo = 0;
    [self setMJRefresh];
    [self setLoadMore];
}

- (void)loadDataList {
    [self advisoryDataSource];
}

- (void)loadNewDataNoLoading {
    [super loadNewDataNoLoading];
    oldPageNo = 0;
}

// 重写父类
- (void)loadMoreData {
    
    self.pageNo++;
    [self advisoryDataSource];
    
}

#pragma mark - 咨询数据请求
- (void)advisoryDataSource {
    
    [QZAFNetwork postWithBaseURL:QZ_ADVISORY_URL params:@{@"page": @(self.pageNo?:0)} success:^(NSURLSessionDataTask *task, id json) {
        if ([QZConfig checkResponseObject:json]) {
            
            //转模型
            self.infoItem = [[QZInformationItem alloc] initWithJson:json[@"data"]];
            
            if (self.pageNo > oldPageNo && self.infoItem.data1.count == 0) {
                // 提示已经没有数据了
                [self showHint:QZAlreadyLastPage];
                self.pageNo--;
                
            } else if (self.pageNo > oldPageNo && self.infoItem.data1.count >  0) {
                // 加载更多数据
                for (QZInfoDataModel * infodataModel  in self.infoItem.data1) {
                    [self.dataArray addObject:infodataModel];
                }
                
                // 旧页数增加 （不要忘记哦）
                oldPageNo++;
                
            } else {
                //设置数据源 刷新
                [self.dataArray removeAllObjects];
                self.dataArray = [NSMutableArray arrayWithArray:self.infoItem.data1];
            }
            
            
            [self.tableView reloadData];
            
            // 设置tableHeaderView
            self.tableView.tableHeaderView = [self settableHeaderView];
            
        }
        [self endRefreshing];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        [self endRefreshing];
    }];
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 8 * kScaleOfX;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    QZInfoDataModel *infoModel = self.dataArray[indexPath.row];
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setValue:infoModel.InfoId?:@"0" forKey:@"id"];
    [dic setValue:@"0" forKey:@"page"];
    [dic setValue:@"1" forKey:@"app_open"];
    
    [self pushWebVCWithParameters:dic Url:QZ_ADVISORY_DETAIL_URL commentId:[infoModel.InfoId integerValue] commnetType:2];

    
}


- (void)pushWebVCWithParameters:(NSDictionary *)dic Url:(NSString *)url commentId:(NSInteger)commnetId commnetType:(NSInteger)commentType{
    
    QZInforDetailPageVC *inforDetailPageVC = [[QZInforDetailPageVC alloc]init];
    inforDetailPageVC.urlStr = [QZConfig getCompleteURLWithParameterDic:dic url:url];
    inforDetailPageVC.commentId = commnetId;
    inforDetailPageVC.commentType = commentType;
    [self.navigationController pushViewController:inforDetailPageVC animated:YES];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
