//
//  NSDate+Extension.h
//  Extension
//
//  Created by wzh on 16/11/25.
//  Copyright © 2016年 wzh. All rights reserved.
//

#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN


@interface NSDate (Extension)
#pragma mark - Component Properties
/**
 *  年
 */
@property (nonatomic, readonly) NSInteger year;
/**
 *  月  (1~12)
 */
@property (nonatomic, readonly) NSInteger month;
/**
 *  天 (1~31)
 */
@property (nonatomic, readonly) NSInteger day;
/**
 *  小时 (0~23)
 */
@property (nonatomic, readonly) NSInteger hour;
/**
 *  分钟 (0~59)
 */
@property (nonatomic, readonly) NSInteger minute;
/**
 *  秒 (0~59)
 */
@property (nonatomic, readonly) NSInteger second;
/**
 *  毫微秒-纳秒 (0~59)
 */
@property (nonatomic, readonly) NSInteger nanosecond;
/**
 *   周 （周日算每周第一天）
 */
@property (nonatomic, readonly) NSInteger weekday;
/**
 *  月中第几个七天 
 */
@property (nonatomic, readonly) NSInteger weekdayOrdinal;
/**
 *  月中第几周 （周日算每周第一天） (1~5)
 */
@property (nonatomic, readonly) NSInteger weekOfMonth;
/**
 *  年中第几周 (1~53)
 */
@property (nonatomic, readonly) NSInteger weekOfYear;
/**
 *  <#Description#>
 */
@property (nonatomic, readonly) NSInteger yearForWeekOfYear;
/**
 *  <#Description#>
 */
@property (nonatomic, readonly) NSInteger quarter;
/**
 *  <#Description#>
 */
@property (nonatomic, readonly) BOOL isLeapMonth;
/**
 *   是否闰年
 */
@property (nonatomic, readonly) BOOL isLeapYear;
/**
 *  是否今天
 */
@property (nonatomic, readonly) BOOL isToday;
/**
 *  是否昨天
 */
@property (nonatomic, readonly) BOOL isYesterday;

#pragma mark - Date modify
/**
 *  添加几年后的日期  NSDate格式
 *
 *  @param years 添加的年数
 *
 *  @return 修改后的日期 NSDate格式
 */
- (nullable NSDate *)dateByAddingYears:(NSInteger)years;
/**
 *  添加几月后的日期
 *
 *  @param months 添加的月数
 *
 *  @return 修改后的日期
 */
- (nullable NSDate *)dateByAddingMonths:(NSInteger)months;
/**
 *  添加几周后的日期
 *
 *  @param weeks 添加的周数
 *
 *  @return 修改后的日期
 */
- (nullable NSDate *)dateByAddingWeeks:(NSInteger)weeks;
/**
 *  添加几天后的日期
 *
 *  @param days 添加的天数
 *
 *  @return 修改后的日期
 */
- (nullable NSDate *)dateByAddingDays:(NSInteger)days;
/**
  *  添加几小时后的日期
  *
  *  @param hours 添加的小时
  *
  *  @return 修改后的日期
  */
- (nullable NSDate *)dateByAddingHours:(NSInteger)hours;
/**
 *  添加几分钟后的日期
 *
 *  @param minutes 添加的分钟数
 *
 *  @return 修改后的日期
 */
- (nullable NSDate *)dateByAddingMinutes:(NSInteger)minutes;
/**
 *  添加多少秒之后的日期
 *
 *  @param seconds 添加的秒数·
 *
 *  @return 修改后的日期
 */
- (nullable NSDate *)dateByAddingSeconds:(NSInteger)seconds;


#pragma mark - Date Format
///=============================================================================
/// @name Date Format
///=============================================================================

/**
 Returns a formatted string representing this date.
 see http://www.unicode.org/reports/tr35/tr35-31/tr35-dates.html#Date_Format_Patterns
 for format description.
 
 @param format   格式字符串代表所需的日期格式 例如 @"yyyy-MM-dd HH:mm:ss"
 
 @return NSString representing the formatted date string.
 */
- (nullable NSString *)stringWithFormat:(NSString *)format;

/**
 Returns a formatted string representing this date.
 see http://www.unicode.org/reports/tr35/tr35-31/tr35-dates.html#Date_Format_Patterns
 for format description.
 
 @param format    String representing the desired date format.
 e.g. @"yyyy-MM-dd HH:mm:ss"
 
 @param timeZone  Desired time zone.
 
 @param locale    Desired locale.
 
 @return NSString representing the formatted date string.
 */
- (nullable NSString *)stringWithFormat:(NSString *)format
                               timeZone:(nullable NSTimeZone *)timeZone
                                 locale:(nullable NSLocale *)locale;

/**
 Returns a string representing this date in ISO8601 format.
 e.g. "2010-07-09T16:13:30+12:00"
 
 @return NSString representing the formatted date string in ISO8601.
 */
- (nullable NSString *)stringWithISOFormat;

/**
 Returns a date parsed from given string interpreted using the format.
 
 @param dateString The string to parse.
 @param format     The string's date format.
 
 @return A date representation of string interpreted using the format.
 If can not parse the string, returns nil.
 */
+ (nullable NSDate *)dateWithString:(NSString *)dateString format:(NSString *)format;

/**
 Returns a date parsed from given string interpreted using the format.
 
 @param dateString The string to parse.
 @param format     The string's date format.
 @param timeZone   The time zone, can be nil.
 @param locale     The locale, can be nil.
 
 @return A date representation of string interpreted using the format.
 If can not parse the string, returns nil.
 */
+ (nullable NSDate *)dateWithString:(NSString *)dateString
                             format:(NSString *)format
                           timeZone:(nullable NSTimeZone *)timeZone
                             locale:(nullable NSLocale *)locale;

/**
 Returns a date parsed from given string interpreted using the ISO8601 format.
 
 @param dateString The date string in ISO8601 format. e.g. "2010-07-09T16:13:30+12:00"
 
 @return A date representation of string interpreted using the format.
 If can not parse the string, returns nil.
 */
+ (nullable NSDate *)dateWithISOFormatString:(NSString *)dateString;



/**
 *  date根据formatter转换成string
 *
 *  @param formatter 格式 例如 yyyy-MM-dd HH:mm:ss
 *
 *  @return 指定格式的字符串 例如 2016-11-11 11:11:11
 */
+(NSString*)dateToString:(NSString *)formatter
                    date:(NSDate *)date;
/**
 *  string类型的时间戳转换成时间
 *
 *  @param dateStr 字符串格式时间戳
 *
 *  @return 指定格式的字符串 例如 2016-11-11 11:11:11
 */
+(NSString*)dateStringToString:(NSString *)dateStr;
/**
 *  将日期从原格式转换成需要的格式
 *
 *  @param sourceFormatter 原格式
 *  @param targetFormatter 改变之后的格式
 *  @param dateString      拥有原格式的字符串
 *
 *  @return 转换成的想要的格式
 */
+(NSString*)convertDateFormatter:(NSString*)sourceFormatter
                 targetFormatter:(NSString*)targetFormatter
                      dateString:(NSString*)dateString;
/**
 *  将日期字符串转换成date
 *
 *  @param formatter  日期的格式
 *  @param dateString 日期字符串
 *
 *  @return 转换好的日期
 */
+(NSDate *)stringToDate:(NSString *)formatter
             dateString:(NSString *)dateString;

+ (NSString *)dateFormatter:(NSString *)formatter dateStr:(NSString *)dateStr;
+ (NSString *)dateStr:(NSString *)dateStr;
+ (NSString *)weekDateStr:(NSString *)dateStr;
@end

NS_ASSUME_NONNULL_END
