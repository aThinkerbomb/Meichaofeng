//
//  QZChooseRootVcManagerTool.m
//  QZFinancialSupermarket
//
//  Created by wzh on 17/2/27.
//
//

#import "QZChooseRootVcManagerTool.h"
#import "QZNewFeatureViewController.h"
@implementation QZChooseRootVcManagerTool

+ (void)chooseRootViewController{

    // 如何知道第一次使用这个版本？比较上次的使用情况
    NSString *versionKey = @"CFBundleShortVersionString";
    // 从沙盒中取出上次存储的软件版本号(取出用户上次的使用记录)
    NSString *lastVersion = kGetObjectForKey(versionKey);
    // 获得当前打开软件的版本号
    NSString *currentVersion = [ZHTool getCurrentVersion];
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
//    if ([currentVersion isEqual:lastVersion]) {
        // 当前版本号 == 上次使用的版本：显示QZTabBarController
        [UIApplication sharedApplication].statusBarHidden = NO;
//        window.rootViewController = [[QZAdvertisingPageVC alloc]init];
        window.rootViewController = [[QZTabBarController alloc]init];
        //判断沙盒中是否存在广告图片，如果存在，直接显示
//        [ZHAdPageManagerTool showAdvertisingYesOrNo:kScreenHeight];
//    } else { // 当前版本号 != 上次使用的版本：显示版本新特性‘
//        [UIApplication sharedApplication].statusBarHidden = YES;
//        window.rootViewController = [[QZNewFeatureViewController alloc] init];
//    }
    
    //初始化广告页面 存储广告图片
//    [ZHAdPageManagerTool getAdvertisingImage];
}

@end
