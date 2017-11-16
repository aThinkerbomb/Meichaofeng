//
//  QZCouponRuleView.m
//  QZFinancialSupermarket
//
//  Created by wzh on 17/3/21.
//
//

#import "QZCouponRuleView.h"

@implementation QZCouponRuleView

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
    [[NSBundle mainBundle] loadNibNamed:@"QZCouponRuleView" owner:self options:nil];
    [self addSubview:self.view];
    [self setDefatUI];
}
- (void)setDefatUI{
    self.view.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.7];
    self.topImageView.image = [UIImage imageNamed:@"规则"];
    [self.closeBtn setImage:[UIImage imageNamed:@"还款详情关闭"] forState:UIControlStateNormal];
    [self.desView styleWithCornerRadius:10 * kScaleOfX];
    
    [self.titleLab text:@"优惠券使用规则" textColor:[UIColor colorWith0x29344a] textFont:[UIFont textCustomFont15]];

    [self.deslab attributedText:@"1.优惠券只能在用户还款时可以使用。\n2.每笔借款只能使用1张优惠券,不能叠加使用。\n3.优惠券不找零，不可提现或转让。\n4.优惠券逾期还款不可使用。" textColor:[UIColor colorWith0x29344a] textFont:[UIFont textCustomFont13] lineSpacing:20 * kScaleOfX];

    [self.title1Lab text:@"如何获取优惠券" textColor:[UIColor colorWith0x29344a] textFont:[UIFont textCustomFont15]];
    
    [self.des1Lab text: @"邀请好友加入奇速贷,您将有机会获得优惠券。" textColor:[UIColor colorWith0x161615] textFont:[UIFont textCustomFont14]];
    [self.des2Lab text:@"如有疑问请联系客服：" textColor:[UIColor colorWith0x29344a] textFont:[UIFont textCustomFont13]];
    
    [self.phoneNumBtn title:[NSString stringWithFormat:@"%@",QZServerTelePhone] titleColor:[UIColor colorWith0xf27d00] titleFont:[UIFont textCustomFont13]];
    self.lineView.backgroundColor = [UIColor colorWith0xf27d00];
    self.lineTop.constant = -6*kScaleOfX;
}
- (IBAction)callPhone:(id)sender {
    [ZHTool callPhoneTel];
//    [ZHTool callPhoneWithView:self];
}
- (IBAction)closeBtnClicked:(id)sender {
    [self removeFromSuperview];
}
- (void)layoutSubviews{
    [super layoutSubviews];
    //    self.bgLayerView.frame = self.bounds;
    self.view.frame = self.bounds;
    
}
@end
