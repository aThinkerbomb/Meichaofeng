//
//  QZAccountTool.m
//  QZFinancialSupermarket
//
//  Created by wzh on 17/3/7.
//
//

#import "QZLoginAccountTool.h"
#import "ZHSandBoxPath.h"
#define QZLoginAccountFilepath [[ZHSandBoxPath getDocumentDirectory]stringByAppendingPathComponent:@"account.data"]

@implementation QZLoginAccountTool

+ (void)save:(QZLoginAccountModel *)accountModel
{
    // 归档
    [NSKeyedArchiver archiveRootObject:accountModel toFile:QZLoginAccountFilepath];
    
}

+ (QZLoginAccountModel *)accountModel
{
    // 读取帐号
    QZLoginAccountModel *account = [NSKeyedUnarchiver unarchiveObjectWithFile:QZLoginAccountFilepath];
    return account;
}

+ (BOOL)removeEmptyAccountData{
    NSFileManager *fileMgr = [NSFileManager defaultManager];
    if ([fileMgr fileExistsAtPath:QZLoginAccountFilepath]) {
        NSError *err;
        return [fileMgr removeItemAtPath:QZLoginAccountFilepath error:&err];
    }else{
        return NO;
    }
}


@end
