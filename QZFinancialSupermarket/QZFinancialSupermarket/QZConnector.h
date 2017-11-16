//
//  QZConnector.h
//  QZFinancialSupermarket
//
//  Created by 张宇轩 on 2017/9/25.
//  Copyright © 2017年 wzh. All rights reserved.
//

#ifndef QZConnector_h
#define QZConnector_h


#pragma mark - 首页

/// 第一次启动添加手机识别号
#define QZ_ADD_IPHONE_UUID_URL @"api/user/IdentificationNnumber"

/// 首页数据
#define QZ_HOME_URL @"api/index/index"

/// 首页点击banner统计接口
#define QZ_HOME_BANNER_CLICKED_URL @"api/index/StatisticsBanner"

/// 每日新产品列表
#define QZ_DAY_NEW_PRO_URL @"api/index/everyday"

/// 推出活动
#define QZ_PUSH_ACTIVITY_URL @"api/index/Homepopup"



#pragma mark - 贷款
/// 产品数据
#define QZ_PRODUCT_URL @"api/index/ToLoan"

/// 贷款详情
#define QZ_LOAN_DETAIL_URL @"api/index/LoanDetails"

/// 申请记录次数
#define QZ_APPLY_COUNT_URL @"api/index/StatisticsHot"

/// 统计第三放App下载次数
#define QZ_APP_DOWN_COUNT_URL @"api/index/download"

/// 贷款页活动公告
#define QZ_LOAN_ADVERT_URL @"api/index/Loannotice"

/// 贷款页筛选接口
#define QZ_LOAN_FILTER_URL @"/api/index/ToLoan"


#pragma mark - 咨询
/// 咨询数据
#define QZ_ADVISORY_URL @"api/index/Information"

/// 咨询详情+评论
#define QZ_ADVISORY_DETAIL_URL @"api/index/InformationDetails"

/// 咨询轮播图+评论
#define QZ_CYCLE_PIC_DETAIL_URL @"api/index/CarouselInfo"

/// 发布评论
#define QZ_SEND_COMMENT_URL @"api/user/Reviews"


#pragma mark - 我的
/// 申请记录
#define QZ_APPLY_RECORD_URL @"api/user/Apprecord"


/// 我的评论
#define QZ_MY_COMMENT_URL @"api/user/CommonPage"

/// 关于我们
#define QZ_ABOUT_OUR_URL @"api/user/AboutUs"

/// 用户意见反馈
#define QZ_USER_FEEDBACK @"api/user/Feedback"

/// 协议
#define QZ_XIEYI_URL @"api/user/contract"

/// 退出登录
#define QZ_USER_LOGIN_OUT_URL @"api/user/LogOut"


#pragma mark - 注册登录

///---------------------------------- 目前不用了 --------------------
/// 注册-获取手机号验证码
#define QZ_REGISTER_PHONE_VERCODE @"api/user/RegisterVerificationCode"

/// 注册账号接口
#define QZ_REGISTER_ACCOUNT @"api/user/Register"

/// 忘记密码获取验证码
#define QZ_FORGET_PWD_VERCODE @"api/user/PasswordRetrievalCode"

/// 忘记密码验证码下一步
#define QZ_FORGET_PWD_NEXT @"api/user/NextStep"

/// 忘记密码-设置新密码
#define QZ_SET_NEW_PWD @"api/user/VerifyPasswordTwoTimes"

/// 手机号登录
#define QZ_PHONE_LOGIN @"api/user/MobileLogin"

/// 登录状态-账号-设置-修改密码 发送验证码
#define QZ_MODIFY_SEND_VERCODE @"api/user/ModifyPassword"

/// 登录状态-账号-设置-验证旧密码信息
#define QZ_MODIFY_VER_OLDPWD @"api/user/VerificationPassword"
///-------------------------------------------------------------



/// 短信登录-获取手机号验证码 （现在在用）
#define QZ_LOGIN_PHONE_VERCODE @"api/user/DuanVerificationCode"

/// 短信登录 （现在在用）
#define QZ_MSG_LOGIN @"api/user/ShortMessage"

/// 发送验证码之前调用的加密接口
#define QZ_VERCODE_JIAMI_URL @"api/user/vdetoken"

/// 版本检测
#define QZ_VERSION_CODE_URL @"api/index/App_Code"


#endif /* QZConnector_h */
