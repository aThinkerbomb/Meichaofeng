//
//  QZCookieSetTool.h
//  QZFinancialSupermarket
//
//  Created by wzh on 17/3/2.
//
//

#import <Foundation/Foundation.h>

@interface QZCookieSetTool : NSObject
+ (void)getLocalCookieToSetUrlCookie;
+ (void)setUrlToLocalCookieWithUrl:(NSString *)url;

@end
