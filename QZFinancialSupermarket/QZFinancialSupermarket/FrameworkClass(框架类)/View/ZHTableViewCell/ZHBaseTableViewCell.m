//
//  QZBaseTableViewCell.m
//  QZFinancialSupermarket
//
//  Created by wzh on 17/3/13.
//
//

#import "ZHBaseTableViewCell.h"

@implementation ZHBaseTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.contentView.backgroundColor = [UIColor clearColor];
    self.backgroundColor = [UIColor clearColor];
    [self setDefautUI];
}

- (void)setDefautUI{
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
