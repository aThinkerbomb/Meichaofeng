//
//  QZLoginTool.h
//  QZFinancialSupermarket
//
//  Created by wzh on 17/3/16.
//
//

#import <Foundation/Foundation.h>

@interface QZLoginTool : NSObject

//是否登录  没有登录 自动跳转到登录  登录了直接走判断
+ (BOOL)isGoToLoginWithViewController:(UIViewController *)vc;

+ (void)goToLoginWithViewController:(UIViewController *)vc;

+ (BOOL)loginOut;
+ (void)loginOutPopToStart;
+ (void)loginOutPopAndDisMissToStart;

@end
