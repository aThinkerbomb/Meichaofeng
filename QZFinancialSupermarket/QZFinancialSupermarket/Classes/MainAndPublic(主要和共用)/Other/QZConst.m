
//
//  QZConst.m
//  QZFinancialSupermarket
//
//  Created by wzh on 17/3/6.
//
//

#import "QZConst.h"
NSInteger const QZErrorCancelCode = -999;


/**
 *  网络状态改变的通知名字
 */
NSString *const ZHNetStateChange = @"NetStateChange";

//单点通知key
NSString *const QZSinglePointNoticeKey = @"QZSinglePointNoticeKey";

/**
 *  导航字体
 */
NSString *const QZNavFontName  = @"YouYuan";
/**
 *  登录字体
 */
NSString *const QZLoginFontName  = @"YHelvetica-hold";

/**
 *  textfield placeholderLabel.textColor
 */
NSString *const QZPlacehoderTitleColor  = @"_placeholderLabel.textColor";
/**
 *  textfield _placeholderLabel.font
 */
NSString *const QZPlacehoderTitleFont = @"_placeholderLabel.font";


/**
 *   客服电话  4000009369
 */
NSString *const QZServerTelePhone = @"400-000-9369";
/**
 *  微信公众号ID
 */
NSString *const QZPasteboardWXID = @"QZFinancialSupermarket";
/**
 *  微信公众号 复制成功
 */
NSString *const QZPasteboardSuccessful = @"复制微信公众号成功";

/**
 *   接口成功code
 */
NSString *const QZSuccessfulCode = @"1";
/**
 *   单点登录code
 */
NSString *const QZSinglePointCode = @"99";
/**
 *   单点登录提示语 ---- 您的账号已在其他设备登录
 */
NSString *const QZSinglePointCodeMessageLitigation = @"登录信息过期，请重新登录。";
/**
 *  无网络：请检查网络连接
 */
NSString *const QZErrorNotNetWork = @"网络连接错误或服务器异常";
/**
 *  数据异长
 */
NSString *const QZErrorDataAbnormal = @"数据异常";
/**
 *  正在调取照相机
 */
NSString *const QZDrawOnCameraLogding = @"正在调取照相机";
/**
 *  请上传身份证正面照片
 */
NSString *const QZPleaseUploadIDCardPositive = @"请上传身份证正面照片";

/**
 *  手机号最大位数
 */
NSInteger const QZPhoneNumMaxNum  = 11;
/**
 *   手机号不能为空
 */
NSString *const QZPhoneNumIsEmpty = @"手机号码不能为空";
/**
 *   手机号输入不正确
 */
NSString *const QZPhoneNumInputError = @"请填写正确的手机号码";
/**
 *   请您填写手机号码
 */
NSString *const QZPhoneNumPleaseInput = @"请您填写手机号码";

/**
 *   请您阅读并勾选注册服务协议
 */
NSString *const QZPleaseReadAndCheckAgreement = @"请您阅读并勾选注册服务协议";
/**
 *  登录密码最小位数
 */
NSInteger const QZLoginPwdMinNum  = 6;
/**
 *  登录密码最大位数
 */
NSInteger const QZLoginPwdMaxNum  = 20;
/**
 *   密码不能为空
 */
NSString *const QZLoginPwdIsEmpty = @"密码不能为空";
/**
 *   登录密码格式不正确
 */
NSString *const QZLoginPwdInputError = @"密码长度大于6并且小于20";
/**
 *   不能输入表情符哦
 */
NSString *const QZLoginPwdInputEmojiError = @"不能输入表情符哦";
/**
 *   请您填写手机密码
 */
NSString *const QZLoginPwdPleaseInput = @"请您填写密码";
/**
 *   密码格式不正确
 */
NSString *const QZLoginPwdFormatError = @"密码是数字与字母组合,且长度大于6小于20";

/**
 *   图片验证码不能为空
 */
NSString *const QZGraphicsIsEmpty = @"图形验证码不能为空";
/**
 *   请您填写图形验证码
 */
NSString *const QZGraphicsPleaseInput = @"请您填写图形验证码";


/**
 *  验证码
 */
NSInteger const QZSMSCodeMaxNum  = 6;
/**
 *   请您填写手机验证码
 */
NSString *const QZSMSCodePleaseInput = @"请您填写手机验证码";
/**
 *   短信验证码不能为空
 */
NSString *const QZSMSCodeIsEmpty = @"请填写短信验证码";
/**
 *   已经是最后一页了
 */
NSString *const QZAlreadyLastPage = @"已经是最后一页了";





/**
 * 保存成功
 */
NSString *const QZSaveSuccessful = @"保存成功";
/**
 * 提交成功
 */
NSString *const QZPutSuccessful = @"提交成功";
/**
 * 分享成功
 */
NSString *const QZShareSuccessful = @"分享成功";
/**
 * 分享失败
 */
NSString *const QZShareFailure = @"分享失败";

/**
 *   请上传身份证正面照片
 */
NSString *const QZPleaseInputIdCardPositive = @"请上传身份证正面照片";
/**
 *   请上传身份证反面照片
 */
NSString *const QZPleaseInputIdCardReverse = @"请上传身份证反面照片";
/**
 *   请进行人脸识别
 */
NSString *const QZPleaseInputFaceRecognition = @"请进行人脸识别";
/**
 *   名字不能为空
 */
NSString *const QZNameIsEmpty = @"姓名不能为空";
/**
 *   身份证号码不能为空，请重新扫描身份证正面
 */
NSString *const QZIdCardIsEmpty = @"身份证号码不能为空，请重新扫描身份证正面";


/**
 *   请您填写现居住地址
 */
NSString *const QZCurrentAdressIsEmpty = @"请您填写现居住地址";
/**
 *   请您填写现居住地址的详细地址
 */
NSString *const QZCurrentAdressDetailIsEmpty = @"请您填写现居住地址的详细地址";
/**
 *   请您填写单位地址
 */
NSString *const QZCompanyAdressIsEmpty = @"请您填写单位地址";
/**
 *   请您填写单位地址的详细地址
 */
NSString *const QZCompanyAdressDetailIsEmpty = @"请您填写单位地址的详细地址";
/**
 *   请您填写单位电话
 */
NSString *const QZCompanyPhoneNumIsEmpty = @"请您填写单位电话";
/**
 *   请您填写单位电话的区号
 */
NSString *const QZCompanyPhoneAreaNumIsEmpty = @"请您填写单位电话的区号";
/**
 *   请您填写邮箱
 */
NSString *const QZEmailIsEmpty = @"请您填写邮箱";
/**
 *   邮箱格式不正确
 */
NSString *const QZEmailFormatError = @"您填写的邮箱格式不正确";
/**
 *   请您填写紧急联系人信息
 */
NSString *const QZEmergencyContactIsEmpty = @"请您填写紧急联系人信息";
/**
 *   请您填写收款信息
 */
NSString *const QZGatheringInformationIsEmpty = @"请您填写收款信息";
/**
 *   您的两个详细地址相似度太高
 */
NSString *const QZTwoAdressDetailIsSimilarBig = @"两个详细地址太相近请重新填写";

/**
 *   请您填写第一紧急联系人与本人的关系
 */
NSString *const QZFirstContactRelationshipIsEmpty = @"请您填写第一紧急联系人与本人的关系";
/**
 *   请您填写第一紧急联系人的姓名
 */
NSString *const QZFirstContactNameIsEmpty = @"请您填写第一紧急联系人的姓名";
/**
 *   请您填写第一紧急联系人的手机号码
 */
NSString *const QZFirstContactPhoneNumIsEmpty = @"请您填写第一紧急联系人的手机号码";
/**
 *   请您填写第二紧急联系人与本人的关系
 */
NSString *const QZSecondContactRelationshipIsEmpty = @"请您填写第二紧急联系人与本人的关系";
/**
 *   请您填写第二紧急联系人的姓名
 */
NSString *const QZSecondContactNameIsEmpty = @"请您填写第二紧急联系人的姓名";
/**
 *   请您填写第二紧急联系人的手机号码
 */
NSString *const QZSecondContactPhoneNumIsEmpty = @"请您填写第二紧急联系人的手机号码";
/**
 *  银行卡最小位数
 */
NSInteger const QZBankCardMinNum  = 16;
/**
 *  银行卡最大位数
 */
NSInteger const QZBankCardMaxNum  = 20;
/**
 *  银行卡输入错误警告
 */
NSString *const QZBankCardInputError = @"请填写正确的银行卡号";
/**
 *  银行卡输入为空
 */
NSString *const QZBankCardInputIsEmpty = @"请填写银行卡号";


/**
 *  所属银行输入为空
 */
NSString *const QZBankNameIsEmpty = @"请选择所属银行";

/**
 *  预留手机号为空
 */
NSString *const QZBankReservedPhoneNumIsEmpty = @"请填写预留手机号";
/**
 * 请填写正确的预留手机号码
 */
NSString *const QZBankReservedPhoneInputError = @"请填写正确的预留手机号码";










/**
 * 借款认证温馨提示
 */
NSString *const QZLoanCerWarmPrompt = @"温馨提示：\n为了您能够飞速拿到放款，请填写真实信息，我们将严格保密。";
/**
 * 收款信息温馨提示
 */
NSString *const QZCollectMoneyInforCerWarmPrompt = @"温馨提示：\n1.为了您能够飞速拿到放款，请填写真实信息，我们将严格保密。\n2.当前的借款银行卡即您的还款银行卡。";
/**
 * 添加银行卡信息温馨提示
 */
NSString *const QZAddBankInforWarmPrompt = @"";
