//
//  NSString+Tool.h
//  QZFinancialSupermarket
//
//  Created by wzh on 17/3/6.
//
//

#import <Foundation/Foundation.h>

@interface NSString (Tool)
- (BOOL)isAllSame;
- (BOOL)validLengthMin:(NSInteger)min andMax:(NSInteger)max;
- (BOOL)stringContainsEmoji;
//身份证背面有效期
- (NSString *)dealWithstrValidity;

- (BOOL)isMobileNumber;
- (BOOL)isPasswordFormat;

// 过滤h5的标签
+ (NSString *)filterH5TabWithString:(NSString *)string;
@end
