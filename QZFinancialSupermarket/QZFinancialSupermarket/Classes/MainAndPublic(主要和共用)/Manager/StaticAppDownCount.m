//
//  StaticAppDownCount.m
//  QZFinancialSupermarket
//
//  Created by 张宇轩 on 2017/11/6.
//  Copyright © 2017年 wzh. All rights reserved.
//

#import "StaticAppDownCount.h"

@implementation StaticAppDownCount
+ (instancetype)shareInstance {
    
    static StaticAppDownCount * manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[StaticAppDownCount alloc] init];
        
    });
    return manager;
}

- (void)startStaticDownCount {
    
    NSString *userid = kGetObjectForKey(QZUserid);
    NSDictionary *param = @{@"id": userid};
    
    [QZAFNetwork postWithBaseURL:QZ_APP_DOWN_COUNT_URL params:param success:^(NSURLSessionDataTask *task, id json) {
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
    
}

@end
