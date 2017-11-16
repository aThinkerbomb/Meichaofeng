//
//  QZMyCommentsListCell.m
//  QZFinancialSupermarket
//
//  Created by wzh on 2017/9/13.
//  Copyright © 2017年 wzh. All rights reserved.
//

#import "QZMyCommentsListCell.h"
#import "QZMyCommentsListCellItem.h"
#import "QZMyCommentsListCellItem2.h"
@implementation QZMyCommentsListCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
//    [self setDefautUI];
}
- (void)setDefautUI{

    self.desTitleW.constant = 65 * kScaleOfX;
    self.numberTop.constant = 15 *kScaleOfX;
    
    [self.desTitleLab textColor:[UIColor colorWith0x333333] textFont:[UIFont textCustomFont12]];
    [self.desDetailLab textColor:[UIColor colorWith0x333333] textFont:[UIFont textCustomFont12]];
    [self.numberLab textColor:[UIColor colorWith0x8A8A8A] textFont:[UIFont textCustomFont10]];
    [self.dateLab textColor:[UIColor colorWith0x8A8A8A] textFont:[UIFont textCustomFont10]];

}

- (void)setItem:(ZHBaseCellModel *)item {
    
    QZMyCommentsListCellItem2 *listModel = (QZMyCommentsListCellItem2 *)item;
    if (![ZHTool isEmptyOrNullWithObject:listModel]) {
        self.desTitleLab.text = @"评论内容：";
//        self.numberLab.text = @"浏览12次";
        self.dateLab.text = [NSDate dateFormatter:@"yyyy-MM-dd" dateStr:listModel.createtime];
        self.desDetailLab.text = listModel.content;
    }
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


@end
