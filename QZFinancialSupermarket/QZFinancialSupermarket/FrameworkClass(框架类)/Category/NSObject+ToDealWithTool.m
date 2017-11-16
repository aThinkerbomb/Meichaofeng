//
//  NSObject+ToDealWithTool.m
//  QZFinancialSupermarket
//
//  Created by wzh on 17/3/10.
//
//

#import "NSObject+ToDealWithTool.h"

@implementation NSObject (ToDealWithTool)
- (NSString *)strongConversion{
    return [NSString stringWithFormat:@"%@",self];
}
- (BOOL)isRequestSuccessful{
    if(!self){
        return NO;
    }
    if([self isEqual:QZSuccessfulCode]){
        return YES;
    }
    return NO;
}

@end
