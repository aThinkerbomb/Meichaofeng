//
//  QZNewProductModel.m
//  QZFinancialSupermarket
//
//  Created by 张宇轩 on 2017/11/2.
//  Copyright © 2017年 wzh. All rights reserved.
//

#import "QZNewProductModel.h"

@implementation QZNewProductModel

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"productId": @"id"};
}

- (NSString *)cellClassName{
    return @"QZNewProductListCell";
}
- (CGFloat)cellHeight{
    return 145 * kScaleOfX;
}
@end
