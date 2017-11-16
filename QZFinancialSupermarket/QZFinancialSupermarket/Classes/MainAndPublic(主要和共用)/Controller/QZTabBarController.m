//
//  QZTabBarController.h
//  
//
//  Created by wzh on 16/5/6.
//  Copyright © 2016年 wzh All rights reserved.
//

#import "QZTabBarController.h"
#import "QZNavigationViewController.h"
#import "QZMainHomeVC.h"
#import "QZProductPageVC.h"
#import "QZProductPageItemVC.h"
#import "QZInformationPageVC.h"
#import "QZUserCenterVC.h"
#import "ZHTabBar.h"
#import "ZHUITabBar.h"

//#import "UIApplication+ActivityViewController.h"

@interface QZTabBarController ()<ZHUITabBarDelegate,UITabBarControllerDelegate>

@property (nonatomic, strong) QZMainHomeVC *mainHomeVC;
@property (nonatomic, strong) QZProductPageVC *productPageVc;
@property (nonatomic, strong) QZUserCenterVC *userCenterVC;

@end

@implementation QZTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 添加所有的子控制器
    [self addAllChildVcs];
    
    // 创建自定义tabbar
    [self addCustomTabBar];
    
}


/**
 *  创建自定义tabbar
 */
- (void)addCustomTabBar
{
    // 创建自定义tabbar
    ZHUITabBar *customTabBar = [[ZHUITabBar alloc] init];
    customTabBar.tabBarDelegate = self;
//    customTabBar.tabbarType = HNTabBarTypePlus;
    // 更换系统自带的tabbar
    [self setValue:customTabBar forKeyPath:@"tabBar"];
//    self.tabBarController.tabBar.backgroundColor = [UIColor clearColor];
    self.delegate = self;
    self.tabBarController.tabBar.opaque = YES;
}

/**
 *  添加所有的子控制器
 */
- (void)addAllChildVcs
{
    
    QZMainHomeVC *homeVC = [[QZMainHomeVC alloc]init];
    [self addOneChlildVc:homeVC title:@"首页" imageName:@"TabBar_Home_Normal" selectedImageName:@"TabBar_Home_Select"];
    self.mainHomeVC = homeVC;
    
    QZProductPageItemVC *productPageVC = [[QZProductPageItemVC alloc]init];
    [self addOneChlildVc:productPageVC title:@"贷款" imageName:@"TabBar_Product_Normal" selectedImageName:@"TabBar_Product_Select"];
    
    QZInformationPageVC *informationPageVc = [[QZInformationPageVC alloc]init];
    [self addOneChlildVc:informationPageVc title:@"资讯" imageName:@"TabBar_ Information_Normal" selectedImageName:@"TabBar_ Information_Select"];
    
    
    QZUserCenterVC *userCenterVC = [[QZUserCenterVC alloc] init];
    [self addOneChlildVc:userCenterVC title:@"我的" imageName:@"TabBar_UserCenter_Normal" selectedImageName:@"TabBar_UserCenter_Select"];
    self.userCenterVC = userCenterVC;
}

/**
 *  添加一个子控制器
 *
 *  @param childVc           子控制器对象
 *  @param title             标题
 *  @param imageName         图标
 *  @param selectedImageName 选中的图标
 */
- (void)addOneChlildVc:(UIViewController *)childVc title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName
{
    // 设置标题
    childVc.title = title;
    
    // 设置图标
    childVc.tabBarItem.image = [UIImage imageNamed:imageName];
    
    // 设置tabBarItem的普通文字颜色
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = [UIColor colorWith0xC3C2C7];
    textAttrs[NSFontAttributeName] = [UIFont textCustomFont12];
    [childVc.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    
    // 设置tabBarItem的选中文字颜色
    NSMutableDictionary *selectedTextAttrs = [NSMutableDictionary dictionary];
    selectedTextAttrs[NSForegroundColorAttributeName] = [UIColor colorWith0x4180E9];
    textAttrs[NSFontAttributeName] = [UIFont textCustomFont12];
    [childVc.tabBarItem setTitleTextAttributes:selectedTextAttrs forState:UIControlStateSelected];
    
    // 设置选中的图标
    UIImage *selectedImage = [UIImage imageNamed:selectedImageName];
    childVc.tabBarItem.selectedImage = selectedImage;
    
    // 添加为tabbar控制器的子控制器
    QZNavigationViewController *nav = [[QZNavigationViewController alloc] initWithRootViewController:childVc];
    [self addChildViewController:nav];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - ZHTabBarDelegate
- (void)tabBarDidClickedPlusButton:(ZHUITabBar *)tabBar
{
    NSLog(@"点击了中间按钮");
}
- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
}
#pragma mark tabbar的点击方法
-(BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController
{
////    先写一个进入登录页面的方法
//    if ([viewController.tabBarItem.title isEqualToString:@"账单"] || [viewController.tabBarItem.title isEqualToString:@"我的"]) {
//        if(![QZLoginAccountTool accountModel]){//未登录
//            return [QZLoginTool isGoToLoginWithViewController:self];
//        }
//    }
    return YES;
}
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
//    [QZWaitAnimationTool cancelRequestAndErrorViewHidden];
//    if(tabBarController.selectedIndex == 0){
//        //首页<S>
//        [QZAnalyicsManagerTool setHomeMainClickedAction];
//    }else if (tabBarController.selectedIndex == 1){
//        //账单<ZD>
//        [QZAnalyicsManagerTool setBillPageClickedAction];
//        
//    }else if(tabBarController.selectedIndex == 2){
//        //点击用户中心埋点
//        [QZAnalyicsManagerTool setHomeUserCenterClickedAction];
//    }
}





@end
