//
//  QZProductCellItem.m
//  QZFinancialSupermarket
//
//  Created by wzh on 2017/9/13.
//  Copyright © 2017年 wzh. All rights reserved.
//

#import "QZProductCellItem.h"

@implementation QZProductCellItem

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"proid": @"id"};
}

- (NSString *)cellClassName{
    return @"QZLoanListCell";
}
- (CGFloat)cellHeight{
    return 145 * kScaleOfX;
}
@end
