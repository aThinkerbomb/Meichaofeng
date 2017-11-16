//
//  QZTool.m
//  QZFinancialSupermarket
//
//  Created by wzh on 2017/6/9.
//
//

#import "QZTool.h"

#import <ifaddrs.h>
#import <arpa/inet.h>


@implementation QZTool
+ (BOOL)isMobile:(NSString *)str
{
    NSString *CM = @"^1[0-9]{10}";
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    return [regextestcm evaluateWithObject:str];
}

+ (BOOL)isBank:(NSString *)str
{
    NSString *CM = @"^[0-9]{16，19}";
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    return [regextestcm evaluateWithObject:str];
}
+ (BOOL)isAllSameWithStr:(NSString *)str{
    //是否全部一样 YES 全部一样  NO 不一样
    BOOL isSameYesNO = NO;
    for (int i = 0; i < str.length; i ++) {
        if(i > 0){
            NSString *preStr = [str substringWithRange:NSMakeRange(i - 1, 1)];
            NSString *currentStr = [str substringWithRange:NSMakeRange(i, 1)];
            
            if(![preStr isEqual:currentStr]){
                break;
            }
            if(i == str.length - 1){
                isSameYesNO = YES;
            }
            //            NSLog(@"i =========%d",i);
        }
    }
    if(isSameYesNO){
        //        NSLog(@"yiyang");
    }else{
        //        NSLog(@"buyiyang");
    }
    return isSameYesNO;
}
+ (float)likePercent:(NSString *)testString AndTargetString:(NSString *)target{
    NSUInteger n = testString.length;
    NSUInteger m = target.length;
    if (m==0) return n;
    if (n==0) return m;
    //Construct a matrix, need C99 support
    int matrix[n+1][m+1];
    memset(&matrix[0], 0, m+1);
    for(int i=1; i<=n; i++) {
        memset(&matrix[i], 0, m+1);
        matrix[i][0]=i;
    }
    for(int i=1; i<=m; i++) {
        matrix[0][i]=i;
    }
    for(int i=1;i<=n;i++)
    {
        unichar si = [testString characterAtIndex:i-1];
        for(int j=1;j<=m;j++)
        {
            unichar dj = [target characterAtIndex:j-1];
            int cost;
            if(si==dj){
                cost=0;
            }
            else{
                cost=1;
            }
            const int above=matrix[i-1][j]+1;
            const int left=matrix[i][j-1]+1;
            const int diag=matrix[i-1][j-1]+cost;
            matrix[i][j]=MIN(above, MIN(left, diag));
        }
    }
    return 100.0 - 100.0*matrix[n][m]/testString.length;
}



+ (BOOL)isNUllOrIsEmptyWith:(id)object{
    if([object isEqual:@""] || !object){
        return YES;
    }
    return NO;
}

//+ (NSString *)getBlockBox{
//    // 获取设备管理器实例
//    FMDeviceManager_t *manager = [FMDeviceManager sharedManager];
//    
//    // 获取设备指纹黑盒数据，请确保在应用开启时已经对SDK进行初始化，切勿在get的时候才初始化
//    // 如果此处获取到的blackBox特别长(超过200字节)，说明调用get的时候init还没有完成(一般需要1-3秒)，进入了降级处理
//    // 降级不影响正常设备信息的获取，只是会造成blackBox字段超长，且无法获取设备真实IP
//    NSString *blackBox = manager->getDeviceInfo();
//    NSLog(@"同盾设备指纹数据----------------: %@", blackBox);
//    // 将blackBox随业务请求提交到你的服务端，服务端调用同盾风险决策API时需要带上这个参数
//    if([self isNUllOrIsEmptyWith:blackBox]){
//        blackBox = @"";
//    }
//    return blackBox;
//}
//+ (NSString *)getBaiQiShiTokenKey{
//    NSString *tokenKey = [[BQZeviceFingerPrinting sharedBQZeviceFingerPrinting] getTokenKey];
//    if([self isNUllOrIsEmptyWith:tokenKey]){
//        tokenKey = @"";
//    }
//    NSLog(@"白骑士指纹设备数据tokenKey-----------: %@",tokenKey);
//    return tokenKey;
//}

+ (NSString *)joiningTogetherDataWithStr:(NSString *)string{
    if([QZTool isNUllOrIsEmptyWith:string]){
        return @"";
    }else{
        NSString *phone =  [QZLoginAccountTool accountModel].userMobile;
        NSString *loadUrl;
        if([string containsString:@"?"]){
            loadUrl = [NSString stringWithFormat:@"%@&headerData=%@&phone=%@",string,[QZRequestHeaderSetTool webHeaderDic],phone];
        }else{
            loadUrl = [NSString stringWithFormat:@"%@?headerData=%@&phone=%@",string,[QZRequestHeaderSetTool webHeaderDic],phone];
        }
        loadUrl = [loadUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        return loadUrl;
    }
}




#pragma mark - 获取设备当前网络IP地址
+ (NSString *)getIPAddress {
    NSString *address = @"error";
    struct ifaddrs *interfaces = NULL;
    struct ifaddrs *temp_addr = NULL;
    int success = 0;
    // retrieve the current interfaces - returns 0 on success
    success = getifaddrs(&interfaces);
    if (success == 0) {
        // Loop through linked list of interfaces
        temp_addr = interfaces;
        while(temp_addr != NULL) {
            if(temp_addr->ifa_addr->sa_family == AF_INET) {
                // Check if interface is en0 which is the wifi connection on the iPhone
                if([[NSString stringWithUTF8String:temp_addr->ifa_name] isEqualToString:@"en0"]) {
                    // Get NSString from C String
                    address = [NSString stringWithUTF8String:inet_ntoa(((struct sockaddr_in *)temp_addr->ifa_addr)->sin_addr)];
                }
            }
            temp_addr = temp_addr->ifa_next;
        }
    }
    // Free memory
    freeifaddrs(interfaces);
    return address;
}

@end
