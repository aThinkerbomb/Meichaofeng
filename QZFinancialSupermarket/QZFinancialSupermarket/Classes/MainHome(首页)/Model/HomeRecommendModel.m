//
//  HomeRecommendModel.m
//  QZFinancialSupermarket
//
//  Created by 张宇轩 on 2017/9/26.
//  Copyright © 2017年 wzh. All rights reserved.
//

#import "HomeRecommendModel.h"

@implementation HomeRecommendModel

- (NSString *)cellClassName{
    return @"QZHomeHotCell";
}
- (CGFloat)cellHeight{
    return 120 * kScaleOfX;
}

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"recommendId": @"id"};
}
@end
