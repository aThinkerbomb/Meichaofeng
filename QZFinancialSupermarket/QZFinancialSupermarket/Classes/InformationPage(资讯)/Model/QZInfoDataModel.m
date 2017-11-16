//
//  QZInfoDataModel.m
//  QZFinancialSupermarket
//
//  Created by 张宇轩 on 2017/9/27.
//  Copyright © 2017年 wzh. All rights reserved.
//

#import "QZInfoDataModel.h"

@implementation QZInfoDataModel

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"InfoId": @"id"};
}

- (NSString *)cellClassName{
    
    if([self.status intValue] == 1){
        return @"QZInformationOneCell";
    } else {
        return @"QZInformationTwoCell";
    }
}
- (CGFloat)cellHeight{
    if([self.status intValue] == 1){
        return 85 * kScaleOfX;
    }else{
        return 235 * kScaleOfX;
    }
}
@end
