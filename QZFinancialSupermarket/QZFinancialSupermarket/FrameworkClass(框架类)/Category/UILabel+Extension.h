//
//  UILabel+Extension.h
//  QZFinancialSupermarket
//
//  Created by wzh on 17/3/20.
//
//

#import <UIKit/UIKit.h>

@interface UILabel (Extension)
- (void)text:(NSString *)text backgroundColor:(UIColor *)backgroundColor textColor:(UIColor *)textColor textFont:(UIFont *)font;
- (void)text:(NSString *)text textColor:(UIColor *)textColor textFont:(UIFont *)font;
- (void)text:(NSString *)text textFont:(UIFont *)font;
- (void)textColor:(UIColor *)textColor textFont:(UIFont *)font;
- (void)text:(NSString *)text backgroundColor:(UIColor *)backgroundColor  textColor:(UIColor *)textColor textFont:(UIFont *)font attributedText:(NSString *)attributedText lineSpacing:(CGFloat)lineSpacing;
- (void)attributedText:(NSString *)attributedText textColor:(UIColor *)textColor textFont:(UIFont *)font;
- (void)lineSpacing:(CGFloat)lineSpacing;
- (void)attributedText:(NSString *)attributedText  textColor:(UIColor *)textColor textFont:(UIFont *)font  lineSpacing:(CGFloat)lineSpacing;
- (void)setLineSpace:(CGFloat)lineSpace string:(NSString *)string;

/**
 设置行间距

 @param lineSpace 间距
 */
- (void)setLineSpace:(CGFloat)lineSpace;

/**
 头部缩进

 @param IndentSpace 间距
 */
- (void)setHeadIndentSpace:(CGFloat)IndentSpace;
@end
