//
//  QZUserCenterHeadeView.h
//  QZFinancialSupermarket
//
//  Created by wzh on 2017/9/12.
//  Copyright © 2017年 wzh. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol UserCenterDelegate;

@interface QZUserCenterHeadeView : UIView
@property (strong, nonatomic) IBOutlet UIView *view;
@property (weak, nonatomic) IBOutlet UILabel *titleLab;
@property (weak, nonatomic) IBOutlet UIButton *iconBtn;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (nonatomic, assign) id<UserCenterDelegate>delegate;

@end

@protocol UserCenterDelegate<NSObject>

- (void)userCenterLoginAction;

@end
