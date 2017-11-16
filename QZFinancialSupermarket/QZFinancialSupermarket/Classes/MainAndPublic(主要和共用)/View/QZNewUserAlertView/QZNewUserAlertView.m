//
//  QZNewUserAlertView.m
//  QZFinancialSupermarket
//
//  Created by wzh on 2017/8/4.
//
//

#import "QZNewUserAlertView.h"

@interface QZNewUserAlertView ()
@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UIButton *closeBtn;
@property (nonatomic, strong) UIButton *confirmBtn;
@end

@implementation QZNewUserAlertView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setDefautUI];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self setDefautUI];
    }
    return self;
}

- (void)setDefautUI{
    self.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0.7];
    

    UIButton *imageViewBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [imageViewBtn setImage:[UIImage imageNamed:@"新用户注册弹窗"] forState:UIControlStateNormal];
    imageViewBtn.userInteractionEnabled = NO;
    [self addSubview:imageViewBtn];
    self.imageViewBtn = imageViewBtn;
    
    UIButton *closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [closeBtn setImage:[UIImage imageNamed:@"注册弹框关闭按钮"] forState:UIControlStateNormal];
    [closeBtn addTarget:self action:@selector(closeBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:closeBtn];
    self.closeBtn = closeBtn;
    
    UIButton *cofirmBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    cofirmBtn.hidden = YES;
    [cofirmBtn setImage:[UIImage imageNamed:@"立即使用按钮"] forState:UIControlStateNormal];
    [cofirmBtn addTarget:self action:@selector(cofirmBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:cofirmBtn];
    self.confirmBtn = cofirmBtn;
    
    
    [self setupSubViewFrame];
}

- (void)setupSubViewFrame{
    CGFloat closeBtnX = 295 * kScaleOfX ;
    CGFloat closeBtnY = 105 * kScaleOfX;
    CGFloat closeBtnW = 30 * kScaleOfX;
    CGFloat closeBtnH = 30 * kScaleOfX;
    self.closeBtn.frame = CGRectMake(closeBtnX, closeBtnY, closeBtnW, closeBtnH);
    
    CGFloat imageTopCloseBtn = CGRectGetMaxY(self.closeBtn.frame) + 15 * kScaleOfX;
    CGFloat imageViewBtnLeft = 50 * kScaleOfX;
    CGFloat imageViewBtnW = kScreenWidth - imageViewBtnLeft * 2;
    CGFloat imageViewBtnH = 407 * kScaleOfX;
    self.imageViewBtn.frame = CGRectMake(imageViewBtnLeft, imageTopCloseBtn, imageViewBtnW, imageViewBtnH);
    
    CGFloat cofirmTop = CGRectGetMaxY(self.imageViewBtn.frame) + 15 * kScaleOfX;
    CGFloat cofirmBtnW = 145 * kScaleOfX;
    CGFloat cofirmBtnH = 40 * kScaleOfX;
    self.confirmBtn.size = CGSizeMake(cofirmBtnW, cofirmBtnH);
    self.confirmBtn.y = cofirmTop;
    self.confirmBtn.centerX = self.centerX;
    
    self.bgView.frame = self.bounds;
    
}

- (void)closeBtnAction{
    [self didNewUser];
//    [self removeFromSuperview];
}

- (void)cofirmBtnAction{
    [self didNewUser];
//    [self removeFromSuperview];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self didNewUser];
}
- (void)didNewUser{
    if([self.delegate respondsToSelector:@selector(didNewUserAlertWithView:)]){
        [self.delegate didNewUserAlertWithView:self];
    }
}
@end
