//
//  ZHAlertView.m
//  QZFinancialSupermarket
//
//  Created by wzh on 2017/8/23.
//
//

#import "ZHAlertView.h"

@interface ZHAlertView ()



@property (nonatomic, strong) UIView *lineView;
@property (nonatomic, strong) UIView *midLineView;
@end

@implementation ZHAlertView

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
    self.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0.8];
    
    UIView *contentView = [[UIView alloc]init];
    contentView.backgroundColor = [UIColor whiteColor];
    [self addSubview:contentView];
    self.contentView = contentView;
    
    UILabel *titleLab = [[UILabel alloc]init];
    titleLab.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:titleLab];
    self.titleLab = titleLab;
    
    UILabel *desLab = [[UILabel alloc]init];
    desLab.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:desLab];
    self.desLab = desLab;
    
    UILabel *messageLab = [[UILabel alloc]init];
    messageLab.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:messageLab];
    self.messageLab = messageLab;
    
    
    UIView *lineView = [[UIView alloc]init];
    lineView.backgroundColor = [UIColor colorWith0x999999];
    [self.contentView addSubview:lineView];
    self.lineView = lineView;
    

    
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [self.contentView addSubview:leftBtn];
    [leftBtn addTarget:self action:@selector(leftBtnAction) forControlEvents:UIControlEventTouchUpInside];
    self.leftBtn = leftBtn;
    
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.contentView addSubview:rightBtn];
    [rightBtn addTarget:self action:@selector(rightBtnAction) forControlEvents:UIControlEventTouchUpInside];

    self.rightBtn = rightBtn;
    
    UIView *midLineView = [[UIView alloc]init];
    midLineView.backgroundColor = [UIColor colorWith0x999999];
    [self.contentView addSubview:midLineView];
    self.midLineView = midLineView;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    CGFloat contentLeft = 65 / 2;
    self.contentView.width = self.width - contentLeft * 2;
    
    CGFloat titleTop = 25 * kScaleOfX;
    CGFloat titleH = 20 * kScaleOfX;
    self.titleLab.frame = CGRectMake(0, titleTop, self.contentView.width, titleH);
    
    CGFloat desTop = CGRectGetMaxY(self.titleLab.frame) + 22 * kScaleOfX;
    self.desLab.frame = CGRectMake(0, desTop, self.contentView.width, 0);
    [self.desLab sizeToFit];
    self.desLab.centerX = self.contentView.width / 2;
    
    CGFloat messageTop = CGRectGetMaxY(self.desLab.frame) + 22 * kScaleOfX;
    self.messageLab.frame = CGRectMake(0, messageTop, self.contentView.width, 0);
    [self.messageLab sizeToFit];
    self.messageLab.centerX = self.contentView.width / 2;

    
    CGFloat lineTop = CGRectGetMaxY(self.messageLab.frame) + 20 * kScaleOfX;
    self.lineView.frame = CGRectMake(0, lineTop, self.contentView.width, 0.5);
    
    CGFloat btnH = 48 * kScaleOfX;
    self.leftBtn.frame = CGRectMake(0, CGRectGetMaxY(self.lineView.frame), self.contentView.width  / 2, btnH);
    self.rightBtn.frame = CGRectMake(CGRectGetMaxX(self.leftBtn.frame), self.leftBtn.y, self.leftBtn.width, btnH);

    self.midLineView.size = CGSizeMake(0.5, btnH);
    self.midLineView.y = self.leftBtn.y;
    self.midLineView.centerX = self.contentView.width / 2;
    
    self.contentView.height = CGRectGetMaxY(self.leftBtn.frame);
//    [self.contentView sizeToFit];

    self.contentView.center = CGPointMake(self.width / 2, self.height / 2);

    [self.contentView styleWithCornerRadius:10 * kScaleOfX];
}

- (void)rightBtnAction{
    if(self.rightHandler){
        self.rightHandler();
        [self removeFromSuperview];
    }
}

- (void)leftBtnAction{
    if(self.leftHandler){
        self.leftHandler();
        [self removeFromSuperview];
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self removeFromSuperview];
}
@end
