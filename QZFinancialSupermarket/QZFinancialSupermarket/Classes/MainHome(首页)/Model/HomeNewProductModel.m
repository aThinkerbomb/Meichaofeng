//
//  HomeNewProductModel.m
//  QZFinancialSupermarket
//
//  Created by 张宇轩 on 2017/10/31.
//  Copyright © 2017年 wzh. All rights reserved.
//

#import "HomeNewProductModel.h"

@implementation HomeNewProductModel
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"productId": @"id"};
}

- (NSString *)cellClassName{
    return @"QZNewProductCell";
}
- (CGFloat)cellHeight{
    return 152 * kScaleOfX;
}
@end
