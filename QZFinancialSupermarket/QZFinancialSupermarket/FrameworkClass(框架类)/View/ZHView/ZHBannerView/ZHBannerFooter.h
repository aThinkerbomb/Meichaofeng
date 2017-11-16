//
//  ZHBannerFooter.h
//  轮播
//
//  Created by wzh on 16/12/12.
//  Copyright © 2016年 wzh. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, ZHBannerFooterState) {
    ZHBannerFooterStateIdle = 0,    // 正常状态下的footer提示
    ZHBannerFooterStateTrigger,     // 被拖至触发点的footer提示
};

@interface ZHBannerFooter : UICollectionReusableView

@property (nonatomic, assign) ZHBannerFooterState state;

@property (nonatomic, strong) UIImageView *arrowView;
@property (nonatomic, strong) UILabel *label;

@property (nonatomic, copy) NSString *idleTitle;
@property (nonatomic, copy) NSString *triggerTitle;

@end
