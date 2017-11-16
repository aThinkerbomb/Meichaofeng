//
//  ZHSelectCityModel.h
//  QZFinancialSupermarket
//
//  Created by wzh on 2017/6/12.
//
//

#import <Foundation/Foundation.h>

@interface ZHSelectCityModel : NSObject
//省
@property (copy,nonatomic) NSString *province;
//市
@property (copy,nonatomic) NSString *city;
//区
@property (copy,nonatomic) NSString *area;

@end
