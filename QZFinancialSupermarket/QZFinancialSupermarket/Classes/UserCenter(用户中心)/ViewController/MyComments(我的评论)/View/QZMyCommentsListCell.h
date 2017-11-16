//
//  QZMyCommentsListCell.h
//  QZFinancialSupermarket
//
//  Created by wzh on 2017/9/13.
//  Copyright © 2017年 wzh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZHBaseTableViewCell.h"
@interface QZMyCommentsListCell : ZHBaseTableViewCell


@property (weak, nonatomic) IBOutlet UILabel *desTitleLab;
@property (weak, nonatomic) IBOutlet UILabel *desDetailLab;
@property (weak, nonatomic) IBOutlet UILabel *numberLab;
@property (weak, nonatomic) IBOutlet UILabel *dateLab;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *desTitleW;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *numberTop;//15
//15
@end
