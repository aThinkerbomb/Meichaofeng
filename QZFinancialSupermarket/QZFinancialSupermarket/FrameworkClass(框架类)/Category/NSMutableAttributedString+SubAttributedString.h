//
//  NSMutableAttributedString+SubAttributedString.h
//  text
//
//  Created by wzh on 16/5/18.
//  Copyright © 2016年 wzh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "NSAttributedStringModel.h"

@interface NSMutableAttributedString (SubAttributedString)
#pragma mark - -设置指定类型的style
+ (NSMutableAttributedString *)atttibuteWithStr:(NSString *)str followStr:(NSString *)followStr font:(UIFont *)strFont;
+ (NSMutableAttributedString *)atttibuteWithStr:(NSString *)str followStr:(NSString *)followStr strColor:(UIColor *)strColor;
+ (NSMutableAttributedString *)atttibuteWithStr:(NSString *)str font:(UIFont *)strFont;
+ (NSMutableAttributedString *)atttibuteWithStr:(NSString *)str  strColor:(UIColor *)strColor;+ (NSMutableAttributedString *)atttibuteWithStr:(NSString *)str followStr:(NSString *)followStr strColor:(UIColor *)strColor andFont:(UIFont *)strFont;



#pragma mark -- 设置字体  倾斜 颜色 大小

+ (NSAttributedString *)attributeWithTotalStr:(NSString *)totalStr
                               andSubStrColor:(UIColor *)subStrColor;

+ (NSAttributedString *)attributeWithTotalStr:(NSString *)totalStr
                                   subStrFont:(UIFont *)subStrFont;

+ (NSAttributedString *)attributeWithTotalStr:(NSString *)totalStr
                             andWholeTiltSize:(float)wholeTiltSize;

+ (NSAttributedString *)attributeWithTotalStr:(NSString *)totalStr
                                  subStrColor:(UIColor *)subStrColor
                             andWholeTiltSize:(float)wholeTiltSize;

+ (NSAttributedString *)attributeWithTotalStr:(NSString *)totalStr
                                   subStrFont:(UIFont *)subStrFont
                             andWholeTiltSize:(float)wholeTiltSize;

+ (NSAttributedString *)attributeWithTotalStr:(NSString *)totalStr
                                   subStrFont:(UIFont *)subStrFont
                                  subStrColor:(UIColor *)subStrColor
                             andWholeTiltSize:(float)wholeTiltSize;

+ (NSAttributedString *)attributeWithTotalStr:(NSString *)totalStr
                                       subStr:(NSString *)subStr
                               andSubStrColor:(UIColor *)subStrColor;


+ (NSAttributedString *)attributeWithTotalStr:(NSString *)totalStr
                                       subStr:(NSString *)subStr
                                   subStrFont:(UIFont *)subStrFont;

+ (NSAttributedString *)attributeWithTotalStr:(NSString *)totalStr
                                       subStr:(NSString *)subStr
                                   subStrFont:(UIFont *)subStrFont
                                     tiltSize:(float)tiltSize;

+ (NSAttributedString *)attributeWithTotalStr:(NSString *)totalStr
                                       subStr:(NSString *)subStr
                                   subStrFont:(UIFont *)subStrFont
                             andWholeTiltSize:(float)wholeTiltSize;

+ (NSAttributedString *)attributeWithTotalStr:(NSString *)totalStr
                                       subStr:(NSString *)subStr
                                  subStrColor:(UIColor *)subStrColor
                                     tiltSize:(float)tiltSize;

+ (NSAttributedString *)attributeWithTotalStr:(NSString *)totalStr
                                       subStr:(NSString *)subStr
                                  subStrColor:(UIColor *)subStrColor
                             andWholeTiltSize:(float)wholeTiltSize;

+ (NSAttributedString *)attributeWithTotalStr:(NSString *)totalStr
                                       subStr:(NSString *)subStr
                             andWholeTiltSize:(float)wholeTiltSize;

+ (NSAttributedString *)attributeWithTotalStr:(NSString *)totalStr
                                       subStr:(NSString *)subStr
                                  andTiltSize:(float)tiltSize;

+ (NSAttributedString *)attributeWithTotalStr:(NSString *)totalStr
                                       subStr:(NSString *)subStr
                                     tiltSize:(float)tiltSize
                                     andWhole:(BOOL)whole;

+ (NSAttributedString *)attributeWithTotalStr:(NSString *)totalStr
                                       subStr:(NSString *)subStr
                                   subStrFont:(UIFont *)subStrFont
                               andSubStrColor:(UIColor *)subStrColor;

+ (NSAttributedString *)attributeWithTotalStr:(NSString *)totalStr
                                       subStr:(NSString *)subStr
                                   subStrFont:(UIFont *)subStrFont
                                  subStrColor:(UIColor *)subStrColor
                             andWholeTiltSize:(float)wholeTiltSize;

+ (NSAttributedString *)attributeWithTotalStr:(NSString *)totalStr
                                       subStr:(NSString *)subStr
                                   subStrFont:(UIFont *)subStrFont
                                  subStrColor:(UIColor *)subStrColor
                                  andTiltSize:(float)tiltSize;

+ (NSAttributedString *)attributeWithTotalStr:(NSString *)totalStr
                                       subStr:(NSString *)subStr
                                   subStrFont:(UIFont *)subStrFont
                                     tiltSize:(float)tiltSize
                                     andWhole:(BOOL)whole;

+ (NSAttributedString *)attributeWithTotalStr:(NSString *)totalStr
                                       subStr:(NSString *)subStr
                                  subStrColor:(UIColor *)subStrColor
                                     tiltSize:(float)tiltSize
                                     andWhole:(BOOL)whole;
//3段式数字处理
+ (NSAttributedString *)attributeWithFirstStr:(NSString *)firstStr
                                       MidStr:(NSString *)subStr
                                      lastStr:(NSString *)lastStr
                                 FirstStrFont:(CGFloat)firstStrFont
                                   MidStrFont:(CGFloat)midStrFont
                                  LastStrFont:(CGFloat)lastStrFont
                                FirstStrColor:(UIColor *)firstStrColor
                                  MidStrColor:(UIColor *)midStrColor
                                 LastStrColor:(UIColor *)lastStrColor;

//3段式文字与数字混合处理
+ (NSAttributedString *)attributeWithFirstStr:(NSString *)firstStr
                                       SubStr:(NSString *)subStr
                                      LastStr:(NSString *)lastStr
                                 FirstStrFont:(CGFloat)firstStrFont
                                   SubStrFont:(CGFloat)subStrFont
                                  LastStrFont:(CGFloat)lastStrFont
                                FirstStrColor:(UIColor *)firstStrColor
                                  SubStrColor:(UIColor *)subStrColor
                                 LastStrColor:(UIColor *)lastStrColor;

//2段式文字处理
+ (NSAttributedString *)attributeWithFirstStr:(NSString *)firstStr
                                      lastStr:(NSString *)lastStr
                                 FirstStrFont:(CGFloat)firstStrFont
                                  LastStrFont:(CGFloat)lastStrFont
                                FirstStrColor:(UIColor *)firstStrColor
                                 LastStrColor:(UIColor *)lastStrColor;

+ (NSAttributedString *)attributeWithTotalStr:(NSString *)totalStr
                                       subStr:(NSString *)subStr
                                   subStrFont:(UIFont *)subStrFont
                                  subStrColor:(UIColor *)subStrColor
                                     tiltSize:(float)tiltSize
                                     andWhole:(BOOL)whole;

+ (NSAttributedString *)attributeWithTotalStr:(NSString *)totalStr
                                        range:(NSRange)range
                                   subStrFont:(UIFont *)subStrFont;


+ (NSAttributedString *)attributeWithTotalStr:(NSString *)totalStr
                                        range:(NSRange)range
                                   subStrFont:(UIFont *)subStrFont
                                  subStrColor:(UIColor *)subStrColor
                                     tiltSize:(float)tiltSize
                                     andWhole:(BOOL)whole;
+ (NSAttributedString *)attributeWithArray:(NSArray<NSAttributedStringModel *> *)attributeArray;
@end
