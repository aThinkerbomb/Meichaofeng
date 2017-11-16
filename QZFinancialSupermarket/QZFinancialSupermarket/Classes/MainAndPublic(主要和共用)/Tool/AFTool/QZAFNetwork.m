//
//  QZAFNetwork.m
//  QZFinancialSupermarket
//
//  Created by wzh on 17/3/2.
//
//

#import "QZAFNetwork.h"
#import "QZCookieSetTool.h"
#import "QZWaitAnimationTool.h"
#import "NSString+UrlCodingDecoding.h"
#import "QZEndRequestManagerTool.h"
@implementation QZAFNetwork

+ (AFHTTPSessionManager *)requestWithURL:(NSString *)urlstring params:(NSDictionary *)params httpMethod:(NSString *)httpMethod success:(QZHttpSuccess)success failure:(QZHttpFailure)failure isShowMsg:(BOOL)isShowMsg isShowLoading:(BOOL)isShowLoding{
//    [self cancelHTTPOperationsWithUrl:urlstring];
    NSLog(@"请求参数***********************%@",params);
    //显示加载
    if(isShowLoding){
        [QZWaitAnimationTool startAnimation];
    }
    //url编码
    urlstring = [urlstring stringByCodingNSUTF8StringEncoding];
    
    //创建请求管理者
//    AFHTTPSessionManager *manager = [AFHTTPSessionManager shareManager];
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:BaseUrl]];
    //请求超时
    [manager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    manager.requestSerializer.timeoutInterval = 5.f;
    [manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json",@"text/javascript",@"text/html", nil];
    manager.requestSerializer=[AFJSONRequestSerializer serializer];

    //添加请求头
    NSDictionary*header = [QZRequestHeaderSetTool getRequestHeader];
    if ([header isKindOfClass:[NSDictionary class]]) {
        for (NSString* key in [(NSDictionary*)header allKeys]) {
            [manager.requestSerializer setValue:[header objectForKey:key] forHTTPHeaderField:key];
        }
    }

    NSLog(@"header-----------%@",manager.requestSerializer.HTTPRequestHeaders);
    //内容类型
    
    if([httpMethod isEqualToString:@"GET"]){
        
        [manager GET:urlstring parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
            //数据请求的进度
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            if(isShowLoding){
                [QZWaitAnimationTool endAnimation];
            }
            success(task,responseObject);
            // 网络状况通知
            [QZEndRequestManagerTool dealWithNetWorkChange];
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
            if(isShowLoding){
                [QZWaitAnimationTool endAnimation];
            }
            if(isShowMsg){
                [QZEndRequestManagerTool showHintWithError:error];
            }
            failure(task,error);
            // 网络状况通知
            [QZEndRequestManagerTool dealWithNetWorkChange];
        }];
    }else if ([httpMethod isEqualToString:@"POST"]){
       
        //给url设置cookie
        [QZCookieSetTool getLocalCookieToSetUrlCookie];
        if (![self isFileWithParams:params]){//如果参数中没有文件，使用以下方法发送网络请求
            [manager POST:urlstring parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                //保存cookie
                [QZCookieSetTool setUrlToLocalCookieWithUrl:urlstring];
                //是否显示加载
                if(isShowLoding){
                    [QZWaitAnimationTool endAnimation];
                }
                NSLog(@"请求成功Url === %@\n 请求的数据 === %@\n",[urlstring stringByDecodingNSUTF8StringEncoding],responseObject);
                NSLog(@"********************请求完成***************************");
                success(task,responseObject);
                // 网络状况通知
                [QZEndRequestManagerTool dealWithNetWorkChange];
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                //是否显示加载
                if(isShowLoding){
                    [QZWaitAnimationTool endAnimation];
                }
                if(isShowMsg){
                    [QZEndRequestManagerTool showHintWithError:error];
                }
                NSLog(@"请求失败Url === %@\n 请求的Error === %@\n",[urlstring stringByDecodingNSUTF8StringEncoding],error);
                NSLog(@"*********************请求完成**************************");
                failure(task,error);
                // 网络状况通知
                [QZEndRequestManagerTool dealWithNetWorkChange];
                
            }];
        }else{
            //有文件
            /*
            [manager POST:urlstring parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
                
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                success(task,responseObject);
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {

                failure(task,error);
            }];
            */
        }
    }else{
        [QZWaitAnimationTool endAnimation];
    }
    //5.设置返回数据的解析方式
//    manager.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingMutableContainers];
    return manager;
}
+ (BOOL)isFileWithParams:(NSDictionary *)params{
    //4.发送POST请求
    BOOL isFile = NO;
    for (NSString *key in params) {
        id value = params[key];
        //判断请求参数是否是文件数据
        if ([value isKindOfClass:[NSData class]]) {
            isFile = YES;
            break;
        }
    }
    return isFile;
}
//无参数
+ (AFHTTPSessionManager *)postWithBaseURL:(NSString *)url success:(QZHttpSuccess)success failure:(QZHttpFailure)failure{
    return [self postWithBaseURL:url success:success failure:failure isShowMsg:YES];
}
+ (AFHTTPSessionManager *)postWithBaseURL:(NSString *)url success:(QZHttpSuccess)success failure:(QZHttpFailure)failure  isShowMsg:(BOOL)isShowMsg{
    return [self postWithBaseURL:url  success:success failure:failure isShowMsg:isShowMsg isShowLoading:NO];
}
+ (AFHTTPSessionManager *)postWithBaseURL:(NSString *)url success:(QZHttpSuccess)success failure:(QZHttpFailure)failure  isShowMsg:(BOOL)isShowMsg isShowLoading:(BOOL)isShowLoding{
    return [self postWithBaseURL:url params:nil success:success failure:failure isShowMsg:isShowMsg isShowLoading:isShowLoding];
}

//有参数
+ (AFHTTPSessionManager *)postWithBaseURL:(NSString *)url params:(NSDictionary *)params success:(QZHttpSuccess)success failure:(QZHttpFailure)failure{
    return [self postWithBaseURL:url params:params success:success failure:failure isShowMsg:YES];
}
+ (AFHTTPSessionManager *)postWithBaseURL:(NSString *)url params:(NSDictionary *)params success:(QZHttpSuccess)success failure:(QZHttpFailure)failure isShowMsg:(BOOL)isShowMsg{
    return [self postWithBaseURL:url params:params success:success failure:failure isShowMsg:isShowMsg isShowLoading:NO];
}




+ (AFHTTPSessionManager *)postWithBaseURL:(NSString *)url params:(NSDictionary *)params success:(QZHttpSuccess)success failure:(QZHttpFailure)failure isShowMsg:(BOOL)isShowMsg isShowLoading:(BOOL)isShowLoding{
    return [self requestWithURL:url params:params httpMethod:@"POST" success:success failure:failure isShowMsg:isShowMsg isShowLoading:isShowLoding];

}


// 无参
+ (AFHTTPSessionManager *)getWithBaseURL:(NSString *)url  success:(QZHttpSuccess)success failure:(QZHttpFailure)failure{
    return [self requestWithURL:url params:nil httpMethod:@"GET" success:success failure:failure isShowMsg:YES isShowLoading:NO];
}
+ (AFHTTPSessionManager *)getWithBaseURL:(NSString *)url  params:(NSDictionary *)params success:(QZHttpSuccess)success failure:(QZHttpFailure)failure{
    return [self requestWithURL:url params:params httpMethod:@"GET" success:success failure:failure isShowMsg:YES isShowLoading:NO];
}

+ (AFHTTPSessionManager *)getWithBaseURL:(NSString *)url  params:(NSDictionary *)params success:(QZHttpSuccess)success failure:(QZHttpFailure)failure isShowMsg:(BOOL)isShowMsg{
    return [self requestWithURL:url params:params httpMethod:@"GET" success:success failure:failure isShowMsg:isShowMsg isShowLoading:NO];
}

+ (void)cancelHTTPOperationsWithUrl:(NSString *)url{
    [[AFHTTPSessionManager shareManager].operationQueue cancelAllOperations];
    for (NSURLSessionDataTask *task in [AFHTTPSessionManager shareManager].dataTasks) {
        NSString *currentUrlStr = [[task.currentRequest URL] absoluteString];
        if([currentUrlStr isEqual:url]){
            [task cancel];
        }
    }
}
+ (void)cancelAllHTTPOperations{
    [[AFHTTPSessionManager shareManager].operationQueue cancelAllOperations];
    for (NSURLSessionDataTask *task in [AFHTTPSessionManager shareManager].dataTasks) {
        [task cancel];
    }
}
+ (BOOL)isLodingHTTPOperationsWithUrl:(NSString *)url{
    for (NSURLSessionDataTask *task in [AFHTTPSessionManager shareManager].dataTasks) {
        NSString *currentUrlStr = [[task.currentRequest URL] absoluteString];
        if([currentUrlStr isEqual:url]){
            if(task.state == NSURLSessionTaskStateRunning){//正在运行
                return YES;
            }
        }
    }
    return NO;
}

+ (void)setSuspendHttpOperationWithUrl:(NSString *)url{
    for (NSURLSessionDataTask *task in [AFHTTPSessionManager shareManager].dataTasks) {
        NSString *currentUrlStr = [[task.currentRequest URL] absoluteString];
        if([currentUrlStr isEqual:url]){
            [task suspend];
        }
    }
}

+ (void)setResumeHttpOperationWithUrl:(NSString *)url{
    for (NSURLSessionDataTask *task in [AFHTTPSessionManager shareManager].dataTasks) {
        NSString *currentUrlStr = [[task.currentRequest URL] absoluteString];
        if([currentUrlStr isEqual:url]){
            [task resume];
        }
    }
}
+ (void)setSuspendAllHttpOperation{
    for (NSURLSessionDataTask *task in [AFHTTPSessionManager shareManager].dataTasks) {
        [task suspend];
    }
}
+ (void)setResumeAllHttpOperation{
    for (NSURLSessionDataTask *task in [AFHTTPSessionManager shareManager].dataTasks) {
        [task resume];
    }
}

+ (void)setSuspendHttpOperationWithAdditionUrl:(NSString *)url{
    [self setSuspendAllHttpOperation];
    [self setResumeHttpOperationWithUrl:url];
}
+ (void)setResumeHttpOperationWithAdditionUrl:(NSString *)url{
    [self setResumeAllHttpOperation];
    [self setSuspendHttpOperationWithUrl:url];
}


@end
