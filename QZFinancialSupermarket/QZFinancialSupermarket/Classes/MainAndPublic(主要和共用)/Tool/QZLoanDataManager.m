//
//  QZLoanDataTool.m
//  QZFinancialSupermarket
//
//  Created by wzh on 2017/6/22.
//
//

#import "QZLoanDataManager.h"
static QZLoanDataManager *_instance;
@implementation QZLoanDataManager
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.limit = @"";
        self.money = @"";
    }
    return self;
}

// 为了使实例易于外界访问 我们一般提供一个类方法
// 类方法命名规范 share类名|default类名|类名
+(instancetype)shareLoanDataManager
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (_instance == nil) {
            _instance = [[QZLoanDataManager alloc]init];
        }
    });
    return _instance;
}
- (void)setLimit:(NSString *)limit{
    _limit = limit;
    NSLog(@"借款期限 ------------   %@",_limit);
}
- (void)setMoney:(NSString *)money{
    _money = money;
    NSLog(@"借款金额 ------------   %@",_money);

}

@end
