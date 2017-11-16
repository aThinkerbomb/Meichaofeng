//
//  QZMessageCellItem.m
//  QZFinancialSupermarket
//
//  Created by wzh on 2017/9/13.
//  Copyright © 2017年 wzh. All rights reserved.
//

#import "QZMessageCellItem.h"

@implementation QZMessageCellItem

- (NSString *)cellClassName{
    return @"QZMessageTableViewCell";
}
- (CGFloat)cellHeight{
    return 90 * kScaleOfX;
}

@end
