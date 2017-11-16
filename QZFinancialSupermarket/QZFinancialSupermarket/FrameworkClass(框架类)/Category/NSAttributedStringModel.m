//
//  NSAttributedStringModel.m
//  QIZiDaiDemo
//
//  Created by wzh on 17/4/1.
//  Copyright © 2017年 xue. All rights reserved.
//

#import "NSAttributedStringModel.h"

@implementation NSAttributedStringModel

+ (NSAttributedStringModel *)string:(NSString *)string font:(UIFont *)font color:(UIColor *)color{
    NSAttributedStringModel *model = [[NSAttributedStringModel alloc]init];
    model.string = string;
    model.font = font;
    model.color = color;
    return model;
}

@end
