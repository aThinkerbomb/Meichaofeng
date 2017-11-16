//
//  QZRequestHeaderSetTool.h
//  QZFinancialSupermarket
//
//  Created by wzh on 17/3/2.
//
//

#import <Foundation/Foundation.h>

@interface QZRequestHeaderSetTool : NSObject
+(NSDictionary *)getRequestHeader;
+ (NSMutableURLRequest *)requestWithUrl:(NSString *)url;
+ (NSDictionary *)webHeaderDic;
@end
