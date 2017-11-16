//
//  LoginModel.h
//  QZFinancialSupermarket
//
//  Created by 张宇轩 on 2017/9/26.
//  Copyright © 2017年 wzh. All rights reserved.
//

#import "ZHBaseModel.h"

@interface LoginModel : ZHBaseModel

@property (nonatomic, copy) NSString *token;
@property (nonatomic, copy) NSString *mobile;
@property (nonatomic, assign) NSInteger users_id;

@end
