//
//  ZHBaseModel.m
//  QZFinancialSupermarket
//
//  Created by wzh on 17/3/2.
//
//

#import "ZHBaseModel.h"

@implementation ZHBaseModel
-(instancetype)initWithJson:(id)json
{
    self=[super init];
    if (self) {
        [self yy_modelSetWithJSON:json];
    }
    return self;
}

- (id)initWithDic:(NSDictionary *)dic{
    if(self = [super init]){
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}

@end
