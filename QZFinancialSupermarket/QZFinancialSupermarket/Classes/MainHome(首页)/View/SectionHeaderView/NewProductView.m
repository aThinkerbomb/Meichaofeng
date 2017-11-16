//
//  NewProductView.m
//  QZFinancialSupermarket
//
//  Created by 张宇轩 on 2017/10/31.
//  Copyright © 2017年 wzh. All rights reserved.
//

#import "NewProductView.h"

@interface NewProductView ()

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *logoWidth;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *logoTop;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *proNameTop;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *proRangeTop;



@end


@implementation NewProductView

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self setUI];
}

- (void)setUI {
    self.logoWidth.constant = 60 * kScaleOfX;
    self.logoTop.constant = 10 * kScaleOfX;
    self.proNameTop.constant = 8 * kScaleOfX;
    self.proRangeTop.constant = 8 * kScaleOfX;
    
    [self.logoImageView styleWithCornerRadius:10];
}


@end
