//
//  QZInputPhoneView.m
//  
//
//  Created by wzh on 17/3/6.
//
//

#import "QZInputView.h"

@implementation QZInputView

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
    [[NSBundle mainBundle] loadNibNamed:@"QZInputView" owner:self options:nil];
    [self addSubview:self.view];
}
- (void)setDefautUI{
    self.rightBtn.hidden = NO;
    self.bottomLinrLeft.constant = 15 * kScaleOfX;
    self.bottomLineRight.constant = 15 * kScaleOfX;
    self.iconImageLeft.constant = 17 * kScaleOfX;
    self.textfieldLeft.constant = 15 * kScaleOfX;
    self.rightBtnRight.constant = 25 * kScaleOfX;
    
    
    [self.rightBtn setBackgroundColor:[UIColor clearColor]];
    [self.rightBtn styleWithCornerRadius:kRadiusWidthWithBtn];
    self.iconImageView.contentMode = UIViewContentModeCenter;
    
    
    self.inputTextField.font = [UIFont textCustomFont15];
    self.inputTextField.textColor = [UIColor colorWith0x333333];
    self.bottomLineView.backgroundColor = [UIColor colorWith0xEFEFEF];
    self.midLineView.backgroundColor = [UIColor colorWith0xEFEFEF];
    
    
    [self.rightBtn setTitle:@"" forState:UIControlStateNormal];
    [self.rightBtn setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    [self.rightBtn setImage:[UIImage imageNamed:@""] forState:UIControlStateSelected];
    self.inputTextField.secureTextEntry = NO;
    self.inputTextField.delegate = self;
    self.inputTextField.extensonDelegate = self;



}

- (void)setInputType:(QZInputViewType)inputType{
    _inputType = inputType;
    [self setDefautUI];
    switch (self.inputType) {
        case QZInputViewTypeDefaut:
        case QZInputViewTypeInputPhone:{
            self.rightBtn.hidden = YES;
            self.iconImageView.image = [UIImage zhImageWithName:@"手机号"];
            self.inputTextField.placeholder = @"手机号";
            self.inputTextField.keyboardType = UIKeyboardTypeNumberPad;
        }
            break;
        case QZInputViewTypeInputPwd:{
            [self.rightBtn setImage:[UIImage imageNamed:@"不显示密码"] forState:UIControlStateNormal];
            [self.rightBtn setImage:[UIImage imageNamed:@"显示密码"] forState:UIControlStateSelected];

            self.iconImageView.image = [UIImage zhImageWithName:@"密码"];
            self.inputTextField.placeholder = @"密码(6-20位数字字母组合)";
            self.inputTextField.keyboardType = UIKeyboardTypeASCIICapable;
            self.inputTextField.secureTextEntry = YES;

        }
            break;
        case QZInputViewTypeInputDigitalCode:{
            [self.rightBtn setBackgroundColor:[UIColor colorWith0x4180E9]];
            self.iconImageView.image = [UIImage zhImageWithName:@"验证码"];
            [self.rightBtn setTitle:@"发送验证码" forState:UIControlStateNormal];
            [self.rightBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            self.rightBtn.titleLabel.font = [UIFont textCustomFont14];
            self.inputTextField.placeholder = @"短信验证码";
            self.inputTextField.keyboardType = UIKeyboardTypeNumberPad;

        }
            break;
            
        case QZInputViewTypeInputGraphicsCode:{
            self.iconImageView.image = [UIImage zhImageWithName:@"图形验证码"];
            self.inputTextField.placeholder = @"图形验证码";
//            self.inputTextField.keyboardType = UIKeyboardTypeNumberPad;
        }
            break;
            
        default:
            break;
    }
}

- (void)setLineViewIsHidden:(BOOL)lineViewIsHidden{
    _lineViewIsHidden = lineViewIsHidden;
    self.bottomLineView.hidden = _lineViewIsHidden;
}
- (void)layoutSubviews{
    [super layoutSubviews];
    self.view.frame = self.bounds;

    
    CGFloat mid = 32 * kScaleOfX;
    //如果隐藏
    if(self.rightBtn.hidden){
        self.rightBtnW.constant = 0;
    }else{
        //如果设置图片 根据图片
        if([self.rightBtn currentImage] && [self.rightBtn currentTitle]){
            self.rightBtnW.constant = self.rightBtn.imageView.image.size.width + 10 + [ZHTool sizeWithString_W:self.rightBtn.currentTitle font:self.rightBtn.titleLabel.font height:self.rightBtn.height];
        }else if ([self.rightBtn currentImage] && ![self.rightBtn currentTitle]){
            self.rightBtnW.constant = self.rightBtn.imageView.image.size.width + 10;
        }else if (![self.rightBtn currentImage] && [self.rightBtn currentTitle]){
            self.rightBtnW.constant =  [ZHTool sizeWithString_W:self.rightBtn.currentTitle font:self.rightBtn.titleLabel.font height:self.rightBtn.height] + mid;
        }else{
            self.rightBtnW.constant = 0;
        }
    }

    [self.inputTextField setValue:[UIColor colorWith0xCBCBCB] forKeyPath:QZPlacehoderTitleColor];
    [self.inputTextField setValue:[UIFont textCustomFont15] forKeyPath:QZPlacehoderTitleFont];
}
- (IBAction)rightBtnClicked:(ZHVerCodeButton *)sender {
    NSLog(@"点击了按钮");
    if(self.inputType == QZInputViewTypeInputDigitalCode){
//        [sender getVerificationCode];
    }
    if(self.inputType == QZInputViewTypeInputPwd){
        sender.selected = !sender.selected;
        self.inputTextField.secureTextEntry = !sender.selected;
        
    }
    if(self.rightBtnAction){
        self.rightBtnAction(self);
    }
    if([self.delegate respondsToSelector:@selector(rightActionWithBtn:view:)]){
        [self.delegate rightActionWithBtn:sender view:self];
    }
}
#pragma makk --- UITextFieldExtensionDelegate
- (void)textFieldEditingChange:(ZHTextField *)textField{
    if (self.delegate && [self.delegate respondsToSelector:@selector(YXTextFieldDidBeginEditing:)]) {
        [self.delegate YXTextFieldDidBeginEditing:textField];
    }
}
#pragma makk --- UITextFieldDelegate
-(void)textFieldDidEndEditing:(UITextField *)textField{
    switch (self.inputType) {
        case QZInputViewTypeDefaut:
        case QZInputViewTypeInputPhone:{
         
        }
            break;
        case QZInputViewTypeInputPwd:{
            if(textField.text.length <= 0){
                return;
            }
            if(![textField.text validLengthMin:QZLoginPwdMinNum andMax:QZLoginPwdMaxNum]){
                textField.text = @"";
//                [self showHudWithHint:QZLoginPwdInputError];
            }
        }
            break;
        case QZInputViewTypeInputDigitalCode:{
           
        }
            break;
            
        case QZInputViewTypeInputGraphicsCode:{
        }
            break;
            
        default:
            break;
    }
}


- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    NSInteger existedLength = textField.text.length;
    NSInteger selectedLength = range.length;
    NSInteger replaceLength = string.length;
    switch (self.inputType) {
        case QZInputViewTypeDefaut:
        case QZInputViewTypeInputPhone:{
            if (existedLength - selectedLength + replaceLength > QZPhoneNumMaxNum) {
                return NO;
            }
        }
            break;
        case QZInputViewTypeInputPwd:{
            if([string stringContainsEmoji]){
//                [self showHudWithHint:QZLoginPwdInputEmojiError];
                return NO;
            }else if (textField.text.length > QZLoginPwdMaxNum){
//                [self showHudWithHint:QZLoginPwdInputError];
                return NO;
            }
        }
            break;
        case QZInputViewTypeInputDigitalCode:{
            if (existedLength - selectedLength + replaceLength > QZSMSCodeMaxNum) {
                return NO;
            }
        }
            break;
        case QZInputViewTypeInputGraphicsCode:{
        }
            break;
            
        default:
            break;
    }
    return YES;
}

- (NSString *)getInputText{
    if([ZHTool isNUllOrIsEmptyWith:self.inputTextField.text]){
        return @"";
    }
    return [NSString stringWithFormat:@"%@",self.inputTextField.text];
}
@end
