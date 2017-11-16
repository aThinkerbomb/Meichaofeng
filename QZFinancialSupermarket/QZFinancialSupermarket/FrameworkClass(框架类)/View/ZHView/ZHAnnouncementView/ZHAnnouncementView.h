//
//  ZHAnnouncementView.h
//  QIZiDaiDemo
//
//  Created by wzh on 17/3/27.
//  Copyright © 2017年 xue. All rights reserved.
//

#import <UIKit/UIKit.h>



@class ZHAnnouncementView;

@protocol ZHAnnouncementViewDelegate <NSObject>

@optional
- (void)didAnnouncementView:(ZHAnnouncementView *)announcementView currentIndex:(NSInteger)currentIndex;

@end
@interface ZHAnnouncementView : UIView

@property (nonatomic, strong) NSArray *dataArray;
/** 自动滑动间隔时间(s), 默认为 3.0 */
@property (nonatomic, assign) IBInspectable CGFloat scrollInterval;

@property (nonatomic, weak) __weak id<ZHAnnouncementViewDelegate>delegate;


//- (void)reloadData;

- (void)startTimer;
- (void)stopTimer;
@end
