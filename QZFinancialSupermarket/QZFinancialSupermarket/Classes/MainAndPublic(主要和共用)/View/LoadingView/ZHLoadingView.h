//
//  ZHLoadingView.h
//  QZFinancialSupermarket
//
//  Created by wzh on 2017/7/1.
//
//

#import <UIKit/UIKit.h>

@interface ZHLoadingView : UIView

@property (nonatomic, strong) UIImageView *bgImageView;
+ (ZHLoadingView *)shareLoginViewManager;
- (void)startLoading;
-(void)endLoading;

- (void)startLoadingWithView:(UIView *)view;
- (void)startLoadingMaxTopView;
@end
