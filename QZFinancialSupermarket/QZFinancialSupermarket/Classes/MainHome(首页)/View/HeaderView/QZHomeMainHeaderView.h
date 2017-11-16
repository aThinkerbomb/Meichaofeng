//
//  QZHomeMainHeaderView.h
//  QZFinancialSupermarket
//
//  Created by wzh on 2017/9/13.
//  Copyright © 2017年 wzh. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol HomeMainHeaderViewDelegate;

@interface QZHomeMainHeaderView : UIView

@property (nonatomic, assign) id <HomeMainHeaderViewDelegate>delegate;

@property (nonatomic, strong) NSArray *bannerArray;

@end

@protocol HomeMainHeaderViewDelegate<NSObject>
@optional


// 点击banner
- (void)clickedBannerAction:(NSInteger)index;

@end
