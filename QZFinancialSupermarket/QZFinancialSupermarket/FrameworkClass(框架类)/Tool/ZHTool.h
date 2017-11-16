//
//  ZHTool.h
//  QZFinancialSupermarket
//
//  Created by wzh on 17/2/27.
//
//

#import <Foundation/Foundation.h>
#define ZHLog(s, ...)  [ZHTool file:__FILE__ function: (char *)__FUNCTION__ lineNumber:__LINE__ format:(s),##__VA_ARGS__]

/**
 * 前往隐私 --权限前往隐私
 */
extern NSString *const QZGotoPhonePrivacy;


@interface ZHTool : NSObject
+ (void)file:(char*)sourceFile function:(char*)functionName lineNumber:(int)lineNumber format:(NSString*)format, ...;
+ (NSString *)getCurrentVersion;
+ (BOOL)isNUllOrIsEmptyWith:(id)object;
+ (BOOL)isNONUllOrIsEmptyWith:(id)object;
+ (NSString *)strongConversionWith:(NSString *)string;
+ (CGSize)sizeWithString:(NSString *)str font:(UIFont *)font maxSize:(CGSize)maxSize;
+ (CGFloat)sizeWithString_H:(NSString *)str font:(UIFont *)font width:(CGFloat)width;
+ (CGFloat)sizeWithString_W:(NSString *)str font:(UIFont *)font height:(CGFloat)height;
+ (BOOL)moneyInputFaultTolerantToDealWithTextField:(UITextField *)textField TotalStr:(NSString *)totalStr range:(NSRange)range andString:(NSString *)string;
+ (BOOL)version:(NSString *)version appVersion:(NSString *)appVersion;
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;
+ (BOOL)isEmptyOrNullWithObject:(id)object;
+ (BOOL)isPassword:(NSString *)str;
+ (NSInteger)daysFromDate:(NSDate *)startDate toDate:(NSDate *)endDate;
+ (NSString *)dealWithPhoneNumFormatWithPhoneNumStr:(NSString *)phoneNumStr;
+ (void)goToPhoneMyAppPrivacy;
+ (BOOL)isValidateEmail:(NSString *)email;
+ (BOOL)verifyWithRegExp:(NSString*)regExp andNum:(NSString*)num;



+ (void)callPhoneWithNum:(NSString *)phoneNum;
+ (void)callPhoneTelWithNum:(NSString *)phoneNum;
+ (void)callPhoneTel;
//+ (void)callPhone;
+ (void)callPhoneWithView:(UIView *)view;
+ (void)callPhoneWithView:(UIView *)view phone:(NSString *)phone;
+ (void)callPhoneWithNum:(NSString *)phoneNum view:(UIView *)view;
+ (NSString *)dealWithstrValidityWithObject:(id)object;
+ (NSInteger)timeDifferenceWithServerSystemDate:(NSString *)serverSystemDate validityDate:(NSString *)validityDate isLoadOrScan:(BOOL)isLoadOrScan;

static inline NSRegularExpression * NameRegularExpression();
@end

