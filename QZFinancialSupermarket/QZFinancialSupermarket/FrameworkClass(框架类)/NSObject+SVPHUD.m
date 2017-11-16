//
//  UIViewController+SVPHUD.m
//  QZFinancialSupermarket
//
//  Created by wzh on 17/3/10.
//
//

#import "NSObject+SVPHUD.h"
#import "SVProgressHUD.h"
@implementation NSObject (SVPHUD)
- (void)showHudWithHint:(NSString *)hint{
    [SVProgressHUD showErrorWithStatus:hint];
    [self showHint];
}

- (void)showSuccessStatus:(NSString*)status{
    [SVProgressHUD showSuccessWithStatus:status];
    [self showHint];
}

- (void)showSuccessStatusa:(NSString*)status delayDo:(void (^)())delay{
    [SVProgressHUD showSuccessWithStatus:status];
    [self showHint];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(HUDTime * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (delay) {
            delay();
        }
    });
}

- (void)showHint{
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleLight];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(HUDTime * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [SVProgressHUD dismiss];
    });
}

@end
