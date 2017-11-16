//
//  QZActivityIndicatorView.h
//  QZFinancialSupermarket
//
//  Created by wzh on 2017/7/3.
//
//

#import <UIKit/UIKit.h>

@interface QZActivityIndicatorView : UIView

@property (nonatomic, strong) UIImageView *activityImageView;

- (void)startAnimating;
- (void)stopAnimating;
@end
