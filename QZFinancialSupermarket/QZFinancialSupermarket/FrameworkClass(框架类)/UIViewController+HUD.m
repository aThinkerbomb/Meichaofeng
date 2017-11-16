/************************************************************
  *  * EaseMob CONFIDENTIAL 
  * __________________ 
  * Copyright (C) 2013-2014 EaseMob Technologies. All rights reserved. 
  *  
  * NOTICE: All information contained herein is, and remains 
  * the property of EaseMob Technologies.
  * Dissemination of this information or reproduction of this material 
  * is strictly forbidden unless prior written permission is obtained
  * from EaseMob Technologies.
  */

#import "UIViewController+HUD.h"
#import "MBProgressHUD.h"
#import <objc/runtime.h>
#define IS_IPHONE_5 ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON )

static const void *HttpRequestHUDKey = &HttpRequestHUDKey;

@implementation UIViewController (HUD)

- (MBProgressHUD *)HUD{
    return objc_getAssociatedObject(self, HttpRequestHUDKey);
}

- (void)setHUD:(MBProgressHUD *)HUD{
    objc_setAssociatedObject(self, HttpRequestHUDKey, HUD, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (void)showHudHint:(NSString *)hint{
    [self showHudInView:self.view hint:hint];
}

- (void)showHudInView:(UIView *)view hint:(NSString *)hint{
    MBProgressHUD *HUD = [[MBProgressHUD alloc] initWithView:view];
    HUD.label.text = hint;
    [view addSubview:HUD];
    [HUD showAnimated:YES];
    [self setHUD:HUD];
}

- (void)showHint:(NSString *)hint{
    [self showHint:hint yOffset:0];//IS_IPHONE_5?200.f:150.f
}


- (void)showHint:(NSString *)hint yOffset:(float)yOffset{
    [self showHint:hint yOffset:yOffset andAfterDelay:2];
}
- (void)showHint:(NSString *)hint yOffset:(float)yOffset andAfterDelay:(NSTimeInterval)delay{
    //显示提示信息
    UIView *view = [[UIApplication sharedApplication].delegate window];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.userInteractionEnabled = NO;
    hud.mode = MBProgressHUDModeText;
    hud.label.text = hint;
    hud.margin = 10.f;
    hud.offset  = CGPointMake(hud.offset.x, hud.offset.y + yOffset);
    hud.removeFromSuperViewOnHide = YES;
    [hud hideAnimated:YES afterDelay:2];
}

- (void)hideHud{
    [self hideHudWith:self.view];
}
- (void)hideHudWith:(UIView *)view{
    for (UIView *subView in view.subviews) {
        if([subView isKindOfClass:[MBProgressHUD class]]){
            [subView removeFromSuperview];
        }
    }
    [[self HUD] hideAnimated:YES];
}
- (void)showDesHint:(NSString *)hint yOffset:(float)yOffset{
    //显示提示信息
    UIView *view = [[UIApplication sharedApplication].delegate window];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.userInteractionEnabled = NO;
    hud.mode = MBProgressHUDModeText;
    hud.detailsLabel.text = hint;
    hud.margin = 10.f;
    hud.offset  = CGPointMake(hud.offset.x, hud.offset.y + yOffset);
    hud.removeFromSuperViewOnHide = YES;
}
- (void)hideDesView{
    UIView *view = [[UIApplication sharedApplication].delegate window];
    for (UIView *subView in view.subviews) {
        if([subView isKindOfClass:[MBProgressHUD class]]){
            [subView removeFromSuperview];
        }
    }
    [[self HUD] hideAnimated:YES];
}



@end
