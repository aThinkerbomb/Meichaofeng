//
//  QZConfig.h
//  QZFinancialSupermarket
//
//  Created by 张宇轩 on 2017/9/25.
//  Copyright © 2017年 wzh. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, BaseUrlStatus) {
    
    BaseUrlStatusDistribution = 0,
    BaseUrlStatusDevelopment
    
};

@interface QZConfig : NSObject

/// 检测数据请求是否正确
+ (BOOL)checkResponseObject:(id)json;

/// 隐藏手机号中间的4位数
+ (NSString *)getHandlePhone:(NSString *)phone;

/// 参数dic拼接 完整 url
+ (NSString *)getCompleteURLWithParameterDic:(NSDictionary *)parameter url:(NSString *)url;

/// 计算缓存
+ (NSString *)folderSize;

/// 清理缓存
+ (void)removeCache;

/// 判断是否是登录状态
+ (BOOL)isLoginStatus;

/// 登出
+ (void)loginOut;

/// 切换baseURL
+ (NSString *)getBaseUrlConfigure;

/// 切换图片ImageUrl
+ (NSString *)getImageBaseUrlConfigure;

/// 得到当前环境描述
+ (NSString *)getCurrentEnvirModel;
@end
