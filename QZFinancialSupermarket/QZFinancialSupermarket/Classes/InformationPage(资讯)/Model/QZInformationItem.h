//
//  QZInformationItem.h
//  QZFinancialSupermarket
//
//  Created by wzh on 2017/9/14.
//  Copyright © 2017年 wzh. All rights reserved.
//

#import "ZHBaseCellModel.h"

@interface QZInformationItem : ZHBaseCellModel

// 轮播图
@property (nonatomic, strong) NSArray * carousel;

// 咨询数据
@property (nonatomic, strong) NSArray * data1;

@end
