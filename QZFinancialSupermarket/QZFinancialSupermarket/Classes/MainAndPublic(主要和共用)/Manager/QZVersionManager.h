//
//  QZVersionManager.h
//  QZFinancialSupermarket
//
//  Created by 张宇轩 on 2017/11/2.
//  Copyright © 2017年 wzh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QZVersionManager : NSObject

// 初始化
+ (instancetype)shareInstance;

// 开启检测版本管理
- (void)startCheckVersion;
@end
