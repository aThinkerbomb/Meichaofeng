//
//  AFHTTPSessionManager+Extension.m
//  QZFinancialSupermarket
//
//  Created by wzh on 17/3/20.
//
//

#import "AFHTTPSessionManager+Extension.h"
#import <AFNetworking.h>

static AFHTTPSessionManager *manager = nil;
@implementation AFHTTPSessionManager (Extension)
+ (AFHTTPSessionManager *)shareManager {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [AFHTTPSessionManager manager];
    });
    return manager;
}


@end
