//
//  ZHVerCodeButton.h
//  验证码测试
//
//  Created by wzh on 17/3/8.
//  Copyright © 2017年 wzh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZHVerCodeButton : UIButton

@property (assign, nonatomic) NSInteger countDownTime;
@property (copy, nonatomic) NSString *defautTitle;
@property (copy, nonatomic) NSString *sendIngTitle;
@property (assign, nonatomic) NSInteger timeInterval;
- (void)getVerificationCode;
- (void)destroyTimer;
- (BOOL)checkInputIsNullOrCorrect;
@end
