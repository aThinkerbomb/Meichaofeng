//
//  StaticAppDownCount.h
//  QZFinancialSupermarket
//
//  Created by 张宇轩 on 2017/11/6.
//  Copyright © 2017年 wzh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StaticAppDownCount : NSObject
// 初始化
+ (instancetype)shareInstance;

/**
 开启统计
 */
- (void)startStaticDownCount;
@end
