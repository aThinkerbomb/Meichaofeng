//
//  UIButton+Extension.h
//  QZFinancialSupermarket
//
//  Created by wzh on 17/3/20.
//
//

#import <UIKit/UIKit.h>

@interface UIButton (Extension)

- (void)backgroundColor:(UIColor *)backgroundColor title:(NSString *)title titleColor:(UIColor *)titleColor imageName:(NSString *)imageName titleFont:(UIFont *)font;
- (void)title:(NSString *)title imageName:(NSString *)imageName titleFont:(UIFont *)font;

- (void)title:(NSString *)title titleFont:(UIFont *)font;
- (void)title:(NSString *)title titleColor:(UIColor *)titleColor titleFont:(UIFont *)font;
- (void)title:(NSString *)title titleColor:(UIColor *)titleColor backgroundColor:(UIColor *)backgroundColor;
- (void)title:(NSString *)title titleColor:(UIColor *)titleColor
    imageName:(NSString *)imageName titleFont:(UIFont *)font;

- (void)title:(NSString *)title titleColor:(UIColor *)titleColor titleFont:(UIFont *)font backgroundColor:(UIColor *)backgroundColor;
@end
