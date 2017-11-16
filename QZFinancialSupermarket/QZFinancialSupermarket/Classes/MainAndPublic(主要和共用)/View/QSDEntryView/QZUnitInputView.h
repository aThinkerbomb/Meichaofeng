//
//  QZUnitInputView.h
//  QZFinancialSupermarket
//
//  Created by wzh on 2017/6/14.
//
//

#import <UIKit/UIKit.h>

@interface QZUnitInputView : UIView<UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UIView *view;
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLab;
@property (weak, nonatomic) IBOutlet UITextField *beforeTextField;
@property (weak, nonatomic) IBOutlet UITextField *afterTextField;
@property (weak, nonatomic) IBOutlet UIView *midLineView;
@property (weak, nonatomic) IBOutlet UIView *topLineView;
@property (weak, nonatomic) IBOutlet UIView *bottomLineView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topLineLeft;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topLineRight;

- (void)setItemBeforeTextFieldText:(NSString *)beforeTextFieldtext afterTextFieldText:(NSString *)afterTextFieldText;

//前
- (NSString *)getBeforeText;
- (NSString *)getAfterText;

@end
