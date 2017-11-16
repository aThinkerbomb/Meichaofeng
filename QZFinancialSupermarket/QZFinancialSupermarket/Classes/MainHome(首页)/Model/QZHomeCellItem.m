//
//  QZHomeCellItem.m
//  QZFinancialSupermarket
//
//  Created by wzh on 2017/9/14.
//  Copyright © 2017年 wzh. All rights reserved.
//

#import "QZHomeCellItem.h"

@implementation QZHomeCellItem


+ (nullable NSDictionary<NSString *, id> *)modelContainerPropertyGenericClass {
    return @{
             @"recommend": @"HomeRecommendModel",
             @"everyday": @"HomeNewProductModel",
             @"banner": @"HomeBannerModel",
             @"cont":@"QZHomeAdvertModel"
             };
}

@end

