//
//  QZAccountModel.m
//  QZFinancialSupermarket
//
//  Created by wzh on 17/3/7.
//
//

#import "QZLoginAccountModel.h"

@implementation QZLoginAccountModel

//+ (QZLoginAccountModel *)accountWithModel:(QZLoginDataModel *)model{
//    QZLoginAccountModel *accoutModel = [[QZLoginAccountModel alloc]init];
//    accoutModel.ifOverrun = model.ifOverrun;
//    accoutModel.userId = model.userId;
//    accoutModel.userMobile = model.userMobile;
//    return accoutModel;
//}

/**
 *  当从文件中解析出一个对象的时候调用
 *  在这个方法中写清楚：怎么解析文件中的数据
 */
- (id)initWithCoder:(NSCoder *)decoder
{
    if (self = [super init]) {
        self.ifOverrun = [decoder decodeObjectForKey:@"ifOverrun"];
        self.userId = [decoder decodeObjectForKey:@"userId"];
        self.userMobile = [decoder decodeObjectForKey:@"userMobile"];
        self.name = [decoder decodeObjectForKey:@"name"];
        self.token = [decoder decodeObjectForKey:@"token"];

    }
    return self;
}

/**
 *  将对象写入文件的时候调用
 *  在这个方法中写清楚：要存储哪些对象的哪些属性，以及怎样存储属性
 */
- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:self.ifOverrun forKey:@"ifOverrun"];
    [encoder encodeObject:self.userId forKey:@"userId"];
    [encoder encodeObject:self.userMobile forKey:@"userMobile"];
    [encoder encodeObject:self.name forKey:@"name"];
    [encoder encodeObject:self.token forKey:@"token"];

}

@end
