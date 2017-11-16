//
//  ZHPickerView.h
//  QZFinancialSupermarket
//
//  Created by wzh on 2017/6/14.
//
//

#import <UIKit/UIKit.h>
#import "ZHPickerModel.h"
@interface ZHPickerView : UIView<UIPickerViewDelegate,UIPickerViewDataSource>


@property (nonatomic, strong) NSArray <ZHPickerModel *>*listArray;
@property (nonatomic, assign) BOOL toolsHidden;

//选中的model
@property (nonatomic, strong) ZHPickerModel *selectModel;
//默认选中的model
@property (nonatomic, strong) ZHPickerModel *defautModel;

@property (copy, nonatomic) void(^confirmBlock)(ZHPickerModel *selectModel);
@property (copy, nonatomic) void(^cancelBlock)();
@property (copy, nonatomic) void(^doneBlock)(ZHPickerModel *selectModel);

- (instancetype)initWithFrame:(CGRect)frame listArray:(NSArray *)listArray;


@end
