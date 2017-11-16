//
//  ZHBaseModel.h
//  QZFinancialSupermarket
//
//  Created by wzh on 17/3/2.
//
//

#import <Foundation/Foundation.h>
@interface ZHBaseModel : NSObject

@property (copy, nonatomic) NSString *state;
@property (copy, nonatomic) NSString *msg;
-(instancetype)initWithJson:(id)json;
- (id)initWithDic:(NSDictionary *)dic;
@end
