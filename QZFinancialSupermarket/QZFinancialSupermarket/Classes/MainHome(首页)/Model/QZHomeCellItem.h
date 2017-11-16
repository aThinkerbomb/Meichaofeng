//
//  QZHomeCellItem.h
//  QZFinancialSupermarket
//
//  Created by wzh on 2017/9/14.
//  Copyright © 2017年 wzh. All rights reserved.
//

#import "ZHBaseCellModel.h"

@class HomeHotModel;

@interface QZHomeCellItem : ZHBaseCellModel

@property (nonatomic, strong) NSArray *banner;
@property (nonatomic, strong) NSArray *recommend;
@property (nonatomic, strong) NSArray *everyday;
@property (nonatomic, strong) NSArray *cont;

@end
