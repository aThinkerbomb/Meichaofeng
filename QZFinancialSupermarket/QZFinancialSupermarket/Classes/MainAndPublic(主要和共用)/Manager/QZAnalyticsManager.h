//
//  QZAnalyticsManager.h
//  QZFinancialSupermarket
//
//  Created by 张宇轩 on 2017/11/6.
//  Copyright © 2017年 wzh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QZAnalyticsManager : NSObject
// 开启友盟统计
+ (void)startAnalytics;

/**
 自动页面时长统计, 开始记录某个页面展示时长.

 @param pageName 页面名称
 */
+ (void)beginLogPageView:(NSString *)pageName;

/**
 自动页面时长统计, 结束记录某个页面展示时长.

 @param pageName 页面名称
 */
+ (void)endLogPageView:(NSString *)pageName;

/**
 自定义事件统计
 使用前，请先到友盟App管理后台的设置->编辑自定义事件 中添加相应的事件ID，然后在工程中传入相应的事件ID
 @param eventId 网站上注册的事件Id
 */
+ (void)event:(NSString *)eventId;

/**
 自定义事件统计

 @param eventId 网站上注册的事件Id
 @param attributes 每个event的attributes不能超过10个
 eventId、attributes中key和value都不能使用空格和特殊字符，必须是NSString,且长度不能超过255个字符（否则将截取前255个字符）
 id， ts， du是保留字段，不能作为eventId及key的名称
 */
+ (void)event:(NSString *)eventId attributes:(NSDictionary *)attributes;

@end

/// ------------ 自定义事件id -------------
/// 账户_标签点击
static NSString * const tab_account = @"tab_account";

/// 资讯banner点击
static NSString * const news_banner = @"news_banner";

/// 贷款详情页-第三方apk下载(ios为打开appstore)
static NSString * const loan_qsqjr_apk = @"loan_qsqjr_apk";

/// 贷款详情页-去申请进入
static NSString * const loan_qsqjr = @" loan_qsqjr";

/// 贷款详情页-去申请点击
static NSString * const loan_qsq_button = @"loan_qsq_button";

/// 贷款_标签点击
static NSString * const tab_loan = @"tab_loan";

/// 首页-推荐平台
static NSString * const home_tjpt = @"home_tjpt";

/// 首页-banner点击
static NSString * const home_banner = @"home_banner";

/// 推送弹窗点击
static NSString * const tstc = @"tstc";

/// 登录_退出
static NSString * const login_back = @"login_back";

/// 登录-登陆失败
static NSString * const login_dlsb = @"login_dlsb";

///登录-登录成功
static NSString * const login_dlcg = @"login_dlcg";

///登录-注册失败
static NSString * const login_zcsb = @"login_zcsb";

/// 登录-注册成功
static NSString * const login_zccg = @"login_zccg";

/// 登录-获取验证码
static NSString * const login_hqyzm = @"login_hqyzm";

/// 筛选-易通过
static NSString * const loan_ytg = @"loan_ytg";

/// 筛选-低利率
static NSString * const loan_dll = @"loan_dll";

/// 筛选-放款快
static NSString * const loan_fkk = @" loan_fkk";

/// 首页贷款公告点击数
static NSString * const home_dkgg = @"home_dkgg";

/// 每日新产品点击数
static NSString * const home_mrxcp = @"home_mrxcp";




