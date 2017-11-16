//
//  QZTool.h
//  QZFinancialSupermarket
//
//  Created by wzh on 2017/6/9.
//
//

#import <Foundation/Foundation.h>

@interface QZTool : NSObject
//手机号比对  第一位1  十一位
+ (BOOL)isMobile:(NSString *)str;
//银行卡号比对  16-20位数字
+ (BOOL)isBank:(NSString *)str;
+ (BOOL)isAllSameWithStr:(NSString *)str;
//返回相似度
+ (float)likePercent:(NSString *)testString AndTargetString:(NSString *)target;

//获取ip地址
+ (NSString *)getIPAddress;

+ (BOOL)isNUllOrIsEmptyWith:(id)object;
//+ (NSString *)getBlockBox;
//+ (NSString *)getBaiQiShiTokenKey;
+ (NSString *)joiningTogetherDataWithStr:(NSString *)string;
@end
