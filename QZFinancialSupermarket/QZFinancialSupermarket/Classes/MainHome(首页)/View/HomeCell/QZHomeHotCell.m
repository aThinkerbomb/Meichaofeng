//
//  QZHomeHotCell.m
//  QZFinancialSupermarket
//
//  Created by 张宇轩 on 2017/10/17.
//  Copyright © 2017年 wzh. All rights reserved.
//

#import "QZHomeHotCell.h"
#import "HomeRecommendModel.h"

@interface QZHomeHotCell ()
@property (weak, nonatomic) IBOutlet UIImageView *logoImageView;
@property (weak, nonatomic) IBOutlet UILabel *productName;
@property (weak, nonatomic) IBOutlet UILabel *PeopleLoan;
@property (weak, nonatomic) IBOutlet UILabel *MoneyRange;
@property (weak, nonatomic) IBOutlet UILabel *period;
@property (weak, nonatomic) IBOutlet UILabel *dayOrMonth;
@property (weak, nonatomic) IBOutlet UILabel *Rate;
@property (weak, nonatomic) IBOutlet UILabel *reason;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageH;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageW;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageTop;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageLeft;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *titleLeft;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *reasonTop;



@end


@implementation QZHomeHotCell

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

    [self.logoImageView styleWithCornerRadius:10 borderColor:[UIColor clearColor] borderWidth:0.5];
    
    self.backgroundColor = [UIColor whiteColor];
}

- (void)setItem:(ZHBaseCellModel *)item {
    
    if (![ZHTool isEmptyOrNullWithObject:item]) {
        
        HomeRecommendModel *recommendModel = ((HomeRecommendModel *)item);
        self.MoneyRange.text = [NSString stringWithFormat:@"%@元", recommendModel.range];
        self.productName.text = recommendModel.name;
        
        NSString * urlString = [ImageUrl stringByAppendingPathComponent:recommendModel.loanimage];
        [self.logoImageView sd_setImageWithURL:[NSURL URLWithString:urlString] placeholderImage:PlaceholderMin];
        
        if (![ZHTool isEmptyOrNullWithObject:recommendModel.applynumber]) {
            self.PeopleLoan.text = [NSString stringWithFormat:@"%@人已放款", recommendModel.applynumber];
        }
        
        self.reason.text = recommendModel.featurestext;
        
        // 天
        NSString * termday = recommendModel.termday;
        // 月
        NSString * termmonth = recommendModel.termmonth;
        
        // 日利率
        NSString * dayinterest = recommendModel.dayinterest;
        // 月利率
        NSString * monthinterest = recommendModel.monthinterest;
        
        
        if (termday.length > 0) {
            self.period.text = [NSString stringWithFormat:@"%@天", termday];
        } else if (termmonth.length > 0) {
            self.period.text = [NSString stringWithFormat:@"%@个月", termmonth];
        }
        
        if (dayinterest.length > 0) {
            self.dayOrMonth.text = @"参考日利率：";
            self.Rate.text = dayinterest;
        } else if (monthinterest.length > 0) {
            self.dayOrMonth.text = @"参考月利率：";
            self.Rate.text = monthinterest;
        }
    }
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
