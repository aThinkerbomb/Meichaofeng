//
//  QZUnitInputView.m
//  QZFinancialSupermarket
//
//  Created by wzh on 2017/6/14.
//
//

#import "QZUnitInputView.h"

@implementation QZUnitInputView


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
    [[NSBundle mainBundle] loadNibNamed:@"QZUnitInputView" owner:self options:nil];
    [self addSubview:self.view];
    [self setDefautUI];
}
- (void)setDefautUI{
    
    self.topLineView.backgroundColor = [UIColor colorWith0xd7d7d7];
    self.bottomLineView.backgroundColor = [UIColor colorWith0xd7d7d7];
    self.midLineView.backgroundColor = [UIColor colorWith0x29344a];
    self.iconImageView.contentMode = UIViewContentModeCenter;
    self.iconImageView.image = [UIImage imageNamed:@"单位电话"];
    
    self.afterTextField.font = [UIFont textCustomFont15];
    self.afterTextField.textColor = [UIColor colorWith0x29344a];
    [self.afterTextField setValue:[UIColor colorWith0x888888] forKeyPath:QZPlacehoderTitleColor];
    [self.afterTextField setValue:[UIFont textCustomFont15] forKeyPath:QZPlacehoderTitleFont];
    self.afterTextField.keyboardType = UIKeyboardTypeNumberPad;
    self.afterTextField.delegate = self;
    
    self.beforeTextField.font = [UIFont textCustomFont15];
    self.beforeTextField.textColor = [UIColor colorWith0x29344a];
    [self.beforeTextField setValue:[UIColor colorWith0x888888] forKeyPath:QZPlacehoderTitleColor];
    [self.beforeTextField setValue:[UIFont textCustomFont15] forKeyPath:QZPlacehoderTitleFont];
    self.beforeTextField.keyboardType = UIKeyboardTypeNumberPad;
    self.beforeTextField.delegate = self;
    self.beforeTextField.placeholder = @"区号";
    self.afterTextField.placeholder = @"单位电话";
    self.titleLab.text = @"单位电话";
    self.titleLab.textColor = [UIColor colorWith0x29344a];
    self.titleLab.font  = [UIFont textCustomFont15];
    
    self.topLineLeft.constant = 15 * kScaleOfX;
    self.topLineRight.constant = 15 * kScaleOfX;
    self.bottomLineView.hidden = YES;
}

#pragma -mark 按return键键盘往下收
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if (textField==self.afterTextField) {
        if (string.length == 0){
            return YES;
        }
        NSInteger existedLength = textField.text.length;
        NSInteger selectedLength = range.length;
        NSInteger replaceLength = string.length;
        if (existedLength - selectedLength + replaceLength >8) {
            return NO;
        }
    }
    
    if(textField == self.beforeTextField){
        if (string.length == 0){
            return YES;
        }
        NSInteger existedLength = textField.text.length;
        NSInteger selectedLength = range.length;
        NSInteger replaceLength = string.length;
        if (existedLength - selectedLength + replaceLength >4) {
            return NO;
        }
    }
    return YES;
}
- (void)setItemBeforeTextFieldText:(NSString *)beforeTextFieldtext afterTextFieldText:(NSString *)afterTextFieldText{
    self.afterTextField.text = afterTextFieldText;
    self.beforeTextField.text = beforeTextFieldtext;
}
- (NSString *)getBeforeText{
    if([ZHTool isNUllOrIsEmptyWith:self.beforeTextField.text]){
        return @"";
    }
    return [NSString stringWithFormat:@"%@",self.beforeTextField.text];

}
- (NSString *)getAfterText{
    if([ZHTool isNUllOrIsEmptyWith:self.afterTextField.text]){
        return @"";
    }
    return [NSString stringWithFormat:@"%@",self.afterTextField.text];
}
- (void)layoutSubviews{
    [super layoutSubviews];
    self.view.frame = self.bounds;
}

@end
