//
//  QZLoanListCell.m
//  QZFinancialSupermarket
//
//  Created by 张宇轩 on 2017/10/17.
//  Copyright © 2017年 wzh. All rights reserved.
//

#import "QZLoanListCell.h"
#import "QZProductCellItem.h"
@interface QZLoanListCell ()

@property (weak, nonatomic) IBOutlet UIImageView *logoImageView;
@property (weak, nonatomic) IBOutlet UILabel *productName;
@property (weak, nonatomic) IBOutlet UILabel *PeopleLoan;
@property (weak, nonatomic) IBOutlet UILabel *MoneyRange;
@property (weak, nonatomic) IBOutlet UILabel *period;
@property (weak, nonatomic) IBOutlet UILabel *dayOrMonth;
@property (weak, nonatomic) IBOutlet UILabel *Rate;
@property (weak, nonatomic) IBOutlet UILabel *des;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageH;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageW;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageTop;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageLeft;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *titleLeft;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *desViewHeight;


@end


@implementation QZLoanListCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)setDefautUI {
    self.imageH.constant = 65 * kScaleOfX;
    self.imageW.constant = 65 * kScaleOfX;
    
    self.imageTop.constant = 15 * kScaleOfX;
    self.imageLeft.constant = 16 * kScaleOfX;
    
    self.titleLeft.constant = 10 * kScaleOfX;
    
    self.desViewHeight.constant = 45 * kScaleOfX;
    
    [self.logoImageView styleWithCornerRadius:10.0 borderColor:[UIColor clearColor] borderWidth:0.5];
    
    self.backgroundColor = [UIColor whiteColor];
}

- (void)setItem:(ZHBaseCellModel *)item{
    
    if (![ZHTool isEmptyOrNullWithObject:item]) {
        
        QZProductCellItem *produtcItem =(QZProductCellItem *)item;
        NSString * urlString = [ImageUrl stringByAppendingPathComponent:produtcItem.loanimage];
        [self.logoImageView sd_setImageWithURL:[NSURL URLWithString:urlString] placeholderImage:PlaceholderMin];
        
        self.MoneyRange.text = [NSString stringWithFormat:@"%@元", produtcItem.range];
        self.productName.text = produtcItem.name;
        
        if (![ZHTool isEmptyOrNullWithObject:produtcItem.applynumber]) {
            self.PeopleLoan.text = [NSString stringWithFormat:@"%@人已放款", produtcItem.applynumber];
        }
        
        self.des.text = produtcItem.featurestext;
        
        NSString * termday = produtcItem.termday;
        NSString * dayinterest = produtcItem.dayinterest;
        
        if (termday.length > 0 && dayinterest.length > 0) {
            
            self.dayOrMonth.text = @"参考日利率：";
            self.Rate.text = dayinterest;
            self.period.text = [NSString stringWithFormat:@"%@天", termday];
            
        } else {
            
            self.dayOrMonth.text = @"参考月利率：";
            self.Rate.text = produtcItem.monthinterest;
            self.period.text = [NSString stringWithFormat:@"%@个月", produtcItem.termmonth];
            
        }
    }
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
