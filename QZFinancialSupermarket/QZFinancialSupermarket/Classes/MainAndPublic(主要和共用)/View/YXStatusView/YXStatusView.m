//
//  YXStatusView.m
//  QZFinancialSupermarket
//
//  Created by 张宇轩 on 2017/11/10.
//  Copyright © 2017年 wzh. All rights reserved.
//

#import "YXStatusView.h"

@interface YXStatusView ()

@property (weak, nonatomic) IBOutlet UIImageView *statusImageView;
@property (weak, nonatomic) IBOutlet UIButton *refreshBtn;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageTop;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *btnWidth;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *btnHeight;


@end


@implementation YXStatusView

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self setDefaultUI];
}

- (void)setDefaultUI {
    
    self.imageTop.constant = 100 * kScaleOfX;
    self.btnWidth.constant = 45 * kScaleOfX;
    self.btnHeight.constant = 300 * kScaleOfX;
    
    [self.refreshBtn styleWithCornerRadius:4.0];
}

- (void)setShowType:(CurrentShowType)showType {
    
    if (showType == CurrentShowTypeHidden) {
        self.statusImageView.hidden = YES;
        self.refreshBtn.hidden = YES;
        self.hidden = YES;
    }
    if (showType == CurrentShowTypeNoDataHasNetwork) {
        self.statusImageView.hidden = NO;
        self.refreshBtn.hidden = NO;
        self.statusImageView.image = [UIImage imageNamed:@"暂无记录"];
        self.hidden = NO;
    }
    if (showType == CurrentShowTypeNoNetwork) {
        self.statusImageView.hidden = NO;
        self.refreshBtn.hidden = NO;
        self.statusImageView.image = [UIImage imageNamed:@"加载失败"];
        self.hidden = NO;
    }
    
}


- (IBAction)refreshAction:(UIButton *)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(statusViewClickedAction)]) {
        [self.delegate statusViewClickedAction];
    }
    
}

@end
