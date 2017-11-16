//
//  QZInformationOneCell.m
//  QZFinancialSupermarket
//
//  Created by wzh on 2017/9/14.
//  Copyright © 2017年 wzh. All rights reserved.
//

#import "QZInformationOneCell.h"
#import "QZInfoDataModel.h"
@interface QZInformationOneCell ()
@property (weak, nonatomic) IBOutlet UIView *lineView;
@property (weak, nonatomic) IBOutlet UIImageView *picImageView;

@property (weak, nonatomic) IBOutlet UILabel *titleLab;
@property (weak, nonatomic) IBOutlet UILabel *dateLab;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageTop;//15
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageBottom;//15
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *titleLeft;//20
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *titleTop;//15
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *dateBottom;//15

@end


@implementation QZInformationOneCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setDefautUI{
    self.imageTop.constant = 15 * kScaleOfX;//15
    self.imageBottom.constant = 15 * kScaleOfX;//15
    self.titleLeft.constant = 20 *kScaleOfX;//20
    self.titleTop.constant = 15 *kScaleOfX;//15
    self.dateBottom.constant = 15 *kScaleOfX;//15
    
    self.lineView.backgroundColor = [UIColor colorWith0xEFEFEF];
    [self.titleLab textColor:[UIColor colorWith0x1B1B1B] textFont:[UIFont textCustomFont15]];
    [self.dateLab textColor:[UIColor colorWith0x8A8A8A] textFont:[UIFont textCustomFont12]];
    self.backgroundColor = [UIColor whiteColor];
    
    self.picImageView.backgroundColor = [UIColor colorWith0xEFEFEF];
}
- (void)setItem:(ZHBaseCellModel *)item{
    
    QZInfoDataModel * infoModel = (QZInfoDataModel *)item;
    
    if (![ZHTool isEmptyOrNullWithObject:infoModel]) {
        
        self.titleLab.text = infoModel.title;
        self.dateLab.text = [NSDate dateStr:infoModel.createtime];
        
        NSString *imageStr = [ImageUrl stringByAppendingPathComponent:infoModel.smallimage];
        [self.picImageView sd_setImageWithURL:[NSURL URLWithString:imageStr] placeholderImage:PlaceholderMin];
    }
    
    
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
