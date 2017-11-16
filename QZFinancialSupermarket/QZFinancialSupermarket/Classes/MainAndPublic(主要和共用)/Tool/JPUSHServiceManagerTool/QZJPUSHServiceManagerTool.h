//
//  JPUSHServiceManagerTool.h
//  QZFinancialSupermarket
//
//  Created by wzh on 17/3/15.
//
//

#import <Foundation/Foundation.h>

@interface QZJPUSHServiceManagerTool : NSObject
+ (void)setAlias:(NSString *)alias fetchCompletionHandle:(void (^)(int iResCode, NSSet *iTags, NSString *iAlias))completionHandler;

@end
