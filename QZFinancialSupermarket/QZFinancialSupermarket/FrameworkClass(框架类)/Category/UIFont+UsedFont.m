//
//  UIFont+UsedFont.m
//  QZFinancialSupermarket
//
//  Created by wzh on 17/2/28.
//
//

#import "UIFont+UsedFont.h"

static NSString *systemFontName = @"system";
static NSString *customFontName = @"Helvetica";

@implementation UIFont (UsedFont)
+ (UIFont *)textFont10{
    return [UIFont systemFontOfSize:10];
}
+ (UIFont *)textFont11{
    return [UIFont textFontSize:11];
}
+ (UIFont *)textFont12{
    return [UIFont textFontSize:12];
}
+ (UIFont *)textFont13{
    return [UIFont textFontSize:13];
}
+ (UIFont *)textFont14{
    return [UIFont textFontSize:14];
}
+ (UIFont *)textFont15{
    return [UIFont textFontSize:15];
}
+ (UIFont *)textFont16{
    return [UIFont textFontSize:16];
}
+ (UIFont *)textFont17{
    return [UIFont textFontSize:17];
}
+ (UIFont *)textFont18{
    return [UIFont textFontSize:18];
}
+ (UIFont *)textFont19{
    return [UIFont textFontSize:19];
}
+ (UIFont *)textFont20{
    return [UIFont textFontSize:20];
}
+ (UIFont *)textFont21{
    return [UIFont textFontSize:21];
}
+ (UIFont *)textFont22{
    return [UIFont textFontSize:22];
}
+ (UIFont *)textFont23{
    return [UIFont textFontSize:23];
}
+ (UIFont *)textFont24{
    return [UIFont textFontSize:24];
}
+ (UIFont *)textFont25{
    return [UIFont textFontSize:25];
}
+ (UIFont *)textFont26{
    return [UIFont textFontSize:26];
}
+ (UIFont *)textFont27{
    return [UIFont textFontSize:27];
}
+ (UIFont *)textFont28{
    return [UIFont textFontSize:28];
}
+ (UIFont *)textFont29{
    return [UIFont textFontSize:29];
}
+ (UIFont *)textFont30{
    return [UIFont textFontSize:30];
}
+ (UIFont *)textFont31{
    return [UIFont textFontSize:31];
}
+ (UIFont *)textFont32{
    return [UIFont textFontSize:32];
}
+ (UIFont *)textBoldFont10{
    return [UIFont textBoldFontSize:10];
}
+ (UIFont *)textBoldFont11{
    return [UIFont textBoldFontSize:11];
}
+ (UIFont *)textBoldFont12{
    return [UIFont textBoldFontSize:12];
}
+ (UIFont *)textBoldFont15{
    return [UIFont textBoldFontSize:15];
}
+ (UIFont *)textBoldFont16{
    return [UIFont textBoldFontSize:16];
}
+ (UIFont *)textBoldFont18{
    return [UIFont textBoldFontSize:18];
}
+ (UIFont *)textBoldFont20{
    return [UIFont textBoldFontSize:20];
}
+ (UIFont *)textBoldFont22{
    return [UIFont textBoldFontSize:22];
}
+ (UIFont *)textBoldFont23{
    return [UIFont textBoldFontSize:23];
}
+ (UIFont *)textBoldFont24{
    return [UIFont textBoldFontSize:24];
}
+ (UIFont *)textBoldFont25{
    return [UIFont textBoldFontSize:25];
}
+ (UIFont *)textBoldFont26{
    return [UIFont textBoldFontSize:26];
}
+ (UIFont *)textBoldFont28{
    return [UIFont textBoldFontSize:28];
}
+ (UIFont *)textBoldFont30{
    return [UIFont textBoldFontSize:30];
}
+ (UIFont *)textBoldFont32{
    return [UIFont textBoldFontSize:32];
}
+ (UIFont *)textCustomFont10{
    return [self textFontWithName:customFontName size:10];
}
+ (UIFont *)textCustomFont11{
    return [self textFontWithName:customFontName size:11];
}
+ (UIFont *)textCustomFont12{
    return [self textFontWithName:customFontName size:12];
}
+ (UIFont *)textCustomFont13{
    return [self textFontWithName:customFontName size:13];
}
+ (UIFont *)textCustomFont14{
    return [self textFontWithName:customFontName size:14];
}
+ (UIFont *)textCustomFont15{
    return [self textFontWithName:customFontName size:15];
}
+ (UIFont *)textCustomFont16{
    return [self textFontWithName:customFontName size:16];
}
+ (UIFont *)textCustomFont17{
    return [self textFontWithName:customFontName size:17];
}
+ (UIFont *)textCustomFont18{
    return [self textFontWithName:customFontName size:18];
}
+ (UIFont *)textCustomFont19{
    return [self textFontWithName:customFontName size:19];
}
+ (UIFont *)textCustomFont20{
    return [self textFontWithName:customFontName size:20];
}
+ (UIFont *)textCustomFont21{
    return [self textFontWithName:customFontName size:21];
}
+ (UIFont *)textCustomFont22{
    return [self textFontWithName:customFontName size:22];
}
+ (UIFont *)textCustomFont23{
    return [self textFontWithName:customFontName size:23];
}
+ (UIFont *)textCustomFont24{
    return [self textFontWithName:customFontName size:24];
}
+ (UIFont *)textCustomFont25{
    return [self textFontWithName:customFontName size:25];
}
+ (UIFont *)textCustomFont26{
    return [self textFontWithName:customFontName size:26];
}
+ (UIFont *)textCustomFont27{
    return [self textFontWithName:customFontName size:27];
}
+ (UIFont *)textCustomFont28{
    return [self textFontWithName:customFontName size:28];
}
+ (UIFont *)textCustomFont29{
    return [self textFontWithName:customFontName size:29];
}
+ (UIFont *)textCustomFont30{
    return [self textFontWithName:customFontName size:30];
}
+ (UIFont *)textCustomFont31{
    return [self textFontWithName:customFontName size:31];
}
+ (UIFont *)textCustomFont32{
    return [self textFontWithName:customFontName size:32];
}
+ (UIFont *)textCustomFont34{
    return [self textFontWithName:customFontName size:34];
}

+ (UIFont *)textFontSize:(CGFloat)size{
    return [UIFont textFontWithName:nil size:size];
}
+(UIFont *)textBoldFontSize:(CGFloat)size{
    return [UIFont textFontWithName:nil size:size isBold:YES];
}
+ (UIFont *)textFontWithName:(NSString *)name size:(CGFloat)size{
    return [UIFont textFontWithName:name size:size isBold:NO];
}
+ (UIFont *)textFontWithName:(NSString *)name size:(CGFloat)size isBold:(BOOL)isBold{
    size = size *[UIScreen mainScreen].bounds.size.width / 375.0;
    if(!isBold){//是否加粗
        if([name isEqual:systemFontName] || !name){//系统默认字体
            return [UIFont systemFontOfSize:size];
        }else{
            return [UIFont fontWithName:name size:size];
        }
    }else{
        //加粗目前默认 用系统加粗
        return [UIFont boldSystemFontOfSize:size];
    }
}




@end
