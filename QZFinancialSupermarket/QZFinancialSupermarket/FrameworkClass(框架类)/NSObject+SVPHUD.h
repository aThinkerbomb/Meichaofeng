//
//  UIViewController+SVPHUD.h
//  QZFinancialSupermarket
//
//  Created by wzh on 17/3/10.
//
//

#import <UIKit/UIKit.h>

@interface NSObject (SVPHUD)
- (void)showHudWithHint:(NSString *)hint;
- (void)showSuccessStatus:(NSString*)status;

/**
 展示完信息后做处理

 @param status info
 @param delay 处理操作
 */
- (void)showSuccessStatusa:(NSString*)status delayDo:(void (^)())delay;

@end
