//
//  NSString+UrlCodingDecoding.h
//  QZFinancialSupermarket
//
//  Created by wzh on 17/3/2.
//
//

#import <Foundation/Foundation.h>

@interface NSString (UrlCodingDecoding)
//编码
- (NSString *)stringByCodingNSUTF8StringEncoding;
//解码
- (NSString *)stringByDecodingNSUTF8StringEncoding;
@end
