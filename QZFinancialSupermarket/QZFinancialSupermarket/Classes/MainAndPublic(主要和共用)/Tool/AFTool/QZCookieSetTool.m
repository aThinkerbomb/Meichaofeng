//
//  QZCookieSetTool.m
//  QZFinancialSupermarket
//
//  Created by wzh on 17/3/2.
//
//

#import "QZCookieSetTool.h"
static NSString *cookieData = @"cookiesdata";
@implementation QZCookieSetTool

+ (void)setUrlToLocalCookieWithUrl:(NSString *)url{
    NSArray *cookies = [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookiesForURL: [NSURL URLWithString:url]];
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:cookies];
    [[NSUserDefaults standardUserDefaults] setObject:data forKey:cookieData];
}

+ (void)getLocalCookieToSetUrlCookie{
    NSData *cookiesdata = [[NSUserDefaults standardUserDefaults] objectForKey:cookieData];
    if([cookiesdata length]) {
        NSArray *cookies = [NSKeyedUnarchiver unarchiveObjectWithData:cookiesdata];
        NSHTTPCookie *cookie;
        for (cookie in cookies) {
            [[NSHTTPCookieStorage sharedHTTPCookieStorage] setCookie:cookie];
        }
    }
}

@end
