//
//  QZUserCenterVC.m
//  QZFinancialSupermarket
//
//  Created by wzh on 2017/9/11.
//  Copyright © 2017年 wzh. All rights reserved.
//

#import "QZUserCenterVC.h"
#import "QZMessagePageVC.h"
#import "QZMyCommentsListPageVC.h"
#import "QZUserCenterItem.h"
#import "QZUserCenterCell.h"
#import "QZUserCenterHeadeView.h"
#import "QZSetUpPageVC.h"
#import "QZAboutMeVC.h"
#import "QZApplyRecordVC.h"

#define HeaderView_H  205 * kScaleOfX//ceilf(200 *QSDScaleOfX)

@interface QZUserCenterVC ()<UINavigationControllerDelegate, UserCenterDelegate>
@property (nonatomic, strong) QZUserCenterHeadeView *headerView;

@end

@implementation QZUserCenterVC
- (QZUserCenterHeadeView *)headerView{
    if(!_headerView){
        _headerView = [[QZUserCenterHeadeView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, HeaderView_H)];
        _headerView.delegate = self;
    }
    return _headerView;
}
- (UIView *)tableHeaderView{
    return self.headerView;
}
- (CGFloat)navBarHeight {
    return 0;
}
- (CGFloat)statusBarHeight {
    return 0;
}
- (CGFloat)tabBarHeight {
    return kTabBarHeigth;
}
- (BOOL)isMoreSection{
    return YES;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [QZAnalyticsManager event:tab_account];
    
    if ([QZConfig isLoginStatus]) {
        NSString *phone = kGetObjectForKey(QZPhone);
        [self.headerView.loginBtn setTitle:[QZConfig getHandlePhone:phone] forState:UIControlStateNormal];
    } else {
        [self.headerView.loginBtn setTitle:@"点击登录" forState:UIControlStateNormal];
    }
    
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    // iOS 11 后 ，由于安全区域的问题
    // 如果你的APP中使用的是自定义的navigationbar，隐藏掉系统的navigationbar，并且tableView的frame为(0,0,SCREEN_WIDTH, SCREEN_HEIGHT)开始，那么系统会自动调整SafeAreaInsets值为(20,0,0,0)，如果使用了系统的navigationbar，那么SafeAreaInsets值为(64,0,0,0)，如果也使用了系统的tabbar，那么SafeAreaInsets值为(64,0,49,0)
    if (IOS11) {
        [self.tableView setContentInsetAdjustmentBehavior:UIScrollViewContentInsetAdjustmentNever];
    } else {
        // Fallback on earlier versions
    }

}
- (void)setDefautUI{
    self.navigationController.delegate = self;
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self setUIWithModel:nil];
}
// 将要显示控制器
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    // 判断要显示的控制器是否是自己
    BOOL isShowHomePage = [viewController isKindOfClass:[self class]];
    [self.navigationController setNavigationBarHidden:isShowHomePage animated:YES];
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 8 *kScaleOfX;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView alloc]init];
    view.backgroundColor = self.view.backgroundColor;
    return view;
}

- (void)setUIWithModel:(NSString *)model{
    
    __block QZUserCenterVC *weakSelf = self;
    NSMutableArray *array = [NSMutableArray array];
    NSMutableArray *firstTmpArray = [NSMutableArray array];
    NSMutableArray *secendTmpArray = [NSMutableArray array];
    
    //申请记录
    QZUserCenterItem *applyRecordItem = [QZUserCenterItem itemWithIcon:@"申请记录" title:@"申请记录" lineType:QZLineTypeDefaut];
    
    applyRecordItem.selectValueAction = ^(QZUserCenterCell *cell) {
        NSLog(@"申请记录");
        if ([weakSelf isLoginStatus]) {
            QZApplyRecordVC *applyVC = [[QZApplyRecordVC alloc] init];
            [weakSelf.navigationController pushViewController:applyVC animated:YES];
        }
        
    };
    [firstTmpArray addObject:applyRecordItem];
    
    
    //我的评价
    QZUserCenterItem *myEvaluationItem = [QZUserCenterItem itemWithIcon:@"我的评价" title:@"我的评价" lineType:QZLineTypeDefaut];
    
    myEvaluationItem.selectValueAction = ^(QZUserCenterCell *cell) {
        NSLog(@"我的评价");
        if ([weakSelf isLoginStatus]) {
            QZMyCommentsListPageVC *myCommentsListPageVc = [[QZMyCommentsListPageVC alloc]init];
            [weakSelf.navigationController pushViewController:myCommentsListPageVc animated:YES];
        }
        
    };
    [firstTmpArray addObject:myEvaluationItem];
    
    
    //消息通知  暂时去掉
//    QZUserCenterItem *messAlertsItem = [QZUserCenterItem itemWithIcon:@"消息通知" title:@"消息通知" lineType:QZLineTypeDefaut];
//    messAlertsItem.selectValueAction = ^(QZUserCenterCell *cell){
//        NSLog(@"消息通知");
//        QZMessagePageVC *messagePageVc = [[QZMessagePageVC alloc]init];
//        [weakSelf.navigationController pushViewController:messagePageVc animated:YES];
//    };
//    [firstTmpArray addObject:messAlertsItem];
    
    
    
    //关于我们
    QZUserCenterItem *aboutMeItem = [QZUserCenterItem itemWithIcon:@"关于我们" title:@"关于我们" lineType:QZLineTypeTopHiddenBottomHidden];
    aboutMeItem.selectValueAction = ^(QZUserCenterCell *cell){
        NSLog(@"关于我们");
        QZAboutMeVC *aboutMeVC = [[QZAboutMeVC alloc] init];
        [weakSelf.navigationController pushViewController:aboutMeVC animated:YES];

    };
    [firstTmpArray addObject:aboutMeItem];
    [array addObject:firstTmpArray];
    
    
    //设置
    QZUserCenterItem *setUpItem = [QZUserCenterItem itemWithIcon:@"设置" title:@"设置" lineType:QZLineTypeTopHiddenBottomShow];
    setUpItem.selectValueAction = ^(QZUserCenterCell *cell){
        NSLog(@"设置");
        QZSetUpPageVC *setUpPageVc = [[QZSetUpPageVC alloc]init];
        [weakSelf.navigationController pushViewController:setUpPageVc animated:YES];
        
    };
    [secendTmpArray addObject:setUpItem];
    [array addObject:secendTmpArray];
    
    
    [self.dataArray removeAllObjects];
    [self.dataArray addObjectsFromArray:array];
    
    [self.tableView reloadData];
    
}

#pragma mark - 用户登录代理方法
- (void)userCenterLoginAction {
    if ([self isLoginStatus]) {
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
