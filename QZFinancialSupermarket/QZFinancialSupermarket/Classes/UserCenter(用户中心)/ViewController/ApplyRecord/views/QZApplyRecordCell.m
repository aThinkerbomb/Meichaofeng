//
//  QZApplyRecordCell.m
//  QZFinancialSupermarket
//
//  Created by 张宇轩 on 2017/10/31.
//  Copyright © 2017年 wzh. All rights reserved.
//

#import "QZApplyRecordCell.h"
#import "QZApplyRecordModel.h"

@interface QZApplyRecordCell ()
@property (weak, nonatomic) IBOutlet UIImageView *logoImageView;
@property (weak, nonatomic) IBOutlet UILabel *pName;
@property (weak, nonatomic) IBOutlet UILabel *moneyRange;
@property (weak, nonatomic) IBOutlet UILabel *des;
@property (weak, nonatomic) IBOutlet UILabel *pTime;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *logoLeft;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *logoWidth;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *nameLeft;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *timeRight;

@end

@implementation QZApplyRecordCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.backgroundColor = [UIColor whiteColor];
}

- (void)setDefautUI {
    
    self.logoLeft.constant = 16 * kScaleOfX;
    self.logoWidth.constant = 60 * kScaleOfX;
    self.nameLeft.constant = 10 * kScaleOfX;
    self.timeRight.constant = 16 * kScaleOfX;
    
    [self.pName textColor:[UIColor colorWith0x333333] textFont:[UIFont textFont16]];
    [self.moneyRange textColor:[UIColor colorWith0x666666] textFont:[UIFont textFont13]];
    [self.des textColor:[UIColor colorWith0x666666] textFont:[UIFont textFont13]];
    [self.pTime textColor:[UIColor colorWith0xE56300] textFont:[UIFont textFont13]];
    
}

- (void)setItem:(ZHBaseCellModel *)item {
    QZApplyRecordModel * model = (QZApplyRecordModel *)item;
    if (![ZHTool isEmptyOrNullWithObject:model]) {
     
        NSString *imageStr = [ImageUrl stringByAppendingPathComponent:model.loanimage];
        [self.logoImageView sd_setImageWithURL:[NSURL URLWithString:imageStr] placeholderImage:PlaceholderMin];
        self.pName.text = model.name;
        self.pTime.text = [NSDate dateFormatter:@"yyyy-MM-dd" dateStr:model.createtime];
        self.moneyRange.text = [NSString filterH5TabWithString:model.productcontent];
        self.des.text = model.speedloan;
        
    }
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
