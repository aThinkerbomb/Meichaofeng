//
//  VersionModel.h
//  QZFinancialSupermarket
//
//  Created by 张宇轩 on 2017/11/2.
//  Copyright © 2017年 wzh. All rights reserved.
//

#import "ZHBaseModel.h"

@interface VersionModel : ZHBaseModel

@property (nonatomic, copy) NSString * version;
@property (nonatomic, copy) NSString * url;
@property (nonatomic, copy) NSString * content;


/**
 更新提示
 */
@property (nonatomic, copy) NSString * name;
@property (nonatomic, copy) NSString * force;

/**
 1-强制更新，0-弱更
 */
@property (nonatomic, copy) NSString * version_code;

@end
