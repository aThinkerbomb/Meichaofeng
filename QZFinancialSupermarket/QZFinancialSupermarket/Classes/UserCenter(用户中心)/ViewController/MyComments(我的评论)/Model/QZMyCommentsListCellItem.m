//
//  QZMyCommentsListCellItem.m
//  QZFinancialSupermarket
//
//  Created by wzh on 2017/9/13.
//  Copyright © 2017年 wzh. All rights reserved.
//

#import "QZMyCommentsListCellItem.h"

@implementation QZMyCommentsListCellItem

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"commentId": @"id"};
}

+ (nullable NSDictionary<NSString *, id> *)modelContainerPropertyGenericClass {
    
    return @{@"list": @"QZMyCommentsListCellItem2"};
    
}

- (NSString *)cellClassName{
    return @"QZMyCommentsListCell";
}
//- (CGFloat)cellHeight{
//    
//    //titleTop + title计算后内容高度 + ineTop + line高度 + desTitleTop + desDetail计算后高度 + numberTop + number高度 + 距离底部剩余高度
//    return 20 * kScaleOfX  + [ZHTool sizeWithString_H:self.title font:[UIFont textCustomFont15] width:kScreenWidth - (45 * kScaleOfX + 30 *kScaleOfX)] + 10 *kScaleOfX + 0.5 + 10 *kScaleOfX + [ZHTool sizeWithString_H:self.des font:[UIFont textCustomFont12] width:kScreenWidth - 65 *kScaleOfX - 30 *kScaleOfX] +15 *kScaleOfX + 30 + 15 *kScaleOfX;
//}

+ (instancetype)itemWithTitle:(NSString *)title des:(NSString *)des{
    QZMyCommentsListCellItem *item = [[self alloc] init];
    item.title = title;
    item.des = des;
    return item;
}
@end
