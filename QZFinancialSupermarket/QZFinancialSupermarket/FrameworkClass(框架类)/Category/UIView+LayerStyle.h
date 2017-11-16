//
//  UIView+LayerStyle.h
//  
//
//  Created by wzh on 16/5/16.
//  Copyright © 2016年 wzh. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIView (LayerStyle)
- (void)styleWithDefaut;
- (void)styleWithCornerRadius:(CGFloat)cornerRadius;
/**
 *  设置圆角
 *
 *  @param cornerRadius 圆角半径
 *  @param borderColor  边框颜色
 *  @param borderWidth  边框宽度
 */
- (void)styleWithCornerRadius:(CGFloat)cornerRadius borderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth;
/**
 *  描边
 *
 *  @param cornerRadius 圆角半径
 *  @param borderColor  边框颜色
 *  @param borderWidth  边框宽度
 *  @param shadowColor   阴影颜色
 *  @param shadowOffset  阴影偏移量
 *  @param shadowOpacity 阴影透明度
 *  @param shadowRadius  阴影半径
 */
- (void)styleWithCornerRadius:(CGFloat)cornerRadius
                  borderColor:(UIColor *)borderColor
                  borderWidth:(CGFloat)borderWidth
                  shadowColor:(UIColor *)shadowColor
                 shadowOffset:(CGSize)shadowOffset
                shadowOpacity:(CGFloat)shadowOpacity
                 shadowRadius:(CGFloat)shadowRadius;

- (void)styleWithCornerRadius:(CGFloat)cornerRadius
                  shadowColor:(UIColor *)shadowColor
                 shadowOffset:(CGSize)shadowOffset
                shadowOpacity:(CGFloat)shadowOpacity
                 shadowRadius:(CGFloat)shadowRadius;
@end
