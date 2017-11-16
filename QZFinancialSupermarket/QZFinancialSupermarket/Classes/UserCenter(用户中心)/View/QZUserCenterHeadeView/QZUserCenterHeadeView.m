//
//  QZUserCenterHeadeView.m
//  QZFinancialSupermarket
//
//  Created by wzh on 2017/9/12.
//  Copyright © 2017年 wzh. All rights reserved.
//

#import "QZUserCenterHeadeView.h"

@interface QZUserCenterHeadeView ()


@end


@implementation QZUserCenterHeadeView

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
    [[NSBundle mainBundle] loadNibNamed:@"QZUserCenterHeadeView" owner:self options:nil];
    [self addSubview:self.view];
    [self setDefautUI];
}
- (void)setDefautUI{
    self.view.backgroundColor = [UIColor colorWith0x4180E9];
    
    [self.titleLab text:@"个人账户" textColor:[UIColor whiteColor] textFont:[UIFont textCustomFont20]];
    [self.iconBtn setBackgroundImage:[UIImage imageNamed:@"头像-未登录"] forState:UIControlStateNormal];
    [self.iconBtn setBackgroundImage:[UIImage imageNamed:@"头像-登录"] forState:UIControlStateSelected];
    self.iconBtn.selected = NO;
    
    [self.loginBtn title:@"点击登录" titleColor:[UIColor whiteColor] titleFont:[UIFont textCustomFont20]];

}
- (IBAction)loginBtnAction:(id)sender {
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(userCenterLoginAction)]) {
        [self.delegate userCenterLoginAction];
    }
    
}
- (void)layoutSubviews{
    [super layoutSubviews];
    self.view.frame = self.bounds;
}

@end
