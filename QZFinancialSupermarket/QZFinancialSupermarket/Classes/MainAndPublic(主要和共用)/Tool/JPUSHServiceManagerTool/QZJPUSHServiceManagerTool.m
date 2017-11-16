//
//  JPUSHServiceManagerTool.m
//  QZFinancialSupermarket
//
//  Created by wzh on 17/3/15.
//
//

#import "QZJPUSHServiceManagerTool.h"
#import "JPUSHService.h"
@implementation QZJPUSHServiceManagerTool

+ (void)setAlias:(NSString *)alias fetchCompletionHandle:(void (^)(int iResCode, NSSet *iTags, NSString *iAlias))completionHandler{
    [JPUSHService setTags:nil alias:[NSString stringWithFormat:@"%@",alias] fetchCompletionHandle:completionHandler];
}


@end
