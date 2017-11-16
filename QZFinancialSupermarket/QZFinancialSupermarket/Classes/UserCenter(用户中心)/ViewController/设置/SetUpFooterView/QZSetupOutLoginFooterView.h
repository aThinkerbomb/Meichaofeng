//
//  QZSetupOutLoginFooterView.h
//
//
//  Created by wzh on 2017/6/17.
//
//

#import <UIKit/UIKit.h>

@class QZSetupOutLoginFooterView;
@protocol QZSetupOutLoginFooterViewDelegate <NSObject>

@optional
- (void)nextBtnActionWithView:(QZSetupOutLoginFooterView *)footerView;
@end

@interface QZSetupOutLoginFooterView : UIView

@property (nonatomic, strong) UIButton *nextBtn;
@property (nonatomic, weak) __weak id<QZSetupOutLoginFooterViewDelegate> delegate;

@end
