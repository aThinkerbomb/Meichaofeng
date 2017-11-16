//
//  QZAccountModel.h
//  QZFinancialSupermarket
//
//  Created by wzh on 17/3/7.
//
//

#import <Foundation/Foundation.h>

@interface QZLoginAccountModel : NSObject<NSCoding>


//+ (QZLoginAccountModel *)accountWithModel:(QZLoginDataModel *)model;

@property (copy, nonatomic) NSString *ifOverrun;
@property (copy, nonatomic) NSString *userId;
@property (copy, nonatomic) NSString *userMobile;
@property (copy, nonatomic) NSString *token;
@property (copy, nonatomic) NSString *name;


@end
