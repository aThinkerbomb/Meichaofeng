//
//  QZAccountTool.h
//  QZFinancialSupermarket
//
//  Created by wzh on 17/3/7.
//
//

#import <Foundation/Foundation.h>
#import "QZLoginAccountModel.h"
@interface QZLoginAccountTool : NSObject
/**
 *  存储帐号
 */
+ (void)save:(QZLoginAccountModel *)accountModel;
/**
 *  读取帐号
 */
+ (QZLoginAccountModel *)accountModel;
/**
 *  清除账号信息
 */
+ (BOOL)removeEmptyAccountData;
@end
