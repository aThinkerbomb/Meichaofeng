//
//  ZHBaseCellModel.m
//  QZFinancialSupermarket
//
//  Created by wzh on 17/3/2.
//
//

#import "ZHBaseCellModel.h"

@implementation ZHBaseCellModel


- (CGFloat)cellHeight{
    if(_cellHeight == 0){
        _cellHeight = 44;
    }
    return _cellHeight;
}

- (NSString *)cellClassName{
    if(!_cellClassName){
        return @"default";
    }
    return _cellClassName;
}
@end
