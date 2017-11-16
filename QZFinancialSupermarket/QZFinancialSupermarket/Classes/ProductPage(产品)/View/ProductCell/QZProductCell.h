//
//  QZProductCell.h
//  QZFinancialSupermarket
//
//  Created by wzh on 2017/9/13.
//  Copyright © 2017年 wzh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZHBaseTableViewCell.h"

@protocol ProductCellDelegate;

@interface QZProductCell : ZHBaseTableViewCell

@property (nonatomic, assign)id <ProductCellDelegate> delegate;

@end

@protocol ProductCellDelegate <NSObject>
@optional
- (void)gotoProductDetail;

@end
