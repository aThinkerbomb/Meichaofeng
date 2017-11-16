//
//  ZHPickerModel.m
//  QZFinancialSupermarket
//
//  Created by wzh on 2017/6/22.
//
//

#import "ZHPickerModel.h"

@implementation ZHPickerModel
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.selectId = @"";
        self.title = @"";
    }
    return self;
}
+ (ZHPickerModel *)itemWithTitle:(NSString *)title selectId:(NSString *)selectId{
    ZHPickerModel *pickerModel = [[ZHPickerModel alloc]init];
    pickerModel.title = title;
    pickerModel.selectId = selectId;
    return pickerModel;
}

@end
