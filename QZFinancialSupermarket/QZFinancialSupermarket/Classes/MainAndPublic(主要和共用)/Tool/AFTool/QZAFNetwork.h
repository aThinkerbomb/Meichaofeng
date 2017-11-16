//
//  QZAFNetwork.h
//  QZFinancialSupermarket
//
//  Created by wzh on 17/3/2.
//
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
typedef void(^QZHttpSuccess)(NSURLSessionDataTask * task,id json);
typedef void(^QZHttpFailure)(NSURLSessionDataTask * task,NSError *error);

@interface QZAFNetwork : NSObject
+ (AFHTTPSessionManager *)requestWithURL:(NSString *)urlstring
                                  params:(NSDictionary *)params
                              httpMethod:(NSString *)httpMethod
                                   success:(QZHttpSuccess)success
                                failure:(QZHttpFailure)failure
                               isShowMsg:(BOOL)isShowMsg
                           isShowLoading:(BOOL)isShowLoding;

/**
 *  post 无参数请求
 *
 *  @param url     地址链接
 *  @param success 成功回调
 *  @param failure 失败回调
 */
+ (AFHTTPSessionManager *)postWithBaseURL:(NSString *)url success:(QZHttpSuccess)success failure:(QZHttpFailure)failure;
+ (AFHTTPSessionManager *)postWithBaseURL:(NSString *)url success:(QZHttpSuccess)success failure:(QZHttpFailure)failure  isShowMsg:(BOOL)isShowMsg;
+ (AFHTTPSessionManager *)postWithBaseURL:(NSString *)url success:(QZHttpSuccess)success failure:(QZHttpFailure)failure  isShowMsg:(BOOL)isShowMsg isShowLoading:(BOOL)isShowLoding;

/**
 *  post 有参数请求
 *
 *  @param url     地址链接
 *  @param params  参数
 *  @param success 成功回调
 *  @param failure 失败回调
 */
+ (AFHTTPSessionManager *)postWithBaseURL:(NSString *)url  params:(NSDictionary *)params success:(QZHttpSuccess)success failure:(QZHttpFailure)failure;

+ (AFHTTPSessionManager *)postWithBaseURL:(NSString *)url params:(NSDictionary *)params success:(QZHttpSuccess)success failure:(QZHttpFailure)failure isShowMsg:(BOOL)isShowMsg;
+ (AFHTTPSessionManager *)postWithBaseURL:(NSString *)url params:(NSDictionary *)params success:(QZHttpSuccess)success failure:(QZHttpFailure)failure isShowMsg:(BOOL)isShowMsg isShowLoading:(BOOL)isShowLoding;

/**
 *  get 无参数请求
 *
 *  @param url     地址链接
 *  @param success 成功回调
 *  @param failure 失败回调
 */
+ (AFHTTPSessionManager *)getWithBaseURL:(NSString *)url  success:(QZHttpSuccess)success failure:(QZHttpFailure)failure;
/**
 *  get 有参数的请求
 *
 *  @param url     地址链接
 *  @param params  参数
 *  @param success 成功回调
 *  @param failure 失败回调
 */
+ (AFHTTPSessionManager *)getWithBaseURL:(NSString *)url  params:(NSDictionary *)params success:(QZHttpSuccess)success failure:(QZHttpFailure)failure;

+ (AFHTTPSessionManager *)getWithBaseURL:(NSString *)url  params:(NSDictionary *)params success:(QZHttpSuccess)success failure:(QZHttpFailure)failure isShowMsg:(BOOL)isShowMsg;
+ (void)cancelHTTPOperationsWithUrl:(NSString *)url;
+ (void)cancelAllHTTPOperations;
+ (BOOL)isLodingHTTPOperationsWithUrl:(NSString *)url;
//暂停
+ (void)setSuspendHttpOperationWithUrl:(NSString *)url;
//回复
+ (void)setResumeHttpOperationWithUrl:(NSString *)url;
+ (void)setSuspendAllHttpOperation;
+ (void)setResumeAllHttpOperation;
+ (void)setSuspendHttpOperationWithAdditionUrl:(NSString *)url;
+ (void)setResumeHttpOperationWithAdditionUrl:(NSString *)url;
@end
