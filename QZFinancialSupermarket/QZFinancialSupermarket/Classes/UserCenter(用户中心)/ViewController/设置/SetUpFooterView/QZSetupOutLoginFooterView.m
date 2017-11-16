//
//  QZSetupOutLoginFooterView.h
//
//
//  Created by wzh on 2017/6/17.
//
//

#import "QZSetupOutLoginFooterView.h"

@implementation QZSetupOutLoginFooterView

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self setUI];
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUI];
    }
    return self;
}
- (void)setUI{
    
    
    CGFloat btnW = 320 * kScaleOfX;
    CGFloat btnH = 45 * kScaleOfX;
    
    UIButton *nextBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    nextBtn.size = CGSizeMake(btnW, btnH);
    nextBtn.center = CGPointMake(self.width / 2, (self.height) / 2 );
    [nextBtn addTarget:self action:@selector(nextBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [nextBtn title:@"退出登录" titleColor:[UIColor whiteColor] titleFont:[UIFont textCustomFont18] backgroundColor:[UIColor colorWith0x4180E9]];
    [nextBtn styleWithCornerRadius:kRadiusWidthWithBtn];
    [self addSubview:nextBtn];
    self.nextBtn = nextBtn;
    
}
- (void)nextBtnAction:(UIButton *)button{
    NSLog(@"点击了下一步");
    if([self.delegate respondsToSelector:@selector(nextBtnActionWithView:)]){
        [self.delegate nextBtnActionWithView:self];
    }
}
@end
