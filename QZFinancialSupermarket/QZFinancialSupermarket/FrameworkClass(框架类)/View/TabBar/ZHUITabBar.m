//
//  ZHUITabBar.m
//  
//
//  Created by wzh on 16/5/9.
//  Copyright © 2016年 wzh All rights reserved.
//

#import "ZHUITabBar.h"

@interface ZHUITabBar()
@property (nonatomic, weak) UIButton *plusButton;
@property (nonatomic, strong) UIView *lineView;
@end
@implementation ZHUITabBar

- (UIView *)lineView{
    if(!_lineView){
        _lineView = [[UIView alloc]init];
        _lineView.backgroundColor = [UIColor grayColor];
        [self addSubview:_lineView];
    }
    return _lineView;
}

- (UIButton *)plusButton{
    if(!_plusButton){
        UIButton *plusButton = [UIButton buttonWithType:UIButtonTypeCustom];
        // 设置背景
        [plusButton setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button"] forState:UIControlStateNormal];
        [plusButton setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button_highlighted"] forState:UIControlStateHighlighted];
        // 设置图标
        [plusButton setImage:[UIImage imageNamed:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
        [plusButton setImage:[UIImage imageNamed:@"tabbar_compose_icon_add_highlighted"] forState:UIControlStateHighlighted];
        [plusButton addTarget:self action:@selector(plusClick) forControlEvents:UIControlEventTouchUpInside];
        // 添加
        _plusButton = plusButton;
        [self addSubview:_plusButton];
    }
    return _plusButton;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
//        self.backgroundImage = [[UIImage alloc]init];
//        self.barStyle = UIBarStyleBlackTranslucent;
        self.backgroundImage = [UIImage imageNamed:@"tabbarBgImg"];
    }
    return self;
}

- (void)plusClick
{
    NSLog(@"plusClick----");
    
    // 通知代理
    if ([self.tabBarDelegate respondsToSelector:@selector(tabBarDidClickedPlusButton:)]) {
        [self.tabBarDelegate tabBarDidClickedPlusButton:self];
    }
}

/**
 *  布局子控件
 */
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    if(_tabbarType == ZHUITabBarTypePlus){
        // 设置plusButton的frame
        [self setupPlusButtonFrame];
    }
    // 设置所有tabbarButton的frame
    [self setupAllTabBarButtonsFrame];
//    [self setupLineFrame];
}

/**
 *  设置所有plusButton的frame
 */
- (void)setupPlusButtonFrame
{
    self.plusButton.size = self.plusButton.currentBackgroundImage.size;
    self.plusButton.center = CGPointMake(self.width * 0.5, self.height * 0.5);
}

- (void)setupLineFrame{
    self.lineView.frame = CGRectMake(0, 0, self.width, 0.5);
}
/**
 *  设置所有tabbarButton的frame
 */
- (void)setupAllTabBarButtonsFrame
{
    int index = 0;
    
    // 遍历所有的button
    for (UIView *tabBarButton in self.subviews) {
        // 如果不是UITabBarButton， 直接跳过
        if (![tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]) continue;
        
        // 根据索引调整位置
        [self setupTabBarButtonFrame:tabBarButton atIndex:index];
        // 索引增加
        index++;
        
    }
}

/**
 *  设置某个按钮的frame
 *
 *  @param tabBarButton 需要设置的按钮
 *  @param index        按钮所在的索引
 */
- (void)setupTabBarButtonFrame:(UIView *)tabBarButton atIndex:(int)index
{
    // 计算button的尺寸
    CGFloat buttonW;
    if(_tabbarType == ZHUITabBarTypePlus){
        buttonW = self.width / (self.items.count + 1);
    }else{
        buttonW = self.width / self.items.count;
    }
    
    
    CGFloat buttonH = self.height;
    if (kDevice_Is_iPhoneX) {
        buttonH = 49;
    }
    tabBarButton.width = buttonW;
    tabBarButton.height = buttonH;
    if (index >= 2 && _tabbarType == ZHUITabBarTypePlus) {
        tabBarButton.x = buttonW * (index + 1);
    } else {
        tabBarButton.x = buttonW * index;
    }
    tabBarButton.y = 0;
}
@end
