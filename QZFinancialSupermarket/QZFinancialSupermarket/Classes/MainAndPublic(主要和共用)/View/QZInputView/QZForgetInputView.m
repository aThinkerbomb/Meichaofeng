//
//  QZForgetInputView.m
//  
//
//  Created by wzh on 17/3/15.
//
//

#import "QZForgetInputView.h"

@implementation QZForgetInputView

- (instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        [self setUI];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        [self setUI];
    }
    return self;
}

- (void)setUI{
    [[NSBundle mainBundle] loadNibNamed:@"QZForgetInputView" owner:self options:nil];
    [self addSubview:self.view];
}
- (void)setDefautUI{
    
    self.iconImageViewW.constant = 20 * kScaleOfX;
    self.iconAndLabMid.constant = 10 * kScaleOfX;
    
    self.view.backgroundColor = [UIColor clearColor];
    self.btnView.hidden = NO;
    
    self.titleLab.textColor = [UIColor colorWith0x29344a];
    self.titleLab.font = [UIFont textCustomFont16];
    self.inputTextField.font = [UIFont textCustomFont16];
    self.topLineView.backgroundColor = [UIColor colorWith0xd7d7d7];
    self.bottomLineView.backgroundColor = [UIColor colorWith0xd7d7d7];
    [self.rightBtn setTitle:@"" forState:UIControlStateNormal];
    [self.rightBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.inputTextField.textColor = [UIColor colorWith0x29344a];
    self.inputTextField.delegate = self;
    self.inputTextField.secureTextEntry = NO;


}
- (void)setForgetInputType:(QZForgetInputType)forgetInputType{
    _forgetInputType = forgetInputType;
    [self setDefautUI];
    switch (_forgetInputType) {
        case QZForgetInputTypeDefaut:
        case QZForgetInputTypeInputPhone:{
            self.btnView.hidden = YES;
            self.titleLab.text = @"手机号码";
            self.iconImageView.image = [UIImage zhImageWithName:@"手机号码_忘记密码"];
            self.inputTextField.placeholder = @"输入手机号码";
            self.inputTextField.keyboardType = UIKeyboardTypeNumberPad;
        }
            break;
        case QZForgetInputTypeInputPwd:{
            self.btnView.hidden = YES;
            self.titleLab.text = @"设置新密码";
            self.iconImageView.image = [UIImage zhImageWithName:@"设置新密码_忘记密码"];
            self.inputTextField.placeholder = @"6-20位数字字母组合";
            self.inputTextField.keyboardType = UIKeyboardTypeASCIICapable;
            self.inputTextField.secureTextEntry = YES;

        }
            break;
        case QZForgetInputTypeInputDigitalCode:{
            self.titleLab.text = @"短信验证码";
            self.iconImageView.image = [UIImage zhImageWithName:@"短信验证码_忘记密码"];
            self.inputTextField.placeholder = @"短信验证码";
            self.inputTextField.keyboardType = UIKeyboardTypeNumberPad;
            [self.rightBtn setTitle:@"发送验证码" forState:UIControlStateNormal];            
            self.rightBtn.titleLabel.font = [UIFont textCustomFont11];
            self.rightBtn.backgroundColor = [UIColor colorWith0xf27d00];

        }
            break;
            
        case QZForgetInputTypeInputGraphicsCode:{
            self.titleLab.text = @"图形验证码";
            self.iconImageView.image = [UIImage zhImageWithName:@"图形验证码_忘记密码"];
            self.inputTextField.placeholder = @"图形验证码";
//            self.inputTextField.keyboardType = UIKeyboardTypeNumberPad;

            self.rightBtn.backgroundColor = [UIColor colorWith0xefdac4];
        }
            break;
            
        default:
            break;
    }
}
- (IBAction)rightBtnClicked:(ZHVerCodeButton *)sender {
    NSLog(@"点击了按钮");
    if(self.forgetInputType == QZForgetInputTypeInputDigitalCode){
//        [sender getVerificationCode];
    }
    if(self.rightBtnAction){
        self.rightBtnAction(self);
    }
    if([self.delegate respondsToSelector:@selector(rightActionWithBtn:view:)]){
        [self.delegate rightActionWithBtn:sender view:self];
    }

}
- (NSString *)getInputText{
    if([ZHTool isNUllOrIsEmptyWith:self.inputTextField.text]){
        return @"";
    }
    return self.inputTextField.text;
}
- (void)layoutSubviews{
    [super layoutSubviews];
    self.view.frame = self.bounds;
    if(self.btnView.hidden){
        self.btnViewW.constant = 0;
    }else{
        self.btnViewW.constant = 75 *kScaleOfX;
    }
    [self.rightBtn styleWithCornerRadius: 3 * kScaleOfX];
    [self.inputTextField setValue:[UIColor colorWith0xb4b4b4] forKeyPath:QZPlacehoderTitleColor];
//    [self.inputTextField setValue:[UIFont textCustomFont16] forKey:QZPlacehoderTitleFont];
    
}

#pragma makk --- UITextFieldDelegate

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    NSInteger existedLength = textField.text.length;
    NSInteger selectedLength = range.length;
    NSInteger replaceLength = string.length;
    switch (_forgetInputType) {
        case QZForgetInputTypeDefaut:
        case QZForgetInputTypeInputPhone:{
            if (existedLength - selectedLength + replaceLength > QZPhoneNumMaxNum) {
                return NO;
            }
        }
            break;
        case QZForgetInputTypeInputPwd:{
            
        }
            break;
        case QZForgetInputTypeInputDigitalCode:{
            if (existedLength - selectedLength + replaceLength > QZSMSCodeMaxNum) {
                return NO;
            }
        }
            break;
            
        case QZForgetInputTypeInputGraphicsCode:{
        }
            break;
            
        default:
            break;
    }

    return YES;
}
@end
