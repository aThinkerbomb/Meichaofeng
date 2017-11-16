//
//  QZInformationTwoCell.m
//  QZFinancialSupermarket
//
//  Created by wzh on 2017/9/14.
//  Copyright © 2017年 wzh. All rights reserved.
//

#import "QZInformationTwoCell.h"
#import "QZInfoDataModel.h"
@interface QZInformationTwoCell ()

@property (weak, nonatomic) IBOutlet UIView *lineView;
@property (weak, nonatomic) IBOutlet UILabel *titleLab;
@property (weak, nonatomic) IBOutlet UIImageView *picImageView;

@property (weak, nonatomic) IBOutlet UILabel *dateLab;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *dateBottom;

@end

@implementation QZInformationTwoCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setDefautUI{
    self.dateBottom.constant = 15 * kScaleOfX;
    self.backgroundColor = [UIColor whiteColor];
    self.lineView.backgroundColor = [UIColor colorWith0xEFEFEF];
    self.picImageView.backgroundColor = [UIColor colorWith0xEFEFEF];
    [self.titleLab textColor:[UIColor colorWith0x1B1B1B] textFont:[UIFont textCustomFont15]];
    [self.dateLab textColor:[UIColor colorWith0x8A8A8A] textFont:[UIFont textCustomFont12]];
    
}
- (void)setItem:(ZHBaseCellModel *)item{
    
    if (![ZHTool isEmptyOrNullWithObject:item]) {
        
        QZInfoDataModel * infoModel = (QZInfoDataModel *)item;
        
        self.titleLab.text = infoModel.title;
        self.dateLab.text = [NSDate dateStr:infoModel.createtime];
        
        NSString *imageStr = [ImageUrl stringByAppendingPathComponent:infoModel.smallimage];
        [self.picImageView sd_setImageWithURL:[NSURL URLWithString:imageStr] placeholderImage:PlaceholderMax];
    }

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
