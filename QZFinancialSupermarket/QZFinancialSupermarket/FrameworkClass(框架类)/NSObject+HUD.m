//
//  NSObject+HUD.m
//  QZFinancialSupermarket
//
//  Created by wzh on 17/3/14.
//
//

#import "NSObject+HUD.h"
#import <objc/runtime.h>
#import <MBProgressHUD/MBProgressHUD.h>
#define IS_IPHONE_5 ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON )

static const void *HttpRequestHUDKey = &HttpRequestHUDKey;


@implementation NSObject (HUD)

- (MBProgressHUD *)HUD{
    return objc_getAssociatedObject(self, HttpRequestHUDKey);
}
- (void)setHUD:(MBProgressHUD *)HUD{
    objc_setAssociatedObject(self, HttpRequestHUDKey, HUD, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)show_objectHudInView:(UIView *)view hint:(NSString *)hint{
    MBProgressHUD *HUD = [[MBProgressHUD alloc] initWithView:view];
    HUD.label.text = hint;
    [view addSubview:HUD];
    [HUD showAnimated:YES];
    [self setHUD:HUD];
}



- (void)showHint_object:(NSString *)hint{
    [self showHint_object:hint yOffset:0];
}

- (void)showHint_object:(NSString *)hint yOffset:(float)yOffset {
    [self showHint_object:hint yOffset:yOffset andAfterDelay:2 view:nil];
}

- (void)showHint_object:(NSString *)hint view:(UIView *)view{
    [self showHint_object:hint yOffset:-1 andAfterDelay:2 view:view];
}
- (void)showHint_object:(NSString *)hint yOffset:(float)yOffset view:(UIView *)view{
    [self showHint_object:hint yOffset:yOffset andAfterDelay:2 view:view];
}

- (void)showHint_object:(NSString *)hint yOffset:(float)yOffset andAfterDelay:(NSTimeInterval)delay view:(UIView *)view{
    //显示提示信息
    if(!view){
        view = [[UIApplication sharedApplication].delegate window];
    }
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.userInteractionEnabled = NO;
    // Configure for text only and offset down
    hud.label.text = hint;
    hud.margin = 10.f;
    hud.removeFromSuperViewOnHide = YES;
    
    hud.mode = MBProgressHUDModeText;
    hud.offset = CGPointMake(hud.offset.x, yOffset);
    
    [hud hideAnimated:YES afterDelay:delay];
}

- (void)hideHudInView:(UIView *)view{
    for (UIView *subView in view.subviews) {
        if([subView isKindOfClass:[MBProgressHUD class]]){
            [subView removeFromSuperview];
        }
    }
    [[self HUD] hideAnimated:YES];
}

- (void)showHint:(NSString*)hint delayDo:(void (^)())delay{
    [self showHint_object:hint yOffset:0];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(HUDTime * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (delay) {
            delay();
        }
    });
}
@end
