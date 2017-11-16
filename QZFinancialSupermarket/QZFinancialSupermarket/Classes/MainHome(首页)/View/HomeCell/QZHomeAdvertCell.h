//
//  QZHomeAdvertCell.h
//  QZFinancialSupermarket
//
//  Created by 张宇轩 on 2017/11/1.
//  Copyright © 2017年 wzh. All rights reserved.
//

#import "ZHBaseTableViewCell.h"

@protocol HomeAdvertDelegate;


@interface QZHomeAdvertCell : ZHBaseTableViewCell

@property (nonatomic, assign) id<HomeAdvertDelegate>delegate;

@end

@protocol HomeAdvertDelegate <NSObject>
@optional

- (void)homeClickedAdvertAtIndex:(NSInteger)index;


@end
