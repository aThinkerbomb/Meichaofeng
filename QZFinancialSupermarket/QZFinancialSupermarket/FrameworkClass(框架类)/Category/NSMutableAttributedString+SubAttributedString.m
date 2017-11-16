//
//  NSMutableAttributedString+SubAttributedString.m
//  text
//
//  Created by wzh on 16/5/18.
//  Copyright © 2016年 wzh. All rights reserved.
//

#import "NSMutableAttributedString+SubAttributedString.h"
@implementation NSMutableAttributedString (SubAttributedString)

+ (NSMutableAttributedString *)atttibuteWithStr:(NSString *)str followStr:(NSString *)followStr font:(UIFont *)strFont{
    return [self atttibuteWithStr:str followStr:followStr strColor:nil andFont:strFont];
}

+ (NSMutableAttributedString *)atttibuteWithStr:(NSString *)str followStr:(NSString *)followStr strColor:(UIColor *)strColor{
    return [self atttibuteWithStr:str followStr:followStr strColor:strColor andFont:nil];
}


+ (NSMutableAttributedString *)atttibuteWithStr:(NSString *)str font:(UIFont *)strFont{
    return [self atttibuteWithStr:str followStr:nil strColor:nil andFont:strFont];
}

+ (NSMutableAttributedString *)atttibuteWithStr:(NSString *)str  strColor:(UIColor *)strColor{
    return [self atttibuteWithStr:str followStr:nil strColor:strColor andFont:nil];
}


+ (NSMutableAttributedString *)atttibuteWithStr:(NSString *)str followStr:(NSString *)followStr strColor:(UIColor *)strColor andFont:(UIFont *)strFont{
    NSMutableAttributedString *attStr = [[NSMutableAttributedString alloc] initWithString:str];
    NSRange searchedRange = NSMakeRange(0, [str length]);
    NSString *pattern = @"\\d+";
    NSError *error = nil;
    NSRegularExpression* regex = [NSRegularExpression regularExpressionWithPattern:pattern options:0 error:&error];
    NSArray* matches = [regex matchesInString:str options:0 range: searchedRange];
    for (NSTextCheckingResult* match in matches){
        //带元传
        NSString *matchTextYuan = @"";
        NSString *matchText = @"";
        if(followStr){
            matchText =[str substringWithRange:[match range]];
            matchTextYuan = [[str substringWithRange:[match range]]stringByAppendingString:followStr];
        }else{
            
            matchText =[str substringWithRange:[match range]];
            matchTextYuan = [[str substringWithRange:[match range]]stringByAppendingString:@"元"];

        }
        // 设置颜色
        if(strColor){
            [attStr addAttribute:NSForegroundColorAttributeName
                           value:strColor
                           range:[str rangeOfString:matchText]];
            [attStr addAttribute:NSForegroundColorAttributeName
                           value:strColor
                           range:[str rangeOfString:matchTextYuan]];
        }
        if(strFont){
            [attStr addAttribute:NSFontAttributeName
                           value:strFont
                           range:[str rangeOfString:matchText]];
            [attStr addAttribute:NSFontAttributeName
                           value:strFont
                           range:[str rangeOfString:matchTextYuan]];
        }
    }
    return attStr;
}






+ (NSAttributedString *)attributeWithTotalStr:(NSString *)totalStr
                               andSubStrColor:(UIColor *)subStrColor{
    return [self attributeWithTotalStr:totalStr subStr:totalStr subStrFont:nil andSubStrColor:subStrColor];
    
}

+ (NSAttributedString *)attributeWithTotalStr:(NSString *)totalStr
                                   subStrFont:(UIFont *)subStrFont{
    return [self attributeWithTotalStr:totalStr subStr:totalStr subStrFont:subStrFont andSubStrColor:nil];
}

+ (NSAttributedString *)attributeWithTotalStr:(NSString *)totalStr
                             andWholeTiltSize:(float)wholeTiltSize{
    return [self attributeWithTotalStr:totalStr subStr:totalStr subStrFont:nil subStrColor:nil tiltSize:wholeTiltSize andWhole:YES];
}
+ (NSAttributedString *)attributeWithTotalStr:(NSString *)totalStr
                                  subStrColor:(UIColor *)subStrColor
                             andWholeTiltSize:(float)wholeTiltSize{
    return [self attributeWithTotalStr:totalStr subStr:totalStr subStrFont:nil subStrColor:subStrColor tiltSize:wholeTiltSize andWhole:YES];
}

+ (NSAttributedString *)attributeWithTotalStr:(NSString *)totalStr
                                   subStrFont:(UIFont *)subStrFont
                             andWholeTiltSize:(float)wholeTiltSize{
    return [self attributeWithTotalStr:totalStr subStr:totalStr subStrFont:subStrFont subStrColor:nil tiltSize:wholeTiltSize andWhole:YES];
}

+ (NSAttributedString *)attributeWithTotalStr:(NSString *)totalStr
                                   subStrFont:(UIFont *)subStrFont
                               subStrColor:(UIColor *)subStrColor
                             andWholeTiltSize:(float)wholeTiltSize{
    return [self attributeWithTotalStr:totalStr subStr:totalStr subStrFont:subStrFont subStrColor:subStrColor tiltSize:wholeTiltSize andWhole:YES];
}





+ (NSAttributedString *)attributeWithTotalStr:(NSString *)totalStr
                                       subStr:(NSString *)subStr
                               andSubStrColor:(UIColor *)subStrColor{
    return [self attributeWithTotalStr:totalStr subStr:subStr subStrFont:nil andSubStrColor:subStrColor];
    
}

+ (NSAttributedString *)attributeWithTotalStr:(NSString *)totalStr
                                       subStr:(NSString *)subStr
                                   subStrFont:(UIFont *)subStrFont{
    
    return [self attributeWithTotalStr:totalStr subStr:subStr subStrFont:subStrFont andSubStrColor:nil];
}



+ (NSAttributedString *)attributeWithTotalStr:(NSString *)totalStr
                                       subStr:(NSString *)subStr
                                  subStrFont:(UIFont *)subStrFont
                                     tiltSize:(float)tiltSize{
    return [self attributeWithTotalStr:totalStr subStr:subStr subStrFont:subStrFont subStrColor:nil tiltSize:tiltSize andWhole:NO];

}


+ (NSAttributedString *)attributeWithTotalStr:(NSString *)totalStr
                                       subStr:(NSString *)subStr
                                  subStrFont:(UIFont *)subStrFont
                             andWholeTiltSize:(float)wholeTiltSize{
    return [self attributeWithTotalStr:totalStr subStr:subStr subStrFont:subStrFont subStrColor:nil tiltSize:wholeTiltSize andWhole:YES];
}
+ (NSAttributedString *)attributeWithTotalStr:(NSString *)totalStr
                                       subStr:(NSString *)subStr
                                  subStrColor:(UIColor *)subStrColor
                                     tiltSize:(float)tiltSize{
    return [self attributeWithTotalStr:totalStr subStr:subStr subStrFont:nil subStrColor:subStrColor tiltSize:tiltSize andWhole:NO];

}

+ (NSAttributedString *)attributeWithTotalStr:(NSString *)totalStr
                                       subStr:(NSString *)subStr
                                  subStrColor:(UIColor *)subStrColor
                             andWholeTiltSize:(float)wholeTiltSize{
    return [self attributeWithTotalStr:totalStr subStr:subStr subStrFont:nil subStrColor:subStrColor tiltSize:wholeTiltSize andWhole:YES];
}

+ (NSAttributedString *)attributeWithTotalStr:(NSString *)totalStr
                                       subStr:(NSString *)subStr
                             andWholeTiltSize:(float)wholeTiltSize{
    return [self attributeWithTotalStr:totalStr subStr:subStr subStrFont:nil subStrColor:nil tiltSize:wholeTiltSize andWhole:YES];
    
}
+ (NSAttributedString *)attributeWithTotalStr:(NSString *)totalStr
                                       subStr:(NSString *)subStr
                                     andTiltSize:(float)tiltSize{
    return [self attributeWithTotalStr:totalStr subStr:subStr subStrFont:nil subStrColor:nil tiltSize:tiltSize andWhole:NO];

}


+ (NSAttributedString *)attributeWithTotalStr:(NSString *)totalStr
                                       subStr:(NSString *)subStr
                                     tiltSize:(float)tiltSize
                                     andWhole:(BOOL)whole{
    return [self attributeWithTotalStr:totalStr subStr:subStr subStrFont:nil subStrColor:nil tiltSize:tiltSize andWhole:whole];
}


+ (NSAttributedString *)attributeWithTotalStr:(NSString *)totalStr
                                       subStr:(NSString *)subStr
                                   subStrFont:(UIFont *)subStrFont
                               andSubStrColor:(UIColor *)subStrColor{
    return [self attributeWithTotalStr:totalStr subStr:subStr subStrFont:subStrFont subStrColor:subStrColor andTiltSize:0];
    
    
}

+ (NSAttributedString *)attributeWithTotalStr:(NSString *)totalStr
                                       subStr:(NSString *)subStr
                                   subStrFont:(UIFont *)subStrFont
                                  subStrColor:(UIColor *)subStrColor
                                  andWholeTiltSize:(float)wholeTiltSize{
    return [self attributeWithTotalStr:totalStr subStr:subStr subStrFont:subStrFont subStrColor:subStrColor tiltSize:wholeTiltSize andWhole:YES];

}

+ (NSAttributedString *)attributeWithTotalStr:(NSString *)totalStr
                                       subStr:(NSString *)subStr
                                   subStrFont:(UIFont *)subStrFont
                                  subStrColor:(UIColor *)subStrColor
                                  andTiltSize:(float)tiltSize{
    return [self attributeWithTotalStr:totalStr subStr:subStr subStrFont:subStrFont subStrColor:subStrColor tiltSize:tiltSize andWhole:NO];

}

+ (NSAttributedString *)attributeWithTotalStr:(NSString *)totalStr
                                       subStr:(NSString *)subStr
                                   subStrFont:(UIFont *)subStrFont
                                     tiltSize:(float)tiltSize
                                     andWhole:(BOOL)whole{
    return [self attributeWithTotalStr:totalStr subStr:subStr subStrFont:subStrFont subStrColor:nil tiltSize:tiltSize andWhole:whole];

}

+ (NSAttributedString *)attributeWithTotalStr:(NSString *)totalStr
                                       subStr:(NSString *)subStr
                                  subStrColor:(UIColor *)subStrColor
                                     tiltSize:(float)tiltSize
                                     andWhole:(BOOL)whole{
    return [self attributeWithTotalStr:totalStr subStr:subStr subStrFont:nil subStrColor:subStrColor tiltSize:tiltSize andWhole:whole];
}

+ (NSAttributedString *)attributeWithFirstStr:(NSString *)firstStr
                                       MidStr:(NSString *)subStr
                                      lastStr:(NSString *)lastStr
                                 FirstStrFont:(CGFloat)firstStrFont
                                   MidStrFont:(CGFloat)midStrFont
                                  LastStrFont:(CGFloat)lastStrFont
                                FirstStrColor:(UIColor *)firstStrColor
                                  MidStrColor:(UIColor *)midStrColor
                                 LastStrColor:(UIColor *)lastStrColor{
    
    if(!firstStr)return nil;
    if(!subStr) return nil;
    if (!lastStr) return nil;
    NSMutableAttributedString *attributeStr = [[NSMutableAttributedString alloc] initWithString:firstStr   attributes:@{NSForegroundColorAttributeName:firstStrColor, NSFontAttributeName:[UIFont fontWithName:@"Aileron-Light" size:firstStrFont]}];
    
    NSMutableAttributedString *str1 = [[NSMutableAttributedString alloc] initWithString:subStr   attributes:@{NSForegroundColorAttributeName:midStrColor, NSFontAttributeName:[UIFont fontWithName:@"Aileron-Light" size:midStrFont]}];
    
    NSMutableAttributedString *str2 = [[NSMutableAttributedString alloc] initWithString:lastStr   attributes:@{NSForegroundColorAttributeName:lastStrColor, NSFontAttributeName:[UIFont systemFontOfSize:lastStrFont]}];
    
    [attributeStr appendAttributedString:str1];
    [attributeStr appendAttributedString:str2];
//    NSRange setRange = [totalStr rangeOfString:subStr];
//    if(subStrFont){
//        [attributeStr addAttribute:NSFontAttributeName value:subStrFont range:setRange];
//    }
//    if(subStrColor){
//        [attributeStr addAttribute:NSForegroundColorAttributeName value:subStrColor range:setRange];
//    }
//    if(tiltSize != 0){
//        if(whole){//整体倾斜
//            [attributeStr addAttribute:NSObliquenessAttributeName value:[NSNumber numberWithFloat:tiltSize] range:NSMakeRange(0, totalStr.length)];
//        }else{//小传倾斜
//            [attributeStr addAttribute:NSObliquenessAttributeName value:[NSNumber numberWithFloat:tiltSize] range:setRange];
//        }
//    }
    
    return attributeStr;
}

+ (NSAttributedString *)attributeWithFirstStr:(NSString *)firstStr
                                       SubStr:(NSString *)subStr
                                      LastStr:(NSString *)lastStr
                                 FirstStrFont:(CGFloat)firstStrFont
                                   SubStrFont:(CGFloat)subStrFont
                                  LastStrFont:(CGFloat)lastStrFont
                                FirstStrColor:(UIColor *)firstStrColor
                                  SubStrColor:(UIColor *)subStrColor
                                 LastStrColor:(UIColor *)lastStrColor {
    if(!firstStr)return nil;
    if(!subStr) return nil;
    if (!lastStr) return nil;
    //文字
    NSMutableAttributedString *attributeStr = [[NSMutableAttributedString alloc] initWithString:firstStr   attributes:@{NSForegroundColorAttributeName:firstStrColor, NSFontAttributeName:[UIFont systemFontOfSize:firstStrFont]}];
    
    NSMutableAttributedString *str1 = [[NSMutableAttributedString alloc] initWithString:subStr   attributes:@{NSForegroundColorAttributeName:subStrColor, NSFontAttributeName:[UIFont fontWithName:@"Aileron-Light" size:subStrFont]}];
    
    NSMutableAttributedString *str2 = [[NSMutableAttributedString alloc] initWithString:lastStr   attributes:@{NSForegroundColorAttributeName:lastStrColor, NSFontAttributeName:[UIFont systemFontOfSize:lastStrFont]}];
    
    [attributeStr appendAttributedString:str1];
    [attributeStr appendAttributedString:str2];
    
    return attributeStr;
}

+ (NSAttributedString *)attributeWithFirstStr:(NSString *)firstStr
                                      lastStr:(NSString *)lastStr
                                 FirstStrFont:(CGFloat)firstStrFont
                                  LastStrFont:(CGFloat)lastStrFont
                                FirstStrColor:(UIColor *)firstStrColor
                                 LastStrColor:(UIColor *)lastStrColor{
    
    if(!firstStr)return nil;
    if (!lastStr) return nil;
    NSMutableAttributedString *attributeStr = [[NSMutableAttributedString alloc] initWithString:firstStr   attributes:@{NSForegroundColorAttributeName:firstStrColor, NSFontAttributeName:[UIFont fontWithName:@"Aileron-Light" size:firstStrFont]}];
    
    NSMutableAttributedString *str2 = [[NSMutableAttributedString alloc] initWithString:lastStr   attributes:@{NSForegroundColorAttributeName:lastStrColor, NSFontAttributeName:[UIFont systemFontOfSize:lastStrFont]}];
    
    [attributeStr appendAttributedString:str2];
    
    return attributeStr;
}


+ (NSAttributedString *)attributeWithTotalStr:(NSString *)totalStr
                                       subStr:(NSString *)subStr
                                   subStrFont:(UIFont *)subStrFont
                               subStrColor:(UIColor *)subStrColor
                                     tiltSize:(float)tiltSize
                                     andWhole:(BOOL)whole{
    
    if(!totalStr)return nil;
    if(!subStr) return nil;
    NSMutableAttributedString *attributeStr=  [[NSMutableAttributedString alloc]initWithString:totalStr];
    NSRange setRange = [totalStr rangeOfString:subStr];
    if(subStrFont){
        [attributeStr addAttribute:NSFontAttributeName value:subStrFont range:setRange];
    }
    if(subStrColor){
        [attributeStr addAttribute:NSForegroundColorAttributeName value:subStrColor range:setRange];
    }
    if(tiltSize != 0){
        if(whole){//整体倾斜
            [attributeStr addAttribute:NSObliquenessAttributeName value:[NSNumber numberWithFloat:tiltSize] range:NSMakeRange(0, totalStr.length)];
        }else{//小传倾斜
            [attributeStr addAttribute:NSObliquenessAttributeName value:[NSNumber numberWithFloat:tiltSize] range:setRange];
        }
    }

    return attributeStr;
}

+ (NSAttributedString *)attributeWithTotalStr:(NSString *)totalStr
                                       range:(NSRange)range
                                   subStrFont:(UIFont *)subStrFont{
    
    return [self attributeWithTotalStr:totalStr range:range subStrFont:subStrFont subStrColor:nil tiltSize:0 andWhole:NO];
}


+ (NSAttributedString *)attributeWithTotalStr:(NSString *)totalStr
                                      range:(NSRange)range
                                   subStrFont:(UIFont *)subStrFont
                                  subStrColor:(UIColor *)subStrColor
                                     tiltSize:(float)tiltSize
                                     andWhole:(BOOL)whole{
    
    if(!totalStr)return nil;
    totalStr = [NSString stringWithFormat:@"%@",totalStr];
//    if(!range) return nil;
    NSMutableAttributedString *attributeStr=  [[NSMutableAttributedString alloc]initWithString:totalStr];
//    NSRange setRange = [totalStr rangeOfString:subStr];
    if(subStrFont){
        [attributeStr addAttribute:NSFontAttributeName value:subStrFont range:range];
    }
    if(subStrColor){
        [attributeStr addAttribute:NSForegroundColorAttributeName value:subStrColor range:range];
    }
    if(tiltSize != 0){
        if(whole){//整体倾斜
            [attributeStr addAttribute:NSObliquenessAttributeName value:[NSNumber numberWithFloat:tiltSize] range:NSMakeRange(0, totalStr.length)];
        }else{//小传倾斜
            [attributeStr addAttribute:NSObliquenessAttributeName value:[NSNumber numberWithFloat:tiltSize] range:range];
        }
    }
    
    return attributeStr;
}

+ (NSAttributedString *)attributeWithArray:(NSArray<NSAttributedStringModel *> *)attributeArray{
    NSMutableAttributedString *mutAttbuteStr = [[NSMutableAttributedString alloc]init];
    for (NSAttributedStringModel *attbuteModel in attributeArray) {
        if([ZHTool isNUllOrIsEmptyWith:attbuteModel.string]){
            continue;
        }
        if(!attbuteModel.font){
            continue;
        }
        if(!attbuteModel.color){
            continue;
        }
        [mutAttbuteStr appendAttributedString:[NSMutableAttributedString attributeWithStr:attbuteModel.string strFont:attbuteModel.font strColor:attbuteModel.color]];
        
    }
    return mutAttbuteStr;
}
+ (NSAttributedString *)attributeWithStr:(NSString *)str
                                 strFont:(UIFont *)strFont
                                strColor:(UIColor *)strColor{
    return [self attributeWithTotalStr:str subStr:str subStrFont:strFont andSubStrColor:strColor];
}

@end
