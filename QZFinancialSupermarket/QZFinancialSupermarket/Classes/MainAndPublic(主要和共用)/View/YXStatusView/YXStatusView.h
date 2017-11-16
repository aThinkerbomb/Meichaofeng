//
//  YXStatusView.h
//  QZFinancialSupermarket
//
//  Created by 张宇轩 on 2017/11/10.
//  Copyright © 2017年 wzh. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, CurrentShowType) {
    
    // 有数据有网、有数据无网
    CurrentShowTypeHidden = 0,
    
    // 无数据 有网
    CurrentShowTypeNoDataHasNetwork,
    
    // 无数据 无网
    CurrentShowTypeNoNetwork
};


@protocol YXStatusViewDelegate;

@interface YXStatusView : UIView

@property (nonatomic, assign)id <YXStatusViewDelegate> delegate;

@property (nonatomic, assign)CurrentShowType showType;

@end


@protocol YXStatusViewDelegate <NSObject>
@optional
- (void)statusViewClickedAction;

@end
