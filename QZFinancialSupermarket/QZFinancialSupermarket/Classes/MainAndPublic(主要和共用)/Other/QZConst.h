//
//  QZConst.h
//  QZFinancialSupermarket
//
//  Created by wzh on 17/3/6.
//
//

#import <Foundation/Foundation.h>
extern NSInteger const QZErrorCancelCode;


/**
 *  网络状态改变的通知名字
 */
extern NSString *const ZHNetStateChange;


//单点通知key
extern NSString *const QZSinglePointNoticeKey;

/**
 *  导航字体
 */
extern NSString *const QZNavFontName;
/**
 *  登录字体
 */
extern NSString *const QZLoginFontName;
/**
 *  textfield placeholderLabel.textColor
 */
extern NSString *const QZPlacehoderTitleColor;
/**
 *  textfield _placeholderLabel.font
 */
extern NSString *const QZPlacehoderTitleFont;
/**
 *   客服电话
 */
extern NSString *const QZServerTelePhone;
/**
 *  微信公众号ID
 */
extern NSString *const QZPasteboardWXID;
/**
 *  微信公众号 复制成功
 */
extern NSString *const QZPasteboardSuccessful;

/**
 *   接口成功code
 */
extern NSString *const QZSuccessfulCode;
/**
 *   单点登录code
 */
extern NSString *const QZSinglePointCode;
/**
 *   单点登录提示语
 */
extern NSString *const QZSinglePointCodeMessageLitigation;
/**
 *  无网络：请检查网络连接
 */
extern NSString *const QZErrorNotNetWork;
/**
 *  数据异长
 */
extern NSString *const QZErrorDataAbnormal;
/**
 *  正在调取照相机
 */
extern NSString *const QZDrawOnCameraLogding;
/**
 *  请上传身份证正面照片
 */
extern NSString *const QZPleaseUploadIDCardPositive;

/**
 *  手机号最大位数
 */
extern NSInteger const QZPhoneNumMaxNum ;
/**
 *   手机号不能为空
 */
extern NSString *const QZPhoneNumIsEmpty;
/**
 *   手机号输入不正确
 */
extern NSString *const QZPhoneNumInputError;
/**
 *   请您填写手机号码
 */
extern NSString *const QZPhoneNumPleaseInput;

/**
 *  登录密码最小位数
 */
extern NSInteger const QZLoginPwdMinNum;
/**
 *  登录密码最大位数
 */
extern NSInteger const QZLoginPwdMaxNum;
/**
 *   密码不能为空
 */
extern NSString *const QZLoginPwdIsEmpty;
/**
 *   登录密码格式不正确
 */
extern NSString *const QZLoginPwdInputError;
/**
 *   不能输入表情符哦
 */
extern NSString *const QZLoginPwdInputEmojiError;

/**
 *   请您填写手机密码
 */
extern NSString *const QZLoginPwdPleaseInput;
/**
 *   密码格式不正确
 */
extern NSString *const QZLoginPwdFormatError;
/**
 *   短信验证码不能为空
 */
extern NSString *const QZSMSCodeIsEmpty;
/**
 *   已经是最后一页了
 */
extern NSString *const QZAlreadyLastPage;


/**
 *   图片验证码不能为空
 */
extern NSString *const QZGraphicsIsEmpty;


/**
 *   请您填写图形验证码
 */
extern NSString *const QZGraphicsPleaseInput;

/**
 *  验证码
 */
extern NSInteger const QZSMSCodeMaxNum;

/**
 *   请您填写手机验证码
 */
extern NSString *const QZSMSCodePleaseInput;

/**
 *   请您阅读并勾选注册服务协议
 */
extern NSString *const QZPleaseReadAndCheckAgreement;



/**
 * 保存成功
 */
extern NSString *const QZSaveSuccessful;
/**
 * 提交成功
 */
extern NSString *const QZPutSuccessful;
/**
 * 分享成功
 */
extern NSString *const QZShareSuccessful;
/**
 * 分享失败
 */
extern NSString *const QZShareFailure;

/**
 *   请上传身份证正面照片
 */
extern NSString *const QZPleaseInputIdCardPositive;
/**
 *   请上传身份证反面照片
 */
extern NSString *const QZPleaseInputIdCardReverse;
/**
 *   请进行人脸识别
 */
extern NSString *const QZPleaseInputFaceRecognition;
/**
 *   名字不能为空
 */
extern NSString *const QZNameIsEmpty;
/**
 *   身份证号码不能为空，请重新扫描身份证正面
 */
extern NSString *const QZIdCardIsEmpty;

/**
 *   请您填写现居住地址
 */
extern NSString *const QZCurrentAdressIsEmpty;
/**
 *   请您填写现居住地址的详细地址
 */
extern NSString *const QZCurrentAdressDetailIsEmpty;
/**
 *   请您填写单位地址
 */
extern NSString *const QZCompanyAdressIsEmpty;
/**
 *   请您填写单位地址的详细地址
 */
extern NSString *const QZCompanyAdressDetailIsEmpty;
/**
 *   请您填写单位电话
 */
extern NSString *const QZCompanyPhoneNumIsEmpty;
/**
 *   请您填写单位电话的区号
 */
extern NSString *const QZCompanyPhoneAreaNumIsEmpty;
/**
 *   请您填写邮箱
 */
extern NSString *const QZEmailIsEmpty;
/**
 *   邮箱格式不正确
 */
extern NSString *const QZEmailFormatError;
/**
 *   请您填写紧急联系人信息
 */
extern NSString *const QZEmergencyContactIsEmpty;
/**
 *   请您填写收款信息
 */
extern NSString *const QZGatheringInformationIsEmpty;
/**
 *   您的两个详细地址相似度太高
 */
extern NSString *const QZTwoAdressDetailIsSimilarBig;
/**
 *   请您填写第一紧急联系人与本人的关系
 */
extern NSString *const QZFirstContactRelationshipIsEmpty;
/**
 *   请您填写第一紧急联系人的姓名
 */
extern NSString *const QZFirstContactNameIsEmpty;
/**
 *   请您填写第一紧急联系人的手机号码
 */
extern NSString *const QZFirstContactPhoneNumIsEmpty;
/**
 *   请您填写第二紧急联系人与本人的关系
 */
extern NSString *const QZSecondContactRelationshipIsEmpty;
/**
 *   请您填写第二紧急联系人的姓名
 */
extern NSString *const QZSecondContactNameIsEmpty;
/**
 *   请您填写第二紧急联系人的手机号码
 */
extern NSString *const QZSecondContactPhoneNumIsEmpty;
/**
 *  银行卡最小位数
 */
extern NSInteger const QZBankCardMinNum;
/**
 *  银行卡最大位数
 */
extern NSInteger const QZBankCardMaxNum;
/**
 *  银行卡输入错误警告
 */
extern NSString *const QZBankCardInputError;
/**
 *  银行卡输入为空
 */
extern NSString *const QZBankCardInputIsEmpty;
/**
 *  所属银行输入为空
 */
extern NSString *const QZBankNameIsEmpty;

/**
 *  预留手机号为空
 */
extern NSString *const QZBankReservedPhoneNumIsEmpty;
/**
 * 请填写正确的预留手机号码
 */
extern NSString *const QZBankReservedPhoneInputError;





/**
 * 借款认证温馨提示
 */
extern NSString *const QZLoanCerWarmPrompt;
/**
 * 收款信息温馨提示
 */
extern NSString *const QZCollectMoneyInforCerWarmPrompt;
/**
 * 添加银行卡信息温馨提示
 */
extern NSString *const QZAddBankInforWarmPrompt;



