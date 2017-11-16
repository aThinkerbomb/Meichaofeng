//
//  QZFloationgLayerView.m
//  QZFinancialSupermarket
//
//  Created by wzh on 17/3/13.
//
//

#import "QZAccountPromptView.h"

@implementation QZAccountPromptView

- (UIView *)bgLayerView{
    if(!_bgLayerView){
        _bgLayerView = [[UIView alloc]init];
        [_bgLayerView addSubview:self];
    }
    return _bgLayerView;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUI];
    }
    return self;
}
- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self setUI];
    }
    return self;
}
- (void)setUI{
    [[NSBundle mainBundle] loadNibNamed:@"QZAccountPromptView" owner:self options:nil];
    [self addSubview:self.accountPromptView];
    [self setDefatUI];
}

- (void)setDefatUI{
    self.accountPromptView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.7];

    [self.contentView styleWithCornerRadius:10*kScaleOfX];

    self.titleLab.text = @"温馨提示";
    self.titleLab.textColor = [UIColor colorWith0x161615];
    self.titleLab.font = [UIFont textCustomFont18];
  
    self.lineView.backgroundColor = [UIColor colorWith0xd7d7d7];
    self.desLab.text = @"奇子向钱用户登录密码与奇速贷通用，可直接输入；新用户直接录入密码即为登录密码。";
    self.desLab.textColor =  [UIColor colorWith0x161615];
    self.desLab.font = [UIFont textCustomFont15];
    
    [self.closeBtn setImage:[UIImage imageNamed:@"关闭"] forState:UIControlStateNormal];

}
- (IBAction)closeBtnClicked:(id)sender {
    [self removeFromSuperview];
}

/*
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self closeBtnClicked:nil];
}
 */
- (void)layoutSubviews{
    [super layoutSubviews];
//    self.bgLayerView.frame = self.bounds;
    self.accountPromptView.frame = self.bounds;
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
