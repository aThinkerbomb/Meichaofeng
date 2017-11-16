//
//  ZHMyInestmentSelectView.h
//  QIZiDaiDemo
//
//  Created by wzh on 17/3/23.
//  Copyright © 2017年 xue. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZHDropDownSelectView;
@protocol ZHMyInestmentSelectViewDataSource <NSObject>
@required
- (NSInteger)numberOfItemsInSeletView:(ZHDropDownSelectView *)selectView;
- (UIView *)selectView:(ZHDropDownSelectView *)selectView viewForItemAtIndex:(NSInteger)index;
@optional
- (CGSize)itemSizeWithSelectView:(ZHDropDownSelectView *)selectView indexPath:(NSIndexPath *)indexPath;
@end
@protocol ZHMyInestmentSelectViewDelegate <NSObject>
@optional

- (void)selectView:(ZHDropDownSelectView *)selectView didSelectItemAtIndex:(NSInteger)index;

- (void)closeSelectView;

@end
@interface ZHDropDownSelectView : UIView

@property (nonatomic, assign) NSTimeInterval duration;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, assign) NSInteger selectIndex;
@property (nonatomic, weak) __weak id<ZHMyInestmentSelectViewDelegate>delegate;
@property (nonatomic, weak) __weak id<ZHMyInestmentSelectViewDataSource>dataSource;
- (void)startAnimation;
- (void)closeAnimtion;

@end
