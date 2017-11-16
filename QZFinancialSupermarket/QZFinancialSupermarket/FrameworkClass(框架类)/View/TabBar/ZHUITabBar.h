//
//  ZHUITabBar.h
//  
//
//  Created by wzh on 16/5/9.
//  Copyright © 2016年 wzh All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, ZHUITabBarType) {
    ZHUITabBarTypeCustom = 0,
    ZHUITabBarTypePlus
};

@class ZHUITabBar;

@protocol ZHUITabBarDelegate <NSObject>

@optional
- (void)tabBarDidClickedPlusButton:(ZHUITabBar *)tabBar;
@end

@interface ZHUITabBar : UITabBar
@property (nonatomic, weak) id<ZHUITabBarDelegate> tabBarDelegate;
@property (nonatomic, assign) ZHUITabBarType tabbarType;

@end
