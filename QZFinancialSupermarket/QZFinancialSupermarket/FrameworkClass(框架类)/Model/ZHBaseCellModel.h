//
//  ZHBaseCellModel.h
//  QZFinancialSupermarket
//
//  Created by wzh on 17/3/2.
//
//

#import <Foundation/Foundation.h>
#import "ZHBaseModel.h"
@interface ZHBaseCellModel : ZHBaseModel

@property (nonatomic, assign) CGFloat cellHeight;
@property (nonatomic, copy) NSString *cellClassName;
@property (nonatomic, copy) void(^selectValueAction)(id object);

//- (CGFloat)cellHeight;
//- (NSString*)cellClassName;
@end
