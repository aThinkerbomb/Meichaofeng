//
//  HomeBannerModel.h
//  QZFinancialSupermarket
//
//  Created by 张宇轩 on 2017/10/10.
//  Copyright © 2017年 wzh. All rights reserved.
//

#import "ZHBaseModel.h"

@interface HomeBannerModel : ZHBaseModel

@property (nonatomic, copy) NSString * bannerid;
@property (nonatomic, copy) NSString * smallimage;
@property (nonatomic, copy) NSString * hourl;
// 需要统计：1不需要统计为2
@property (nonatomic, copy) NSString * tjstatus;

@end
