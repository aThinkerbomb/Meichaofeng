//
//  UIBarButtonItem+Extension.h
//  QZFinancialSupermarket
//
//  Created by wzh on 17/3/6.
//
//

#import <UIKit/UIKit.h>
@interface UIBarButtonItem (Extension)
/**
 *  通过图片创建item
 *
 *  @param image     图片
 *  @param highImage 高亮图片
 *  @param action    点击后调用的方法
 */
+ (instancetype)itemWithImage:(NSString *)image highImage:(NSString *)highImage target:(id)target action:(SEL)action;
+ (UIBarButtonItem *)itemWithImageName:(NSString *)imageName target:(id)target action:(SEL)action;

+ (UIBarButtonItem *)itemWithBgImageName:(NSString *)bgImageName target:(id)target action:(SEL)action;
+ (instancetype)itemWithBgImage:(NSString *)bgImageName bgHighImage:(NSString *)bgHighImage target:(id)target action:(SEL)action;

+ (UIBarButtonItem *)itemWithTitle:(NSString *)title target:(id)target action:(SEL)action;
+ (UIBarButtonItem *)itemWithTitle:(NSString *)title font:(UIFont *)font titleColor:(UIColor *)titleColor target:(id)target action:(SEL)action;
+ (UIBarButtonItem *)itemWithTitle:(NSString *)title font:(UIFont *)font titleColor:(UIColor *)titleColor titleEdgeInsets:(UIEdgeInsets)titleEdgeInsets target:(id)target action:(SEL)action;
+ (UIBarButtonItem *)itemWithTitle:(NSString *)title font:(UIFont *)font titleColor:(UIColor *)titleColor titleAlignment:(NSTextAlignment)titleAlignment target:(id)target action:(SEL)action;

@end
