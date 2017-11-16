//
//  UIButton+ImageTitleSpacing.h
//  button
//
//  Created by wzh on 16/10/28.
//  Copyright © 2016年 wzh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (ImageTitleSpacing)

typedef NS_ENUM(NSUInteger, ZH_ButtonEdgeInsetsStyle) {
    ZH_ButtonEdgeInsetsStyleTop, // image在上，label在下
    ZH_ButtonEdgeInsetsStyleLeft, // image在左，label在右
    ZH_ButtonEdgeInsetsStyleBottom, // image在下，label在上
    ZH_ButtonEdgeInsetsStyleRight // image在右，label在左
};

/**
 *  设置button的titleLabel和imageView的布局样式，及间距
 *
 *  @param style titleLabel和imageView的布局样式
 *  @param space titleLabel和imageView的间距
 */
- (void)layoutButtonWithEdgeInsetsStyle:(ZH_ButtonEdgeInsetsStyle)style
                        imageTitleSpace:(CGFloat)space;

- (void)layoutButtonWithEdgeInsetsStyle:(ZH_ButtonEdgeInsetsStyle)style;

@end
