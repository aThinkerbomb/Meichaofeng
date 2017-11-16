//
//  QZAnalyticsManager.m
//  QZFinancialSupermarket
//
//  Created by 张宇轩 on 2017/11/6.
//  Copyright © 2017年 wzh. All rights reserved.
//

#import "QZAnalyticsManager.h"
#import <UMCommon/UMCommon.h>
#import <UMAnalytics/MobClick.h>

#define UMengAppKey @"59eea935c62dca5d3700003d"

@implementation QZAnalyticsManager

+ (void)startAnalytics {

    [UMConfigure setLogEnabled:YES];
    [UMConfigure initWithAppkey:UMengAppKey channel:nil];
}

+ (void)beginLogPageView:(NSString *)pageName {
    NSLog(@"youmeng---%@", pageName);
    [MobClick beginLogPageView:pageName];
}

+ (void)endLogPageView:(NSString *)pageName {
    NSLog(@"youmeng---%@", pageName);
    [MobClick endLogPageView:pageName];
}

+ (void)event:(NSString *)eventId {
    NSLog(@"youmengid---%@", eventId);
    [MobClick event:eventId];
}

+ (void)event:(NSString *)eventId attributes:(NSDictionary *)attributes {
    if (!attributes) {
        NSLog(@"youmengid---%@", eventId);
        [MobClick event:eventId];
    } else {
        NSLog(@"youmengid---%@", eventId);
        [MobClick event:eventId attributes:attributes];
    }
}

@end
