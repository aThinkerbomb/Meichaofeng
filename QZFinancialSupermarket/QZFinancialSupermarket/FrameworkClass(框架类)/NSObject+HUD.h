//
//  NSObject+HUD.h
//  QZFinancialSupermarket
//
//  Created by wzh on 17/3/14.
//
//

#import <Foundation/Foundation.h>

@interface NSObject (HUD)
- (void)show_objectHudInView:(UIView *)view hint:(NSString *)hint;
- (void)hideHudInView:(UIView *)view;
- (void)showHint_object:(NSString *)hint;
- (void)showHint_object:(NSString *)hint yOffset:(float)yOffset;
- (void)showHint_object:(NSString *)hint yOffset:(float)yOffset andAfterDelay:(NSTimeInterval)delay view:(UIView *)view;

// MB 提示后 操作
- (void)showHint:(NSString*)hint delayDo:(void (^)())delay;

@end
