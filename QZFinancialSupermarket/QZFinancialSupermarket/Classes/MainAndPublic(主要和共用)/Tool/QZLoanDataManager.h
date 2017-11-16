//
//  QZLoanDataTool.h
//  QZFinancialSupermarket
//
//  Created by wzh on 2017/6/22.
//
//

#import <Foundation/Foundation.h>

@interface QZLoanDataManager : NSObject
+ (instancetype)shareLoanDataManager;
@property (nonatomic, copy) NSString *limit;
@property (nonatomic, copy)NSString *money;

@end
