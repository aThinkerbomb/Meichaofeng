//
//  YXNetworkReachabilityManager.m
//  QZFinancialSupermarket
//
//  Created by 张宇轩 on 2017/11/9.
//  Copyright © 2017年 wzh. All rights reserved.
//

#import "YXNetworkReachabilityManager.h"
#import "AFNetworkReachabilityManager.h"
@implementation YXNetworkReachabilityManager

+ (instancetype)shareInstance {
    static YXNetworkReachabilityManager * manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[YXNetworkReachabilityManager alloc] init];
        
    });
    return manager;
}

- (void)startMonitoring {
    
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        
        if (status == AFNetworkReachabilityStatusNotReachable) {
            NSLog(@"无网络");
            _networkType = NetworkTypeNoReachable;
        }
        
        if (status == AFNetworkReachabilityStatusReachableViaWWAN) {
            NSLog(@"3G/4G");
            _networkType = NetworkTypeReachableViaWWAN;
        }
        
        if (status == AFNetworkReachabilityStatusReachableViaWiFi) {
            NSLog(@"Wi-Fi");
            _networkType = NetworkTypeReachableViaWiFi;
        }
        
    }];
    
}



@end
