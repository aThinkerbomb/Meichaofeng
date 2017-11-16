//
//  ZHTool.m
//  QZFinancialSupermarket
//
//  Created by wzh on 17/2/27.
//
//

#import "ZHTool.h"
#define CALLWEBVIEWTAG  1000
#define myDotNumbers    @"0123456789.\n"
#define myNumbers       @"0123456789\n"
/**
 * 前往隐私 --权限前往隐私
 */
NSString *const QZGotoPhonePrivacy = @"App-Prefs:root=Privacy";

@implementation ZHTool
+ (void)file:(char*)sourceFile function:(char*)functionName lineNumber:(int)lineNumber format:(NSString*)format, ...
{
#ifdef DEBUG
    //NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    va_list ap;
    NSString *print, *file, *function;
    va_start(ap,format);
    file = [[NSString alloc] initWithBytes: sourceFile length: strlen(sourceFile) encoding: NSUTF8StringEncoding];
    
    function = [NSString stringWithCString:functionName encoding:NSUTF8StringEncoding];
    print = [[NSString alloc] initWithFormat: format arguments: ap];
    va_end(ap);
    NSLog(@"%@:%d %@; %@\n\n", [file lastPathComponent], lineNumber, function, print);
    
#endif
}
+ (NSString *)getCurrentVersion{
    // 如何知道第一次使用这个版本？比较上次的使用情况
    NSString *versionKey = @"CFBundleShortVersionString";
    // 获得当前打开软件的版本号
    NSString *currentVersion = [NSBundle mainBundle].infoDictionary[versionKey];
    return currentVersion;
}

+ (BOOL)isNUllOrIsEmptyWith:(id)object{
    if([object isEqual:@""] || !object){
        return YES;
    }
    return NO;
}
+ (BOOL)isNONUllOrIsEmptyWith:(id)object{
    return ![self isNUllOrIsEmptyWith:object];
}

+ (NSString *)strongConversionWith:(NSString *)string{
    return [NSString stringWithFormat:@"%@",string];
}

+ (CGSize)sizeWithString:(NSString *)str font:(UIFont *)font maxSize:(CGSize)maxSize
{
    NSDictionary *dict = @{NSFontAttributeName : font};
    CGSize size =  [str boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size;
    return size;
}
+ (CGFloat)sizeWithString_H:(NSString *)str font:(UIFont *)font width:(CGFloat)width{
    return [self sizeWithString:str font:font maxSize:CGSizeMake(width, MAXFLOAT)].height;
}
+ (CGFloat)sizeWithString_W:(NSString *)str font:(UIFont *)font height:(CGFloat)height{
    return [self sizeWithString:str font:font maxSize:CGSizeMake(MAXFLOAT, height)].width;
}
+ (BOOL)moneyInputFaultTolerantToDealWithTextField:(UITextField *)textField TotalStr:(NSString *)totalStr range:(NSRange)range andString:(NSString *)string{
    
    
    if ([totalStr rangeOfString:@"0"].location==0 &&[totalStr rangeOfString:@"."].length!=1 ) {
        NSUInteger nWetLoc = [textField.text rangeOfString:@"0"].location;
        if (NSNotFound != nWetLoc) {
            NSArray*  aerNum = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"0"];
            for (int i = 0;i<aerNum.count;i++) {
                if ([string isEqualToString:aerNum[i]]) {
                    return NO;
                }
            }
        }
    }
    if ([totalStr rangeOfString:@"."].location ==0) {
        return NO;
    }
    NSUInteger nqNittLoc = [textField.text rangeOfString:@"."].location;
    if (NSNotFound != nqNittLoc) {
        if ([string isEqualToString:@"."]) {
            return NO;
        }
    }
    
    NSCharacterSet *cs;
    NSUInteger nDotLoc = [textField.text rangeOfString:@"."].location;
    if (NSNotFound == nDotLoc && 0 != range.location) {
        cs = [[NSCharacterSet characterSetWithCharactersInString:myNumbers]invertedSet];
        if ([string isEqualToString:@"."]) {
            return YES;
        }
    }
    else {
        cs = [[NSCharacterSet characterSetWithCharactersInString:myDotNumbers]invertedSet];
    }
    NSString *filtered = [[string componentsSeparatedByCharactersInSet:cs] componentsJoinedByString:@""];
    BOOL basicTest = [string isEqualToString:filtered];
    if (!basicTest) {
        return NO;
    }
    if (NSNotFound != nDotLoc && range.location > nDotLoc +2 ) {//小数点后面两位
        return NO;
        
    }
    return YES;
    
}
+ (BOOL)version:(NSString *)version appVersion:(NSString *)appVersion
{
    //    _version = @"1.0.0";
    if([version compare:appVersion] == NSOrderedDescending){//降序
        return YES;
    }else{
        return NO;
    }
}
/*
* @brief 把格式化的JSON格式的字符串转换成字典
* @param jsonString JSON格式的字符串
* @return 返回字典
*/
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString{
    if (jsonString == nil) {
        return nil;
    }
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err) {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}

+ (BOOL)isEmptyOrNullWithObject:(id)object{
    
    if([object isEqual:@""] || !object || [object isEqual:@"0"]){
        return YES;
    }else if([object isEqual:@"NULL"]){
        return YES;
    }else if ([object isEqual:@"null"]){
        return YES;
    }else if ([object isEqual:@"<NULL>"]){
        return YES;
    }else if ([object isEqual:@"<null>"]){
        return YES;
    }else if ([object isEqual:@"(NULL)"]){
        return YES;
    }else if ([object isEqual:@"(null)"]){
        return YES;
    }
    return NO;
}


+(BOOL)isEmptyOrNull:(NSString *)str{
    if (![str isKindOfClass:[NSString class]]) {
        return TRUE;
    }else if (str==nil) {
        return TRUE;
    }else if(!str) {
        // null object
        return TRUE;
    } else if(str==NULL) {
        // null object
        return TRUE;
    } else if([str isEqualToString:@"NULL"]) {
        // null object
        return TRUE;
    } else if ([str isEqualToString:@"<null>"]){
        return TRUE;
    }
    else if ([str isEqualToString:@"<NULL>"]){
        return TRUE;
    }
    else if ([str isEqualToString:@"(NULL)"]){
        return TRUE;
    }
    else if ([str isEqualToString:@"(null)"]){
        return TRUE;
    }
    else if ([str isKindOfClass:[NSNull class]]){
        return TRUE;
    }
    else if ([str isEqualToString:@""]){
        return TRUE;
    }else if ([str isEqualToString:@"0"])
    {
        return TRUE;
    }
    else {
        NSString *trimedString = [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        if ([trimedString length] == 0) {
            // empty string
            return TRUE;
        } else {
            // is neither empty nor null
            return FALSE;
        }
    }
}
+ (BOOL)isPassword:(NSString *)str{
    NSString *CM = @"^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,20}$";
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    return [regextestcm evaluateWithObject:str];
}

+ (NSInteger)daysFromDate:(NSDate *)startDate toDate:(NSDate *)endDate {
    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc] init];
    // 话说在真机上需要设置区域，才能正确获取本地日期，天朝代码:zh_CN
    dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    //得到相差秒数
    NSTimeInterval time = [endDate timeIntervalSinceDate:startDate];
    int days = ((int)time)/(3600*24);
    int hours = ((int)time)%(3600*24)/3600;
    int minute = ((int)time)%(3600*24)/3600/60;
    if (days <= 0 && hours <= 0&&minute<= 0) {
        NSLog(@"0天0小时0分钟");
        return 0;
    }
    else {
        NSLog(@"%@",[[NSString alloc] initWithFormat:@"%i天%i小时%i分钟",days,hours,minute]);
        // 之所以要 + 1，是因为 此处的days 计算的结果 不包含当天 和 最后一天\
        （如星期一 和 星期四，计算机 算的结果就是2天（星期二和星期三），日常算，星期一——星期四相差3天，所以需要+1）\
        对于时分 没有进行计算 可以忽略不计
        return days + 1;
    }
}

+ (NSString *)dealWithPhoneNumFormatWithPhoneNumStr:(NSString *)phoneNumStr{
    if(!phoneNumStr || [phoneNumStr isEqual:@""]){
        return @"";
    }
    phoneNumStr = [[phoneNumStr componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]componentsJoinedByString:@""];
    phoneNumStr = [phoneNumStr stringByReplacingOccurrencesOfString:@"+86" withString:@""];
    phoneNumStr = [phoneNumStr stringByReplacingOccurrencesOfString:@"+" withString:@""];
    phoneNumStr = [phoneNumStr stringByReplacingOccurrencesOfString:@"-" withString:@""];
    return phoneNumStr;
}

+ (void)goToPhoneMyAppPrivacy{
    NSURL *url = [NSURL URLWithString:QZGotoPhonePrivacy];
    if ([[UIApplication sharedApplication] canOpenURL:url]) {
        [[UIApplication sharedApplication] openURL:url];
    }
}

/**
 *  验证邮箱合法性
 */
+ (BOOL)isValidateEmail:(NSString *)email{
    if ([ZHTool verifyWithRegExp:@"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}" andNum:email]) {
        return YES;
    }
    return NO;
}
/**
 *  正则验证
 */
+ (BOOL)verifyWithRegExp:(NSString*)regExp andNum:(NSString*)num{
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regExp];
    return [identityCardPredicate evaluateWithObject:num];
}

+ (NSString *)dealWithstrValidityWithObject:(id)object{
    if([self isNUllOrIsEmptyWith:object]){
        return @"";
    }
    if(![object isKindOfClass:[NSString class]]){
        return @"";
    }
    
    NSString *validityStr = (NSString *)object;
    NSArray *tmpStrValidityAry = [validityStr componentsSeparatedByString:@"-"];
    
    //身份证有效截止日期
    NSString *validityExpirationDate = [tmpStrValidityAry lastObject];
    //格式化截止日期
    NSString *formattingValidityExpirationDate = @"";
    if ([validityExpirationDate isEqualToString:@"长期"]) {
        formattingValidityExpirationDate = @"2100-01-01";
    }else{
        
        formattingValidityExpirationDate = [NSDate convertDateFormatter:@"yyyyMMdd" targetFormatter:@"yyyy-MM-dd" dateString:validityExpirationDate];
    }
    ZHLog(@"%@",formattingValidityExpirationDate);
    return formattingValidityExpirationDate;
}
+ (NSInteger)timeDifferenceWithServerSystemDate:(NSString *)serverSystemDate validityDate:(NSString *)validityDate  isLoadOrScan:(BOOL)isLoadOrScan{
    
    NSString *formatStr = @"yyyy-MM-dd";
    //获取身份证有效期格式化
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:formatStr];
    
    //系统时间处理
    NSString *systemString = [NSString stringWithFormat:@"%@",serverSystemDate];
    NSArray *stystemArray = [systemString componentsSeparatedByString:@" "];
    NSDate *dateSystem = [dateFormatter dateFromString:[stystemArray objectAtIndex:0]];
    
    //处理长期身份证
    if(isLoadOrScan){//扫描的
        validityDate = [ZHTool dealWithstrValidityWithObject:validityDate];
    }
    NSDate *validity_Date;
    //如果位数 太长
    if (validityDate.length >10) {
        validity_Date = [dateFormatter dateFromString:[validityDate substringWithRange:NSMakeRange(0,10)]];
    }else{
        validity_Date = [dateFormatter dateFromString:validityDate];
    }
    return [ZHTool daysFromDate:dateSystem toDate:validity_Date];
    
}

+ (void)callPhoneWithNum:(NSString *)phoneNum{
    NSMutableString *callStr=[[NSMutableString alloc] initWithFormat:@"telprompt://%@",phoneNum];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:callStr]];
}
+ (void)callPhoneTelWithNum:(NSString *)phoneNum{
    NSMutableString *callStr=[[NSMutableString alloc] initWithFormat:@"tel://%@",phoneNum];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:callStr]];
}
+ (void)callPhoneTel{
    [self callPhoneTelWithNum:QZServerTelePhone];
}
//+ (void)callPhone{
//    [self callPhoneWithNum:QZServerTelePhone];
//}
+ (void)callPhoneWithView:(UIView *)view{
    [self callPhoneWithNum:QZServerTelePhone view:view];
}
+ (void)callPhoneWithView:(UIView *)view phone:(NSString *)phone{
    [self callPhoneWithNum:phone view:view];
}
+ (void)callPhoneWithNum:(NSString *)phoneNum view:(UIView *)view{
    
    UIWebView *callWebview = (UIWebView *)[view viewWithTag:CALLWEBVIEWTAG];
    NSMutableString *str=[[NSMutableString alloc] initWithFormat:@"tel:%@",phoneNum];
    if(!callWebview){
        callWebview = [[UIWebView alloc] init];
        callWebview.tag = CALLWEBVIEWTAG;
        [view addSubview:callWebview];
    }
    [callWebview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:str]]];
}

static inline NSRegularExpression * NameRegularExpression() {
    static NSRegularExpression *_nameRegularExpression = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _nameRegularExpression = [[NSRegularExpression alloc] initWithPattern:@"^\\w+" options:NSRegularExpressionCaseInsensitive error:nil];
    });
    return _nameRegularExpression;
}

@end
