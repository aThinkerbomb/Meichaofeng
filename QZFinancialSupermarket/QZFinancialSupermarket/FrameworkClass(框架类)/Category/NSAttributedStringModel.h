//
//  NSAttributedStringModel.h
//  QIZiDaiDemo
//
//  Created by wzh on 17/4/1.
//  Copyright © 2017年 xue. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSAttributedStringModel : NSObject

//需要设置的字符串
@property (nonatomic, copy) NSString *string;
// 需要设置的字体
@property (nonatomic, strong) UIFont *font;
//需要设置的颜色
@property (nonatomic, strong) UIColor *color;

+ (NSAttributedStringModel *)string:(NSString *)string font:(UIFont *)font color:(UIColor *)color;
@end
