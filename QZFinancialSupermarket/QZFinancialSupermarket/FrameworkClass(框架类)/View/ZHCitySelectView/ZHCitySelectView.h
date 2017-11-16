//
//  ZHCitySelectView.h
//  QZFinancialSupermarket
//
//  Created by wzh on 2017/6/12.
//
//

#import <UIKit/UIKit.h>
#import "ZHSelectCityModel.h"
@interface ZHCitySelectView : UIView

@property (nonatomic, assign) BOOL toolsHidden;

@property (copy, nonatomic) void(^confirmBlock)(ZHSelectCityModel *selectModel);
@property (copy, nonatomic) void(^cancelBlock)();
@property (copy, nonatomic) void(^doneBlock)(ZHSelectCityModel *selectModel);
@property (nonatomic, strong) ZHSelectCityModel *selectModel;

@end
