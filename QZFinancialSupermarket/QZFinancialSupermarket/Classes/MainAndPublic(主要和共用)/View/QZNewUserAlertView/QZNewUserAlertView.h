//
//  QZNewUserAlertView.h
//  QZFinancialSupermarket
//
//  Created by wzh on 2017/8/4.
//
//

#import <UIKit/UIKit.h>
@class QZNewUserAlertView;
@protocol QZNewUserAlertViewDelegate <NSObject>

@optional
- (void)didNewUserAlertWithView:(QZNewUserAlertView *)view;

@end

@interface QZNewUserAlertView : UIView


@property (nonatomic, strong) UIButton *imageViewBtn;

@property (nonatomic, weak) __weak id<QZNewUserAlertViewDelegate>delegate;

@end
