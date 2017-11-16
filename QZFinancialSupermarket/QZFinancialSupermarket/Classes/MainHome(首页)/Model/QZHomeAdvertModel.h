//
//  QZHomeAdvertModel.h
//  QZFinancialSupermarket
//
//  Created by 张宇轩 on 2017/11/1.
//  Copyright © 2017年 wzh. All rights reserved.
//

#import "ZHBaseCellModel.h"

@interface QZHomeAdvertModel : ZHBaseCellModel

@property (nonatomic, copy) NSString * advertId;
@property (nonatomic, copy) NSString * name;
@property (nonatomic, copy) NSString * mobile;
@property (nonatomic, copy) NSString * money;

@end
