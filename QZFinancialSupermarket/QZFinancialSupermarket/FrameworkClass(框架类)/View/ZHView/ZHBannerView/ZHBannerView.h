//
//  ZHBannerView.h
//  轮播
//
//  Created by wzh on 16/12/12.
//  Copyright © 2016年 wzh. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "ZHBannerFooter.h"
#import "ZHPageControlView.h"
#define PageView_H 50 *([UIScreen mainScreen].bounds.size.width / 375.0)

typedef NS_ENUM(NSInteger, ZHBannerViewScrollDirection) {
    ZHBannerViewScrollDirectionVerticalLeft,
    ZHBannerViewScrollDirectionVerticalTop,
    ZHBannerViewScrollDirectionVerticalRight,
    ZHBannerViewScrollDirectionVerticalBottom
};

typedef NS_ENUM(NSInteger, ZHBannerViewType) {
    ZHBannerViewTypeDefaut,
    ZHBannerViewTypeScrollToNoticeView
};
@protocol ZHBannerViewDataSource, ZHBannerViewDelegate;

@interface ZHBannerView : UIView
@property (nonatomic, strong) UICollectionView *collectionView;

/** 是否需要循环滚动, 默认为 NO */
@property (nonatomic, assign) IBInspectable BOOL shouldLoop;

/** 是否显示footer, 默认为 NO (此属性为YES时, shouldLoop会被置为NO) */
@property (nonatomic, assign) IBInspectable BOOL showFooter;

/** 是否自动滑动, 默认为 NO */
@property (nonatomic, assign) IBInspectable BOOL autoScroll;

/** 自动滑动间隔时间(s), 默认为 3.0 */
@property (nonatomic, assign) IBInspectable CGFloat scrollInterval;

/** pageControl, 可自由配置其属性 */
@property (nonatomic, strong, readonly) UIPageControl *pageControl;
@property (nonatomic, assign, readwrite)  CGRect pageControlFrame;

@property (nonatomic, weak) IBOutlet id<ZHBannerViewDataSource> dataSource;
@property (nonatomic, weak) IBOutlet id<ZHBannerViewDelegate> delegate;

- (void)reloadData;
- (void)dropDownReloadData;

- (void)startTimer;
- (void)stopTimer;


/*
 * wzh 后添加
 */
@property (nonatomic, strong) ZHPageControlView *pageControlView;
//默认向左移动   UICollectionViewScrollDirectionHorizontal
@property (nonatomic, assign) ZHBannerViewScrollDirection scrollDirection;
//默认 Yes
@property (nonatomic, assign) IBInspectable BOOL isManual;

@property (nonatomic, assign) ZHBannerViewType bannerViewType;

@end

@protocol ZHBannerViewDataSource <NSObject>
@required

- (NSInteger)numberOfItemsInBanner:(ZHBannerView *)banner;
- (UIView *)banner:(ZHBannerView *)banner viewForItemAtIndex:(NSInteger)index;

@optional

- (NSString *)banner:(ZHBannerView *)banner titleForFooterWithState:(ZHBannerFooterState)footerState;

@end

@protocol ZHBannerViewDelegate <NSObject>
@optional

- (void)banner:(ZHBannerView *)banner didSelectItemAtIndex:(NSInteger)index;
- (void)bannerFooterDidTrigger:(ZHBannerView *)banner;

@end
