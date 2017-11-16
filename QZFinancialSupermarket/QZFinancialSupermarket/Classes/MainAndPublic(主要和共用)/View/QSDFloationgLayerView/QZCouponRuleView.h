//
//  QZCouponRuleView.h
//  QZFinancialSupermarket
//
//  Created by wzh on 17/3/21.
//
//

#import <UIKit/UIKit.h>
#import "TTTAttributedLabel.h"
@interface QZCouponRuleView : UIView
@property (strong, nonatomic) IBOutlet UIView *view;
@property (weak, nonatomic) IBOutlet UIImageView *topImageView;
@property (weak, nonatomic) IBOutlet UIView *desView;
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UILabel *titleLab;
@property (weak, nonatomic) IBOutlet UILabel *deslab;
@property (weak, nonatomic) IBOutlet UILabel *title1Lab;
@property (weak, nonatomic) IBOutlet UILabel *des1Lab;
@property (weak, nonatomic) IBOutlet UILabel *des2Lab;
@property (weak, nonatomic) IBOutlet UIButton *phoneNumBtn;
@property (weak, nonatomic) IBOutlet UIButton *closeBtn;
@property (weak, nonatomic) IBOutlet UIView *lineView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lineTop;

@end
