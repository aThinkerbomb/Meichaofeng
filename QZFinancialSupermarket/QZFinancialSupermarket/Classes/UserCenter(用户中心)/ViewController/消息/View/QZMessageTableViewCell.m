//
//  QZMessageTableViewCell.m
//  QZFinancialSupermarket
//
//  Created by wzh on 2017/9/13.
//  Copyright © 2017年 wzh. All rights reserved.
//

#import "QZMessageTableViewCell.h"

@implementation QZMessageTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
//    [self setDefautUI];

}
- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
//        [self setDefautUI];
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
//        [self setDefautUI];
    }
    return self;
}

- (void)setDefautUI{
    self.top.constant = 20 * kScaleOfX;
    self.left.constant = 30 * kScaleOfX;
    self.right.constant = 20 *kScaleOfX;
    self.bottom.constant = 12 * kScaleOfX;
    self.pointViewRight.constant = 5 *kScaleOfX;
    
    [self.titleLeb textColor:[UIColor blackColor] textFont:[UIFont textCustomFont15]];
    [self.desLab textColor:[UIColor colorWith0x333333] textFont:[UIFont textCustomFont13]];
    [self.dateLab textColor:[UIColor colorWith0x8A8A8A] textFont:[UIFont textCustomFont10]];
    
    self.pointView.backgroundColor = [UIColor colorWith0x4180E9];
    
    self.titleLeb.text = @"最后20个红包，快来领取";
    self.desLab.text = @"超值！投资 奇乐计划 即可送最高200元......";
    self.dateLab.text = @"2017.03.02 12:21:08";
    
    [self.nextBtn title:@"查看详情" titleColor:[UIColor colorWith0x4180E9] titleFont:[UIFont textCustomFont12]];
    
    self.nextBtn.selected = NO;
    [self.nextBtn setTitleColor:[UIColor colorWith0x4180E9] forState:UIControlStateNormal];
    [self.nextBtn setTitleColor:[UIColor colorWith0xA7A7A7] forState:UIControlStateSelected];

}

- (void)setItem:(ZHBaseCellModel *)item{
    //查看过 colorWith0xA7A7A7
//    if(){
//        self.pointView.backgroundColor = [UIColor colorWith0xA7A7A7];
//        self.titleLeb.textColor = [UIColor colorWith0xA7A7A7];
//        self.desLab.textColor = [UIColor colorWith0xA7A7A7];
//        self.dateLab.textColor = [UIColor colorWith0xA7A7A7];
//
//    }else{
//        self.pointView.backgroundColor = [UIColor colorWith0x4180E9];
//        self.titleLeb.textColor = [UIColor blackColor];
//        self.desLab.textColor = [UIColor colorWith0x333333];
//        self.dateLab.textColor = [UIColor colorWith0x8A8A8A];
//    }
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [self.pointView styleWithCornerRadius:self.pointView.width / 2];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
