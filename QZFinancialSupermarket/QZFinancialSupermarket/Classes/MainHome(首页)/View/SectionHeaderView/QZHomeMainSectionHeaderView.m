//
//  QZHomeMainSectionHeaderView.m
//  QZFinancialSupermarket
//
//  Created by wzh on 2017/9/13.
//  Copyright © 2017年 wzh. All rights reserved.
//

#import "QZHomeMainSectionHeaderView.h"


@interface QZHomeMainSectionHeaderView ()
@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UIButton *leftBtn;
@property (nonatomic, strong) UIButton *rightBtn;
@property (nonatomic, strong) UIView *lineView;

@property (nonatomic, copy) RightButtonClick rightHandle;
@end
@implementation QZHomeMainSectionHeaderView

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
    
    self.backgroundColor = [UIColor clearColor];
    UIView *bgView = [[UIView alloc]init];
    bgView.backgroundColor = [UIColor whiteColor];
    [self addSubview:bgView];
    self.bgView = bgView;
    
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftBtn title:@"热门推荐贷款" titleColor:[UIColor blackColor] imageName:@"热门" titleFont:[UIFont textCustomFont15]];
    [self.bgView addSubview:leftBtn];
    self.leftBtn = leftBtn;
    
    
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightBtn title:@"全部贷款" titleColor:[UIColor colorWith0x8A8A8A] imageName:@"nextArrow" titleFont:[UIFont textCustomFont15]];
    [rightBtn addTarget:self action:@selector(rightAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.bgView addSubview:rightBtn];
    self.rightBtn = rightBtn;
    
    UIView *lineView = [[UIView alloc]init];
    lineView.backgroundColor = [UIColor colorWith0xEFEFEF];
    [self.bgView addSubview:lineView];
    self.lineView = lineView;
    

}
- (void)layoutSubviews{
    [super layoutSubviews];
    
    CGFloat bgY = 8 *kScaleOfX;
    CGFloat leftAndRight = 15 * kScaleOfX;
    CGFloat leftBtnW = 110 *kScaleOfX;
    CGFloat rightBtnW = 80 *kScaleOfX;
    CGFloat lineH  = 0.5;
    
    self.bgView.frame = CGRectMake(0, bgY, self.width, self.height - bgY);
    self.leftBtn.frame = CGRectMake(leftAndRight, 0, leftBtnW, self.bgView.height);
    self.leftBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    self.rightBtn.frame = CGRectMake(self.bgView.width - leftAndRight - rightBtnW, 0, rightBtnW, self.bgView.height);
    [self.leftBtn layoutButtonWithEdgeInsetsStyle:ZH_ButtonEdgeInsetsStyleLeft imageTitleSpace:5 *kScaleOfX ];
    [self.rightBtn layoutButtonWithEdgeInsetsStyle:ZH_ButtonEdgeInsetsStyleRight imageTitleSpace:5 *kScaleOfX];
    self.lineView.frame = CGRectMake(0, self.bgView.height - lineH, self.bgView.width, lineH);
}

- (void)rightAction:(UIButton *)button {
    if (self.rightHandle) {
        self.rightHandle(self.section);
    }
}


- (void)sectionHeaderViewLeftTitle:(NSString *)title {
    [self.leftBtn setTitle:title forState:UIControlStateNormal];
}

- (void)sectionHeaderViewRightTitle:(NSString *)title {
    [self.rightBtn setTitle:title forState:UIControlStateNormal];
}

- (void)sectionHeaderViewLeftImage:(UIImage *)image {
    [self.leftBtn setImage:image forState:UIControlStateNormal];
}

- (void)sectionHeaderRightAction:(RightButtonClick)handle {
    if (handle) {
        self.rightHandle = handle;
    }
}

@end
