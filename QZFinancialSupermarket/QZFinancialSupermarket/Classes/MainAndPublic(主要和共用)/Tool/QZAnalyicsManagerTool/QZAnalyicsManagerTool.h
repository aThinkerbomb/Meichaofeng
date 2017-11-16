//
//  QZAnalyicsManagerTool.h
//  QZFinancialSupermarket
//
//  Created by wzh on 2017/6/1.
//
//

#import <Foundation/Foundation.h>
//#import "UMMobClick/MobClick.h"
#import "QZAnalyicsConst.h"

@interface QZAnalyicsManagerTool : NSObject
/**
 *  首页 - 个人中心点击<s1>
 */
+ (void)setHomeUserCenterClickedAction;
+ (void)setHomeUserCenterClickedActionWithDic:(NSDictionary *)dic;

/**
 *  首页 - 站内信点击<s2>
 */
+ (void)setHomeMessageCenterClickedAction;
+ (void)setHomeMessageCenterClickedActionWithDic:(NSDictionary *)dic;



/**
 *  首页 - banner图点击<s3>
 */
+ (void)setHomeBannerClickedAction;
+ (void)setHomeBannerClickedActionWithDic:(NSDictionary *)dic;



/**
 *  首页 - 身份认证点击<s4>
 */
+ (void)setHomeIdentityCerClickedAction;
+ (void)setHomeIdentityCerClickedActionWithDic:(NSDictionary *)dic;

/**
 *  首页 - 个人信息点击<s5>
 */
+ (void)setHomePersionInforCerClickedAction;
+ (void)setHomePersionInforCerClickedActionWithDic:(NSDictionary *)dic;

/**
 *  首页 - 手机认证点击<s6>
 */
+ (void)setHomePhoneInforCerClickedAction;
+ (void)setHomePhoneInforCerClickedActionWithDic:(NSDictionary *)dic;

/**
 *  首页 - 前去借款点击<s7>
 */
+ (void)setHomeGoToBorrowingClickedAction;
+ (void)setHomeGoToBorrowingClickedActionWithDic:(NSDictionary *)dic;

/**
 *  首页 - 首页停留时长<s8>
 */
+ (void)setHomeWaitingTimeBeginAction;
+ (void)setHomeWaitingTimeEndAction;



//-------------------------
/**
 *  登录 - 登录点击<DLDJ>
 */
+ (void)setLoginClickedAction;
+ (void)setLoginClickedActionWithDic:(NSDictionary *)dic;
/**
 *  登录 - 忘记密码点击<DLDJ1>
 */
+ (void)setForgetLoginPwdAction;
+ (void)setForgetLoginPwdActionWithDic:(NSDictionary *)dic;

/**
 *  登录 - 退出点击<DLDJ2>
 */
+ (void)setLoginOutAction;
+ (void)setLoginOutActionWithDic:(NSDictionary *)dic;

/**
 *  登录 - 页面停留时长<DLDJ3>
 */
+ (void)setLoginWaitingTimeBeginAction;
+ (void)setLoginWaitingTimeEndAction;





/**
 *  借款流程 - 身份认证<SFRZ>提交点击<SFRZ1>
 */
+ (void)setIdentityCerSubmitAction;
+ (void)setIdentityCerSubmitActionWithDic:(NSDictionary *)dic;
/**
 *  借款流程 - 身份认证<SFRZ>页面停留时长<SFRZ2>
 */
+ (void)setIdentityCerWaitingTimeBeginAction;
+ (void)setIdentityCerWaitingTimeEndAction;


/**
 *  借款流程 - 个人信息<GRXX>提交点击<GRXX1>
 */
+ (void)setPersionInforCerSubmitAction;
+ (void)setPersionInforCerSubmitActionWithDic:(NSDictionary *)dic;

/**
 *  借款流程 - 个人信息<GRXX>页面停留时长<GRXX2>
 */
+ (void)setPersionInforCerWaitingTimeBeginAction;
+ (void)setPersionInforCerWaitingTimeEndAction;

/**
 *  借款流程 - 手机认证<SJRZ>认证点击<SJRZ1>
 */
+ (void)setPhoneInforCerSubmitAction;
+ (void)setPhoneInforCerSubmitActionWithDic:(NSDictionary *)dic;

/**
 *  借款流程 - 手机认证<SJRZ>页面停留时长<SJRZ2>
 */
+ (void)setPhoneInforCerrWaitingTimeBeginAction;
+ (void)setPhoneInforCerrWaitingTimeEndAction;


/**
 *  借款流程 - 审批通过<SPTG>同意点击<SPTG1>
 */
+ (void)setBorrowingThroughAgreedClicedAction;
+ (void)setBorrowingThroughAgreedClicedActionWithDic:(NSDictionary *)dic;

/**
 *  借款流程 - 审批通过<SPTG>页面停留时长<SPTG2>（ 我的借款界面停留时间）
 */
+ (void)setMyBorrowingWaitingTimeBeiginAction;
+ (void)setMyBorrowingWaitingTimeEndAction;


/**
 *  借款流程 - 到期还款<DQHK>优惠券点击<DQHK1>
 */
+ (void)setReimbursementSelectCouponsAction;
+ (void)setReimbursementSelectCouponsActionWithDic:(NSDictionary *)dic;

/**
 *  借款流程 - 到期还款<DQHK>还款点击<DQHK2>
 */
+ (void)setReimbursementClickAction;
+ (void)setReimbursementClickActionWithDic:(NSDictionary *)dic;

/**
 *  借款流程 - 到期还款<DQHK>其他还款方式点击<DQHK3>
 */
+ (void)setOtherReimbursementClickedAction;
+ (void)setOtherReimbursementClickedActionWithDic:(NSDictionary *)dic;

/**
 *  借款流程 - 到期还款<DQHK>页面停留时长<DQHK4>
 */
+ (void)setReimbursementWaitingTimeBeginAction;
+ (void)setReimbursementWaitingTimeEndAction;

/**
 *  借款流程 - 到期还款<DQHK>其他还款方式 - 页面停留时长<DQHK31>
 */
+ (void)setOtherReimbursementWaitingTimeBeginAction;
+ (void)setOtherReimbursementWaitingTimeEndAction;



/**
 *  公告点击<s9>
 */
+ (void)setAnnouncementClickedAction;
+ (void)setAnnouncementClickedActionWithDic:(NSDictionary *)dic;



/**
 *  我的银行卡<WD2>
 */
+ (void)setMyBankCardListClickedAction;
+ (void)setMyBankCardListClickedActionWithDic:(NSDictionary *)dic;


/**
 *  我的优惠券<WD3>
 */
+ (void)setMyCouponsListClickedAction;
+ (void)setMyCouponsListClickedActionWithDic:(NSDictionary *)dic;


/**
 *  邀请好友<WD4>
 */
+ (void)setInvitationFriendsClickedAction;
+ (void)setInvitationFriendsClickedActionWithDic:(NSDictionary *)dic;


/**
 *  微信公众号<WD5>
 */
+ (void)setWXPublicNumClickedActionAction;
+ (void)setWXPublicNumClickedActionWithDic:(NSDictionary *)dic;

/**
 *  设置<WD6>
 */
+ (void)setSetUpClickedAction;
+ (void)setSetUpClickedActionWithDic:(NSDictionary *)dic;

/**
 *  常见问题<WD7>
 */
+ (void)setCommonProblemsClickedAction;
+ (void)setCommonProblemsClickedActionWithDic:(NSDictionary *)dic;

/**
 *  修改密码<WD61>
 */
+ (void)setModifyLoginPwdClickedAction;
+ (void)setModifyLoginPwdClickedActionWithDic:(NSDictionary *)dic;


/**
 *  注册<DLDJ4>
 */
+ (void)setRegisteredClickedAction;
+ (void)setRegisteredClickedActionWithDic:(NSDictionary *)dic;
/**
 *  账单<ZD>
 */
+ (void)setBillPageClickedAction;
+ (void)setBillPageClickedActionWithDic:(NSDictionary *)dic;

/**
 *  首页<S>
 */
+ (void)setHomeMainClickedAction;
+ (void)setHomeMainClickedActionWithDic:(NSDictionary *)dic;
@end
