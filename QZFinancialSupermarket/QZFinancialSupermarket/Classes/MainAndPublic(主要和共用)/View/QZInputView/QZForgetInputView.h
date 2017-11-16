//
//  QZForgetInputView.h
//  
//
//  Created by wzh on 17/3/15.
//
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, QZForgetInputType) {
    QZForgetInputTypeDefaut = 0,
    //输入手机号
    QZForgetInputTypeInputPhone,
    //输入密码
    QZForgetInputTypeInputPwd,
    //输入验证码
    QZForgetInputTypeInputDigitalCode,
    //输入图形验证码
    QZForgetInputTypeInputGraphicsCode,
    //其他
    QZForgetInputTypeInputOther
};

@class QZForgetInputView;
@protocol QZForgetInputViewDelegate <NSObject>

- (void)rightActionWithBtn:(ZHVerCodeButton *)btn view:(QZForgetInputView *)inputView;

@end

@interface QZForgetInputView : UIView<UITextFieldDelegate>

@property (assign, nonatomic) QZForgetInputType forgetInputType;
@property (nonatomic, copy) void(^rightBtnAction)(QZForgetInputView *inputView);
@property (nonatomic, weak) __weak id<QZForgetInputViewDelegate> delegate;

@property (strong, nonatomic) IBOutlet UIView *view;
@property (weak, nonatomic) IBOutlet UIView *topLineView;
@property (weak, nonatomic) IBOutlet UIView *bottomLineView;
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLab;
@property (weak, nonatomic) IBOutlet UIView *btnView;
@property (weak, nonatomic) IBOutlet ZHVerCodeButton *rightBtn;
@property (weak, nonatomic) IBOutlet ZHTextField *inputTextField;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *btnViewW;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *iconImageViewW;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *iconAndLabMid;

- (NSString *)getInputText;
@end
