//
//  YXNetworkReachabilityManager.h
//  QZFinancialSupermarket
//
//  Created by 张宇轩 on 2017/11/9.
//  Copyright © 2017年 wzh. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, NetworkType) {
    
    // 无网
    NetworkTypeNoReachable = 0,
    // 3G/4G
    NetworkTypeReachableViaWWAN,
    // Wi-Fi
    NetworkTypeReachableViaWiFi
    
};

@interface YXNetworkReachabilityManager : NSObject

@property (nonatomic, assign, readonly) NetworkType networkType;

// 初始化检测管理器
+ (instancetype)shareInstance;
// 开启网络检测
- (void)startMonitoring;
@end
