//
//  QZForgetPwdUpdatePageVC.h
//  QZFinancialSupermarket
//
//  Created by wzh on 2017/9/12.
//  Copyright © 2017年 wzh. All rights reserved.
//

#import "QZBaseViewController.h"

typedef NS_ENUM(NSInteger, QZLoginUpdatePwdType) {
    QZLoginUpdatePwdTypeDefaut = 0,
    //忘记密码
    QZLoginUpdatePwdTypeForgetPwd,
    //修改密码
    QZLoginUpdatePwdTypeModifyPwd
    
};
@interface QZLoginPwdUpdatePageVC : QZBaseViewController

@property (nonatomic, copy) NSString * phone;
@property (nonatomic, assign) QZLoginUpdatePwdType updatePwdType;

@end
