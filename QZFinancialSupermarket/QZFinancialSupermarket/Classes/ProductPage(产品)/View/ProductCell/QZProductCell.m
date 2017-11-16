//
//  QZProductCell.m
//  QZFinancialSupermarket
//
//  Created by wzh on 2017/9/13.
//  Copyright © 2017年 wzh. All rights reserved.
//

#import "QZProductCell.h"
#import "QZProductCellItem.h"

@interface QZProductCell ()
@property (weak, nonatomic) IBOutlet UILabel *titleLab;

@property (weak, nonatomic) IBOutlet UILabel *moneyLab;
@property (weak, nonatomic) IBOutlet UILabel *desLab;
@property (weak, nonatomic) IBOutlet UIView *midLineView;
@property (weak, nonatomic) IBOutlet UILabel *detailLab;
@property (weak, nonatomic) IBOutlet UIImageView *logoImageVIew;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageWith;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *midLineLeft;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *titleLeft;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *titleTop;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *desTop;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *DesWidth;

@end


@implementation QZProductCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setDefautUI{
    
    self.imageWith.constant = 91 * kScaleOfX;
    self.imageHeight.constant = 91 * kScaleOfX;
    
    self.titleLeft.constant = 18 * kScaleOfX;
    self.titleTop.constant = 14 * kScaleOfX;
    
    self.midLineLeft.constant = 118 *kScaleOfX;
    self.midLineView.backgroundColor = [UIColor colorWith0xEFEFEF];
    
    self.DesWidth.constant = 100 *kScaleOfX;
    self.desTop.constant = 4 * kScaleOfX;
    
    
    [self.titleLab textColor:[UIColor blackColor] textFont:[UIFont textCustomFont17]];
    [self.moneyLab textColor:[UIColor colorWith0xFF4654] textFont:[UIFont textCustomFont20]];
    
    
    [self.detailLab text:@"额度（元）" textColor:[UIColor colorWith0xA7A7A7] textFont:[UIFont textCustomFont13]];
    [self.desLab textColor:[UIColor colorWith0xA7A7A7] textFont:[UIFont textCustomFont13]];
    
 
}

- (void)setItem:(ZHBaseCellModel *)item{
    
    if (![ZHTool isEmptyOrNullWithObject:item]) {
        QZProductCellItem *produtcItem =(QZProductCellItem *)item;
        NSString * urlString = [ImageUrl stringByAppendingPathComponent:produtcItem.loanimage];
        [self.logoImageVIew sd_setImageWithURL:[NSURL URLWithString:urlString] placeholderImage:PlaceholderMin];
        self.titleLab.text = produtcItem.name;
        self.moneyLab.text = produtcItem.range;
        self.desLab.text = @"1小时放款\n每日手续费3元\n贷款期限7-30天";
        [self.desLab setLineSpace:4];
    }
    
}

- (IBAction)goToLoanBtnAction:(id)sender {
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(gotoProductDetail)]) {
        [self.delegate gotoProductDetail];
        
        
    }
    
}

@end
