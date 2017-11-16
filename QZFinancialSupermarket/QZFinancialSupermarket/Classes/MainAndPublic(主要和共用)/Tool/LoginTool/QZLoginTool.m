//
//  QZLoginTool.m
//  QZFinancialSupermarket
//
//  Created by wzh on 17/3/16.
//
//

#import "QZLoginTool.h"
#import "JPUSHService.h"
#import "UIApplication+ActivityViewController.h"
@implementation QZLoginTool

+ (BOOL)isGoToLoginWithViewController:(UIViewController *)vc{
    if([QZLoginAccountTool accountModel]){
        return YES;
    }else{
        [self goToLoginWithViewController:vc];
        return NO;
    }
}
+ (void)goToLoginWithViewController:(UIViewController *)vc{
    [self goToLoginIsMainThreadWithVC:vc animated:YES];
}

+ (void)goToLoginIsMainThreadWithVC:(UIViewController *)vc animated:(BOOL)animated{
    if([NSThread currentThread].isMainThread){
        [self goToLoginVC:vc animated:animated];
    }else{
        dispatch_async(dispatch_get_main_queue(), ^{
            [self goToLoginVC:vc animated:animated];
        });
    }
}
+ (void)goToLoginVC:(UIViewController *)vc animated:(BOOL)animated{
//    QZLoginViewController *loginVc = [[QZLoginViewController alloc]init];
//    QZLoginNavViewController *loginNav = [[QZLoginNavViewController alloc]initWithRootViewController:loginVc];
//    [vc presentViewController:loginNav animated:animated completion:nil];
}

+ (BOOL)loginOut{
    //清除账号信息
    [QZLoginAccountTool removeEmptyAccountData];
    //将极光推送的alias设置空
    [JPUSHService setTags:nil alias:@"" fetchCompletionHandle:^(int iResCode, NSSet *iTags, NSString *iAlias){
        NSLog(@"rescode: %d, \ntags: %@, \nalias: %@\n", iResCode, iTags, iAlias);
    }];
    return YES;
}
+ (void)loginOutPopToStart{
    [self loginOut];
    if([QZRootVC isKindOfClass:[QZTabBarController class]]){
        QZRootVC.tabBarController.selectedIndex=0;
        for (UINavigationController *nav in QZRootVC.childViewControllers) {
            [nav popToRootViewControllerAnimated:NO];
        }
        QZRootVC.selectedIndex = 0;
    }
}
+ (void)loginOutPopAndDisMissToStart{
    
    UIViewController *activityVC = [[UIApplication sharedApplication]activityViewController];
    [activityVC dismissViewControllerAnimated:YES completion:nil];
    [self loginOutPopToStart];
}
@end
