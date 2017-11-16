//
//  QZMainHomeVC.m
//  QZFinancialSupermarket
//
//  Created by wzh on 2017/9/11.
//  Copyright © 2017年 wzh. All rights reserved.
//

#import "QZMainHomeVC.h"
#import "QZLoginPageVC.h"
#import "QZHomeMainHeaderView.h"
#import "QZHomeMainSectionHeaderView.h"
#import "HomeRecommendModel.h"
#import "HomeBannerModel.h"
#import "MapSelectViewController.h"
#import "QZHomeCellItem.h"
#import "QZProductDetailPageVC.h"
#import "QZInforDetailPageVC.h"
#import "LocationManager.h"
#import "HomeNewProductModel.h"
#import "QZHomeAdvertModel.h"
#import "QZNewProductCell.h"
#import "QZNewProductListVC.h"
#import "ActivityScroll.h"
#import "HomeActivityModel.h"
#import "QZHomeAdvertCell.h"

#define SectionHeigth 55 *kScaleOfX

@interface QZMainHomeVC ()<HomeMainHeaderViewDelegate, SLCityListViewControllerDelegate, productDelegate, HomeAdvertDelegate, UINavigationControllerDelegate>

@property (nonatomic, strong) QZHomeMainHeaderView *headerView;
@property (nonatomic, strong) QZHomeMainSectionHeaderView *sectionHeaderView;
@property (nonatomic, strong) UIButton *positioningButton;
@property (nonatomic, strong) QZHomeCellItem *homeCellItem;
// 活动推出页
@property (nonatomic, strong) ActivityScroll *activityView;
// 活动推出页数组
@property (nonatomic, strong) NSArray *activityArray;

@end

@implementation QZMainHomeVC

- (void)viewDidLoad {
    [super viewDidLoad];

    [self requestPushActivity];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notificationShowActivity:) name:ShowRecommendActivityName object:nil];
    // 活动推出页数据请求
    
}

- (BOOL)isMoreSection {
    return YES;
}

- (CGFloat)tabBarHeight {
    return kTabBarHeigth;
}
- (CGFloat)navBarHeight {
    return 0;
}
- (CGFloat)statusBarHeight {
    return 0;
}

- (UIView *)tableHeaderView{
    return self.headerView;
}

- (UITableViewStyle)tableViewStyle {
    return UITableViewStyleGrouped;
}

// cell 的操作
- (void)getCurrentCell:(ZHBaseTableViewCell *)cell {
    if ([cell isKindOfClass:[QZNewProductCell class]]) {
        QZNewProductCell *proCell = (QZNewProductCell *)cell;
        proCell.delegate = self;
    }
    if ([cell isKindOfClass:[QZHomeAdvertCell class]]) {
        QZHomeAdvertCell *advertCell = (QZHomeAdvertCell *)cell;
        advertCell.delegate = self;
    }
    
}

// 默认数据请求
- (void)loadDataList {
    [super loadDataList];
    [self getHomeDataSource];
}

- (void)setDefautUI{
    self.navigationItem.title = @"没钞蜂";
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.navigationController.delegate = self;
    
    // 目前定位先隐藏
    //    UIButton *positioningButton = [UIButton buttonWithType:UIButtonTypeCustom];
    //    [positioningButton setImage:[UIImage imageNamed:@"首页-位置"] forState:UIControlStateNormal];
    //    [positioningButton addTarget:self action:@selector(positioningButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    //    positioningButton.titleLabel.font = [UIFont textCustomFont15];
    //    [positioningButton setTitle:@"北京市" forState:UIControlStateNormal];
    //    self.positioningButton = positioningButton;
    //    [self setRightItemFrame];
    //    self.navigationItem.rightBarButtonItem =  [[UIBarButtonItem alloc] initWithCustomView:positioningButton];
    
    // 返回定位结果
    //    __weak typeof(self) weakSelf = self;
    //    [[LocationManager ShareLocation] beginLocation:^(BOOL isSuccess, CLPlacemark *placemark) {
    //        if (isSuccess) {
    //            [weakSelf.positioningButton setTitle:placemark.locality forState:UIControlStateNormal];
    //        }
    //    }];
    
    [self setMJRefresh];
    
}

- (void)setRightItemFrame{
    CGFloat titleH = 25 * kScaleOfX;
    CGFloat titleMidImage = 5 * kScaleOfX;
    CGFloat titleW = [ZHTool sizeWithString_W:self.positioningButton.currentTitle font:[UIFont textCustomFont15] height:titleH];
    CGFloat imageW = self.positioningButton.currentImage.size.width;
    self.positioningButton.frame = CGRectMake(self.positioningButton.x, self.positioningButton.y, titleW + imageW + titleMidImage, titleH);
    [self.positioningButton layoutButtonWithEdgeInsetsStyle:ZH_ButtonEdgeInsetsStyleRight imageTitleSpace:titleMidImage];
}

- (void)positioningButtonAction:(UIButton *)btn{
    NSLog(@"位置--------");
    
    NSString *cityName = self.positioningButton.currentTitle;
    NSString *titleStr = [NSString stringWithFormat:@"当前城市-%@", cityName];
    MapSelectViewController *vc = [[MapSelectViewController alloc] init];
    vc.delegate = self;
    vc.title = titleStr;
    [self.navigationController pushViewController:vc animated:YES];
    
}

#pragma mark - 首页数据
- (void)getHomeDataSource {
    
    [QZAFNetwork postWithBaseURL:QZ_HOME_URL success:^(NSURLSessionDataTask *task, id json) {
        
        if ([QZConfig checkResponseObject:json]) {

            // 映射 model
            self.homeCellItem = [[QZHomeCellItem alloc] initWithJson:json[@"data"]];
            
            // headerView 设置数据
            self.headerView.bannerArray = self.homeCellItem.banner;
            
            // 添加数据 reloaddata
            [self.dataArray removeAllObjects];

            // 公告数据
            if (self.homeCellItem.cont.count > 0) {
                NSDictionary * dic = @{Single: self.homeCellItem.cont};
                [self.dataArray addObject:dic];
            }
            // 每日新产品
            if (self.homeCellItem.everyday.count > 0) {
                NSDictionary * dic2 = @{Single: self.homeCellItem.everyday};
                [self.dataArray addObject:dic2];
            }
            // 推荐贷款
            if (self.homeCellItem.recommend.count > 0) {
                [self.dataArray addObject:self.homeCellItem.recommend];
            }
            
            [self.tableView reloadData];
            
        }
        [self endRefreshing];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        [self endRefreshing];
    }];
    
}

#pragma mark - 首页推出活动请求
- (void)requestPushActivity {
    [QZAFNetwork postWithBaseURL:QZ_PUSH_ACTIVITY_URL success:^(NSURLSessionDataTask *task, id json) {
        
        if ([QZConfig checkResponseObject:json]) {
            self.activityArray = [NSArray yy_modelArrayWithClass:[HomeActivityModel class] json:json[@"data"]];
        }
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
}



#pragma mark - 统计banner点击 请求数据
- (void)statisticsBannerWithBannerId:(NSString *)bannerid {
    [QZAFNetwork postWithBaseURL:QZ_HOME_BANNER_CLICKED_URL params:@{@"id": bannerid?:@"0"} success:^(NSURLSessionDataTask *task, id json) {
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (self.homeCellItem.cont.count > 0 && section == 0) {
        return 0.01;
    }
    return SectionHeigth;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    if (self.homeCellItem.cont.count > 0 && section == 0) {
        return [UIView new];
    } else {
        
        self.sectionHeaderView = [[QZHomeMainSectionHeaderView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, SectionHeigth)];
        self.sectionHeaderView.section = section;
        
        NSInteger ksection = self.homeCellItem.cont.count > 0 ? 1 : 0;
        if (section == ksection) {
            if (self.homeCellItem.everyday.count > 0) {
                [self.sectionHeaderView sectionHeaderViewLeftTitle:@"每日新产品"];
                [self.sectionHeaderView sectionHeaderViewRightTitle:@"查看全部"];
                [self.sectionHeaderView sectionHeaderViewLeftImage:[UIImage imageNamed:@"每日新产品"]];
            }
        }
        
        __weak typeof(self)WeakSelf = self;
        [self.sectionHeaderView sectionHeaderRightAction:^(NSInteger index) {
            if (index == ksection) {
                
                if (WeakSelf.homeCellItem.everyday.count > 0) {
                    NSLog(@"查看新产品");
                    QZNewProductListVC *newProVC = [[QZNewProductListVC alloc] init];
                    [WeakSelf.navigationController pushViewController:newProVC animated:YES];
                } else {
                    NSLog(@"全部贷款");
                    WeakSelf.tabBarController.selectedIndex = 1;
                }
                
            } else if (index == ksection+1) {
                NSLog(@"全部贷款");
                WeakSelf.tabBarController.selectedIndex = 1;
            }
        }];
        
    }

    return self.sectionHeaderView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSInteger index = 2;
    if (self.homeCellItem.cont.count > 0) {
        if (self.homeCellItem.everyday.count > 0) {
            index = 2;
        } else {
            index = 1;
        }
    } else {
        if (self.homeCellItem.everyday.count > 0) {
            index = 1;
        } else {
            index = 0;
        }
    }
    
    if (indexPath.section == index) {
        NSLog(@"跳转产品详情页");
        HomeRecommendModel *recommend = self.homeCellItem.recommend[indexPath.row];
        [QZAnalyticsManager event:home_tjpt];
        [self pushProductDetailWith:recommend.recommendId productName:recommend.name h5linke:recommend.h5link];
    }
    
}


- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    // 判断要显示的控制器是否是自己
    BOOL isShowHomePage = [viewController isKindOfClass:[self class]];
    [self.navigationController setNavigationBarHidden:isShowHomePage animated:YES];
}



#pragma mark - productDelegate
// 每日新产品item点击回调
- (void)selectedModel:(HomeNewProductModel *)model {
    NSLog(@"新产品跳转产品详情页");
    [QZAnalyticsManager event:home_mrxcp];
    [self pushProductDetailWith:[model.productId intValue] productName:model.name h5linke:model.h5link];
}

#pragma mark - SLCityListViewControllerDelegate
// 选择定位后的代理方法
- (void)sl_cityListSelectedCity:(NSString *)selectedCity Id:(NSInteger)Id {
    [self.positioningButton setTitle:selectedCity forState:UIControlStateNormal];
}


#pragma mark - HomeMainHeaderViewDelegate
// 点击banner代理方法
- (void)clickedBannerAction:(NSInteger)index {
    
    [QZAnalyticsManager event:home_banner];
    
    HomeBannerModel *model = self.homeCellItem.banner[index];
    QZBaseWebViewController *webVC = [[QZBaseWebViewController alloc] init];
    webVC.urlStr = model.hourl;
    
    if ([model.tjstatus integerValue] == 1) {
        // 需要统计
        if ([self isLoginStatus]) {
            // 首页banner统计
            [self statisticsBannerWithBannerId:model.bannerid];
            [self.navigationController pushViewController:webVC animated:YES];
        }
    } else {

        [self.navigationController pushViewController:webVC animated:YES];
    }
}

#pragma mark - HomeAdvertDelegate
// 公告代理方法
- (void)homeClickedAdvertAtIndex:(NSInteger)index {
    QZHomeAdvertModel *advertModel = self.homeCellItem.cont[index];
    [QZAnalyticsManager event:home_dkgg];
    [self pushProductDetailWith:[advertModel.advertId intValue] productName:advertModel.name h5linke:@"api/index/LoanDetails"];
}



#pragma mark - private Method
#pragma mark - 跳转产品详情页
- (void)pushProductDetailWith:(NSInteger)productId productName:(NSString *)productName h5linke:(NSString *)h5link{
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setObject:@(productId?:0) forKey:@"id"];
    [dic setObject:@"0" forKey:@"page"];
    [dic setObject:@"1" forKey:@"app_open"];
    
    QZProductDetailPageVC * productDetailPageVC = [[QZProductDetailPageVC alloc] init];
    
    NSString *webUrl = [QZConfig getCompleteURLWithParameterDic:dic url:QZ_LOAN_DETAIL_URL];
    productDetailPageVC.urlStr = webUrl;
    productDetailPageVC.commentId = productId?:0;
    productDetailPageVC.proTitle = productName;
    productDetailPageVC.url = [webUrl substringFromIndex:6];
    productDetailPageVC.h5link = h5link;
    
    [self.navigationController pushViewController:productDetailPageVC animated:YES];
}

#pragma mark - 展示活动弹窗
- (void)showPushActicity:(NSArray *)array {
    
    if (array.count > 0) {
        __weak typeof(self)WeakSelf = self;
        self.activityView = [[ActivityScroll alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) total:array.count currentShowData:^(NSInteger index, UIImageView *imageView) {
            
            // 展示画的图层
            HomeActivityModel * model = array[index];
            NSString * imageStr = [ImageUrl stringByAppendingPathComponent:model.popupimage];
            [imageView sd_setImageWithURL:[NSURL URLWithString:imageStr] placeholderImage:PlaceholderMin];
            
        } clickedIndex:^(NSInteger index) {
            [QZAnalyticsManager event:tstc];
            
            HomeActivityModel * model = array[index];
            [WeakSelf gotoLocationOrWebWithUrlString:model.linkurl];
            
        }];
        [self.activityView showWith:QZAPPDelegate.window];
    }
    
}

#pragma mark - 通知 方法 展示每日活动推荐页
- (void)notificationShowActivity:(NSNotification *)userInfo{
    
    if ([[userInfo.userInfo objectForKey:@"show"] intValue] == 0) {
        if (self.tabBarController.selectedIndex == 0) {
            [self showPushActicity:self.activityArray];
        }
        
    }
    
}



#pragma mark - 活动推荐 跳转方案
- (void)gotoLocationOrWebWithUrlString:(NSString *)string {
    
    // 关闭活动推荐图层
    [self.activityView closeShow];
    
    if (string.length > 0) {
        
        if ([string containsString:@"贷款"]) {
            
            // 跳本地贷款页
            self.tabBarController.selectedIndex = 1;
        } else if ([string containsString:@"每日新产品列表页"] || [string containsString:@"新产品"]) {
            
            // 跳本地 每日新产品列表页
            QZNewProductListVC * newProVC = [[QZNewProductListVC alloc] init];
            [self.navigationController pushViewController:newProVC animated:YES];
        } else {
            
            // 跳网页
            QZBaseWebViewController *webVC = [[QZBaseWebViewController alloc] init];
            if (![string hasPrefix:@"http:"] && ![string hasPrefix:@"https:"]) {
                string = [@"http:" stringByAppendingPathComponent:string];
            }
            webVC.urlStr = string;
            [self.navigationController pushViewController:webVC animated:YES];
        }

    }
}


#pragma mark - lazyloading

- (QZHomeMainHeaderView *)headerView{
    if(!_headerView){
        _headerView = [[QZHomeMainHeaderView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenWidth * 0.53 * kScaleOfX)];
        _headerView.delegate = self;
    }
    return _headerView;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
