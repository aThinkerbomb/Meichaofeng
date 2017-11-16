//
//  ZHNavView.m
//  QZFinancialSupermarket
//
//  Created by wzh on 17/3/9.
//
//

#import "ZHNavBarView.h"
#define Defaut_Left 16
#define Defaut_StatusBarHeight 20
@implementation ZHNavBarView


- (UIButton *)leftBtn{
    if(!_leftBtn){
        _leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:_leftBtn];
    }
    return _leftBtn;
}


- (instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        [self setUI];
    }
    return self;
}
- (id)initWithCoder:(NSCoder *)decoder
{
    if (self = [super initWithCoder:decoder]) {
        
        [self setUI];
    }
    return self;
}
- (void)setUI{
    self.backgroundColor = [UIColor clearColor];
    [self.leftBtn setImage:[UIImage imageNamed:@"登录返回"] forState:UIControlStateNormal];

}
- (void)layoutSubviews{
    [super layoutSubviews];
    self.leftBtn.size = CGSizeMake(50, 50);
    self.leftBtn.origin = CGPointMake(Defaut_Left, (self.height - Defaut_StatusBarHeight   - self.leftBtn.height) / 2 + Defaut_StatusBarHeight);
    self.leftBtn.imageEdgeInsets = UIEdgeInsetsMake(0, -self.leftBtn.size.width / 2, 0, 0);
}
@end
