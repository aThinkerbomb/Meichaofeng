//
//  QZNewProductCell.h
//  QZFinancialSupermarket
//
//  Created by 张宇轩 on 2017/10/31.
//  Copyright © 2017年 wzh. All rights reserved.
//

#import "ZHBaseTableViewCell.h"
@class HomeNewProductModel;
@protocol productDelegate;

@interface QZNewProductCell : ZHBaseTableViewCell

@property (nonatomic, assign)id<productDelegate>delegate;
@end

@protocol productDelegate <NSObject>
- (void)selectedModel:(HomeNewProductModel *)model;

@end
