//
//  NSString+UrlCodingDecoding.m
//  QZFinancialSupermarket
//
//  Created by wzh on 17/3/2.
//
//

#import "NSString+UrlCodingDecoding.h"

@implementation NSString (UrlCodingDecoding)
- (NSString *)stringByCodingNSUTF8StringEncoding{
    return [self stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}
- (NSString *)stringByDecodingNSUTF8StringEncoding{
    return [self stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}
@end
