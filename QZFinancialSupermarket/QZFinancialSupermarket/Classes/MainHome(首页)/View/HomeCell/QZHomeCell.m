//
//  QZHomeCell.m
//  QZFinancialSupermarket
//
//  Created by wzh on 2017/9/14.
//  Copyright © 2017年 wzh. All rights reserved.
//

#import "QZHomeCell.h"
#import "HomeRecommendModel.h"

@interface QZHomeCell ()

@property (weak, nonatomic) IBOutlet UIView *lineView;
@property (weak, nonatomic) IBOutlet UIView *midLineView;
@property (weak, nonatomic) IBOutlet UILabel *moneyLab;
@property (weak, nonatomic) IBOutlet UILabel *desLab;
@property (weak, nonatomic) IBOutlet UILabel *detailLab;
@property (weak, nonatomic) IBOutlet UILabel *formAppNameLab;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *midLineLeft;//135
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *midLineTop;//15
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *midLIneBottom;//15
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *moneyLabTop;//20
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *moneyLabLeft;//25
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *detailRight;//45
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *detailLeft;//15
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *detailTop;//15

@end


@implementation QZHomeCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)setDefautUI{
    self.midLineLeft.constant = 135 *kScaleOfX;//135
    self.midLineTop.constant = 15 *kScaleOfX;//15
    self.midLIneBottom.constant = 15 *kScaleOfX;//15
    self.moneyLabTop.constant = 20 *kScaleOfX;//20
    self.moneyLabLeft.constant = 25 *kScaleOfX;//25
    self.detailRight.constant = 45 *kScaleOfX;//45
    self.detailLeft.constant = 15 *kScaleOfX;//15
    self.detailTop.constant = 15 *kScaleOfX;//15
    self.lineView.backgroundColor = [UIColor colorWith0xEFEFEF];
    self.midLineView.backgroundColor = [UIColor colorWith0xEFEFEF];

    [self.moneyLab textColor:[UIColor colorWith0xFF4654] textFont:[UIFont textCustomFont25]];
    
    [self.detailLab textColor:[UIColor colorWith0x1B1B1B] textFont:[UIFont textCustomFont15]];
    
    [self.desLab text:@"额度范围（元）" textColor:[UIColor colorWith0x8A8A8A] textFont:[UIFont textCustomFont14]];
    [self.formAppNameLab  textColor:[UIColor colorWith0x8A8A8A] textFont:[UIFont textCustomFont14]];
    self.backgroundColor = [UIColor whiteColor];
    
}


- (void)setItem:(ZHBaseCellModel *)item{
    
    if (![ZHTool isEmptyOrNullWithObject:item]) {
    
        HomeRecommendModel *recommendModel = ((HomeRecommendModel *)item);
        self.moneyLab.text = recommendModel.range;
        self.formAppNameLab.text = recommendModel.name;
    }
    
    
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
