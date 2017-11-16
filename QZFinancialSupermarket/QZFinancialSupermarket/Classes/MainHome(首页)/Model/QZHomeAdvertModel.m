//
//  QZHomeAdvertModel.m
//  QZFinancialSupermarket
//
//  Created by 张宇轩 on 2017/11/1.
//  Copyright © 2017年 wzh. All rights reserved.
//

#import "QZHomeAdvertModel.h"

@implementation QZHomeAdvertModel

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"advertId": @"id"};
}

- (NSString *)cellClassName{
    return @"QZHomeAdvertCell";
}
- (CGFloat)cellHeight{
    return 30 * kScaleOfX;
}
@end
