//
//  UILabel+Extension.m
//  QZFinancialSupermarket
//
//  Created by wzh on 17/3/20.
//
//

#import "UILabel+Extension.h"

@implementation UILabel (Extension)
- (void)text:(NSString *)text backgroundColor:(UIColor *)backgroundColor textColor:(UIColor *)textColor textFont:(UIFont *)font{
    [self text:text backgroundColor:backgroundColor  textColor:textColor textFont:font attributedText:nil lineSpacing:-1];
}
- (void)text:(NSString *)text textColor:(UIColor *)textColor textFont:(UIFont *)font{
    [self text:text backgroundColor:nil textColor:textColor textFont:font];
}

- (void)text:(NSString *)text textFont:(UIFont *)font{
    [self text:text backgroundColor:nil textColor:nil textFont:font];
}
- (void)textColor:(UIColor *)textColor textFont:(UIFont *)font{
    [self text:nil backgroundColor:nil textColor:textColor textFont:font];
}



- (void)attributedText:(NSString *)attributedText textColor:(UIColor *)textColor textFont:(UIFont *)font lineSpacing:(CGFloat)lineSpacing{
    [self text:nil backgroundColor:nil  textColor:textColor textFont:font attributedText:attributedText lineSpacing:lineSpacing];
}
- (void)attributedText:(NSString *)attributedText textColor:(UIColor *)textColor textFont:(UIFont *)font{
    [self text:nil backgroundColor:nil  textColor:textColor textFont:font attributedText:attributedText lineSpacing:-1];
}
- (void)lineSpacing:(CGFloat)lineSpacing{
    [self attributedText:[self.attributedText string] textColor:self.textColor textFont:self.font lineSpacing:lineSpacing];
}



- (void)attributedText:(NSString *)attributedText subText:(NSString *)subText subTextColor:(UIColor *)subTextColor  textColor:(UIColor *)textColor textFont:(UIFont *)font lineSpacing:(CGFloat)lineSpacing{
    self.tintColor = [UIColor redColor];
}
- (void)text:(NSString *)text backgroundColor:(UIColor *)backgroundColor textColor:(UIColor *)textColor textFont:(UIFont *)font attributedText:(NSString *)attributedText lineSpacing:(CGFloat)lineSpacing{
    if(backgroundColor){
        self.backgroundColor = backgroundColor;
    }
    if(text){
        self.text = text;
    }
    if(textColor){
        self.textColor = textColor;
    }
    if(font){
        self.font = font;
    }
    
    if(attributedText){
        NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:attributedText];
        if(lineSpacing > 0){
            NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
            [paragraphStyle setLineSpacing:lineSpacing];
            [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [attributedText length])];
        }
        [self setAttributedText:attributedString];
    }
}

- (void)setLineSpace:(CGFloat)lineSpace string:(NSString *)string{
    self.attributedText = [self getAttributedStringWithLineSpace:lineSpace kern:-1 string:string];
}
- (void)setLineSpace:(CGFloat)lineSpace{
    self.attributedText = [self getAttributedStringWithLineSpace:lineSpace kern:-1 string:self.text];
}
- (NSAttributedString*)getAttributedStringWithLineSpace:(CGFloat)lineSpace kern:(CGFloat)kern string:(NSString *)string{
    
    if(!string){
        string = @"";
    }
    NSMutableParagraphStyle*paragraphStyle = [NSMutableParagraphStyle new];
    
    NSMutableDictionary *mutDic = [NSMutableDictionary dictionary];
    if(lineSpace > 0){
        //调整行间距
        paragraphStyle.lineSpacing= lineSpace;
        [mutDic setObject:paragraphStyle forKey:NSParagraphStyleAttributeName];
    }
    if(kern > 0){
        [mutDic setObject:@(kern) forKey:NSKernAttributeName];
    }
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]initWithString:string attributes:mutDic];
    return attributedString;
}

- (void)setHeadIndentSpace:(CGFloat)IndentSpace {
    
    NSString *string = self.text;
    if (!string) {
        string = @"";
    }
    
    NSMutableParagraphStyle * paragraphStyle = [NSMutableParagraphStyle new];

    paragraphStyle.firstLineHeadIndent = IndentSpace;
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setValue:paragraphStyle forKey:NSParagraphStyleAttributeName];
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:string attributes:dic];
    
    
    self.attributedText = attributedString;
}

@end
