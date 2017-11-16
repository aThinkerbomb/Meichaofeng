//
//  QZInputPhoneView.h
//  
//
//  Created by wzh on 17/3/6.
//
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, QZInputViewType) {
    QZInputViewTypeDefaut = 0,
    //输入手机号
    QZInputViewTypeInputPhone,
    //输入密码
    QZInputViewTypeInputPwd,
    //输入验证码
    QZInputViewTypeInputDigitalCode,
    //输入图形验证码
    QZInputViewTypeInputGraphicsCode,
    //其他
    QZInputViewTypeInputOther
};

@class QZInputView;
@protocol QZInputViewDelegate <NSObject>

- (void)rightActionWithBtn:(ZHVerCodeButton *)btn view:(QZInputView *)inputView;
@optional
- (void)YXTextFieldDidBeginEditing:(ZHTextField *)textField;
@end

@interface QZInputView : UIView<UITextFieldDelegate,UITextFieldExtensionDelegate>
@property (nonatomic, copy) void(^rightBtnAction)(QZInputView *inputView);
@property (nonatomic, weak) __weak id<QZInputViewDelegate> delegate;
@property (strong, nonatomic) IBOutlet UIView *view;
@property (assign, nonatomic) QZInputViewType inputType;
@property (weak, nonatomic) IBOutlet UIView *bottomLineView;
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet ZHVerCodeButton *rightBtn;
@property (weak, nonatomic) IBOutlet ZHTextField *inputTextField;
@property (weak, nonatomic) IBOutlet UIView *midLineView;


@property (weak, nonatomic) IBOutlet NSLayoutConstraint *rightBtnW;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomLinrLeft;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomLineRight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *iconImageLeft;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *textfieldLeft;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *rightBtnRight;
@property (nonatomic, assign) BOOL lineViewIsHidden;

- (NSString *)getInputText;

@end
