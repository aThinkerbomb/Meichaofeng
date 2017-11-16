//
//  QZFloationgLayerView.h
//  QZFinancialSupermarket
//
//  Created by wzh on 17/3/13.
//
//

#import <UIKit/UIKit.h>
@interface QZAccountPromptView : UIView
@property (strong, nonatomic) IBOutlet UIView *accountPromptView;
@property (nonatomic, strong) UIView *bgLayerView;
@property (weak, nonatomic) IBOutlet UIButton *closeBtn;
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UILabel *titleLab;
@property (weak, nonatomic) IBOutlet UIView *lineView;
@property (weak, nonatomic) IBOutlet UILabel *desLab;

@end
