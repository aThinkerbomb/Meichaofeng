//
//  QZRequestHeaderSetTool.m
//  QZFinancialSupermarket
//
//  Created by wzh on 17/3/2.
//
//

#import "QZRequestHeaderSetTool.h"

@implementation QZRequestHeaderSetTool

+(NSDictionary *)getRequestHeader{
    

    return [self headerDic];;
}
+ (NSMutableURLRequest *)requestWithUrl:(NSString *)url{
    NSMutableURLRequest *request =[NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    [request setAllHTTPHeaderFields:[self getRequestHeader]];
    request.cachePolicy = NSURLRequestReloadIgnoringCacheData;
    return request;
}
+ (NSDictionary *)headerDic{
    NSMutableDictionary *mutDic = [NSMutableDictionary dictionary];
    // 系统的获取uuid 会在删掉应用后变,只有保存在keyChain里面下次安装应用的时候从里面取出来，才会保持不变，所以用了FCUUID三方
    //    NSString *uuid = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
    
    // uuidForDevice在抹掉手机的时候才会变，其他情况不会变。uuid方法也会改变
    NSString *uuid = [FCUUID uuidForDevice];
    NSString *ip = [QZTool getIPAddress];
    NSString *token = kGetObjectForKey(QZToken);
    
    [mutDic setValue:uuid forKey:@"phoneid"];
    [mutDic setValue:ip forKey:@"ip"];
    [mutDic setValue:@"" forKey:@"devicetoken"];
    [mutDic setValue:token forKey:@"token"];

    return mutDic;
}

+ (NSDictionary *)webHeaderDic{
    NSMutableDictionary *mutDic = [NSMutableDictionary dictionary];
    [mutDic setValue:@"ios" forKey:@"device"];
    NSString *idfv = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
    [mutDic setValue:idfv forKey:@"tmnlNbr"];
    return mutDic;
}
@end
