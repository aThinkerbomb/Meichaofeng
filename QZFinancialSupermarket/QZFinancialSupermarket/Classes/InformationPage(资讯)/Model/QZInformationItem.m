//
//  QZInformationItem.m
//  QZFinancialSupermarket
//
//  Created by wzh on 2017/9/14.
//  Copyright © 2017年 wzh. All rights reserved.
//

#import "QZInformationItem.h"

@implementation QZInformationItem

+ (nullable NSDictionary<NSString *, id> *)modelContainerPropertyGenericClass {
    return @{
             @"carousel": @"QZInfoCarousel",
             @"data1": @"QZInfoDataModel"
             };
}



@end
