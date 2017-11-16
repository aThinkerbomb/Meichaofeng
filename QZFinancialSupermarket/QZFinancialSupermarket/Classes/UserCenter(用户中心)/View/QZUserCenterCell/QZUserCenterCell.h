//
//  QZUserCenterCell.h
//  
//
//  Created by wzh on 17/3/14.
//
//

#import "ZHBaseTableViewCell.h"

@interface QZUserCenterCell : ZHBaseTableViewCell
@property (weak, nonatomic) IBOutlet UIView *topLineView;
@property (weak, nonatomic) IBOutlet UIView *bottomLineView;
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLab;
@property (weak, nonatomic) IBOutlet UILabel *FindNewVersionLabel;

@property (weak, nonatomic) IBOutlet UIButton *arrowBtn;
@property (weak, nonatomic) IBOutlet UILabel *desLab;

@property (weak, nonatomic) IBOutlet UISwitch *mSwitch;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *iconLeft;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *titleLeft;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *arrowRight;

@property (weak, nonatomic) IBOutlet UIImageView *hotImageView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomRight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomLeft;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *hotImageViewTop;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *hotImageViewLeft;
@property (weak, nonatomic) IBOutlet UIView *redPointView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *redPointViewRight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *desRight;


+ (QZUserCenterCell *)cellWithTableView:(UITableView *)tableView;
@end
