//
//  ActivityScroll.h
//  ThemeActivityScroll
//
//  Created by 张宇轩 on 2017/10/26.
//  Copyright © 2017年 宇轩. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^dataSourceHandle)(NSInteger index, UIImageView *imageView);
typedef void(^clickedIndexHandle)(NSInteger index);

@interface ActivityScroll : UIView

// 初始化方法
- (instancetype)initWithFrame:(CGRect)frame total:(NSInteger)total currentShowData:(dataSourceHandle)dataHandle clickedIndex:(clickedIndexHandle)indexHandle;

// 显示
- (void)showWith:(UIView *)view;

// 关闭
- (void)closeShow;
@end
