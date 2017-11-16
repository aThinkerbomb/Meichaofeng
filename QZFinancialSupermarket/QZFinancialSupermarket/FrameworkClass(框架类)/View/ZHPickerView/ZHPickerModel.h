//
//  ZHPickerModel.h
//  QZFinancialSupermarket
//
//  Created by wzh on 2017/6/22.
//
//

#import <Foundation/Foundation.h>

@interface ZHPickerModel : NSObject

@property  (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *selectId;

+ (ZHPickerModel *)itemWithTitle:(NSString *)title selectId:(NSString *)selectId;
@end
