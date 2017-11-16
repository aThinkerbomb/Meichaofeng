//
//  UIColor+Extension.h
//  QZFinancialSupermarket
//
//  Created by wzh on 17/2/28.
//
//

#import <UIKit/UIKit.h>

@interface UIColor (Extension)
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;
+ (UIColor *)colorWithHexString:(NSString *)color;
+ (UIColor *)colorWithPatternImageName:(NSString *)imageName;
@end
