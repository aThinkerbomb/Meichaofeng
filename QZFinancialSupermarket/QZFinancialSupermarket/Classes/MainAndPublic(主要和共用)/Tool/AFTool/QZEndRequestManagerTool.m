//
//  QZEndRequestManagerTool.m
//  QZFinancialSupermarket
//
//  Created by wzh on 2017/6/29.
//
//

#import "QZEndRequestManagerTool.h"
#import "YXNetworkReachabilityManager.h"
@implementation QZEndRequestManagerTool
static QZEndRequestManagerTool *_endRequestManagerTool;

+ (QZEndRequestManagerTool *)shareEndRequestManagerTool{
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        _endRequestManagerTool = [[QZEndRequestManagerTool alloc]init];
        
    });
    _endRequestManagerTool.isShowMsg = YES;
    return _endRequestManagerTool;
}
- (void)showHintWithResponseObject:(id)responseObject{
    [self showHintWithResponseObject:responseObject];
}


+ (void)showHintWithResponseObject:(id)responseObject{
    


    if([responseObject isKindOfClass:[NSDictionary class]]){
        id state_id = [responseObject objectForKey:@"state"];
        if(state_id){
            NSString *state = [NSString stringWithFormat:@"%@",state_id];
            NSString *msgStr = [NSString stringWithFormat:@"%@",[responseObject objectForKey:@"msg"]];
            //不是成功码
            if(![state isEqual:QZSuccessfulCode]){
                //单点
                if([state isEqual:QZSinglePointCode]){
                    [[NSNotificationCenter defaultCenter]postNotificationName:QZSinglePointNoticeKey object:QZSinglePointCode];
                    
                    [self showHudWithHint:QZSinglePointCodeMessageLitigation];
                }else{
                    [self showHudWithHint:msgStr];
                }
            }
        }
    }else{
        [self showHudWithHint:QZErrorDataAbnormal];
    }
}
+ (void)showHintWithError:(NSError *)error{
    
    
    // cancel 方式回调的
    if(error.code != QZErrorCancelCode){
        
        [self showHint_object:QZErrorNotNetWork];
//        NSLog(@"88888888888888888888888888888888888888888888888======%@",error);
    }

}

+ (void)dealWithNetWorkChange{
    
    NetworkType type = [YXNetworkReachabilityManager shareInstance].networkType;
    NSNumber *statusNumber = [NSNumber numberWithInteger:type];
    [[NSNotificationCenter defaultCenter] postNotificationName:ZHNetStateChange object:statusNumber];
}
@end
