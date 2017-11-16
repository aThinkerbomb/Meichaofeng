//
//  QZEndRequestManagerTool.h
//  QZFinancialSupermarket
//
//  Created by wzh on 2017/6/29.
//
//

#import <Foundation/Foundation.h>

@interface QZEndRequestManagerTool : NSObject
+ (QZEndRequestManagerTool *)shareEndRequestManagerTool;
@property (nonatomic, assign) BOOL isShowMsg;

- (void)showHintWithResponseObject:(id)responseObject;


+ (void)showHintWithResponseObject:(id)responseObject;
+ (void)showHintWithError:(NSError *)error;

// 网络改变通知
+ (void)dealWithNetWorkChange;
@end
