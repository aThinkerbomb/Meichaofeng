//
//  QZVersionUpdateDataModel.h
//  QZFinancialSupermarket
//
//  Created by wzh on 2017/6/29.
//
//

#import "ZHBaseModel.h"

@interface QZVersionUpdateDataModel : ZHBaseModel


@property (nonatomic, copy) NSString *appInfo;
@property (nonatomic, copy) NSString *appURL;
@property (nonatomic, copy) NSString *appVersion;
@property (nonatomic, copy) NSString *isForce;

@end
