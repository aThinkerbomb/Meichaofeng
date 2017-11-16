//
//  UIButton+Extension.m
//  QZFinancialSupermarket
//
//  Created by wzh on 17/3/20.
//
//

#import "UIButton+Extension.h"

@implementation UIButton (Extension)
- (void)backgroundColor:(UIColor *)backgroundColor title:(NSString *)title titleColor:(UIColor *)titleColor imageName:(NSString *)imageName titleFont:(UIFont *)font{
    if(backgroundColor){
        self.backgroundColor = backgroundColor;
    }
    if(title){
        [self setTitle:title forState:UIControlStateNormal];
    }
    if(titleColor){
        [self setTitleColor:titleColor forState:UIControlStateNormal];
    }
    if(imageName){
        UIImage *image = [UIImage imageNamed:imageName];
        [self setImage:image forState:UIControlStateNormal];
    }
    if(font){
        self.titleLabel.font = font;
    }

}
- (void)title:(NSString *)title imageName:(NSString *)imageName titleFont:(UIFont *)font{
    [self backgroundColor:nil title:title titleColor:nil imageName:imageName titleFont:font];
}
- (void)title:(NSString *)title titleColor:(UIColor *)titleColor titleFont:(UIFont *)font{
    [self backgroundColor:nil title:title titleColor:titleColor imageName:nil titleFont:font];
}

- (void)title:(NSString *)title titleFont:(UIFont *)font{
    [self title:title imageName:nil titleFont:font];
}
- (void)title:(NSString *)title titleColor:(UIColor *)titleColor backgroundColor:(UIColor *)backgroundColor{
    [self backgroundColor:backgroundColor title:title titleColor:titleColor imageName:nil titleFont:nil];
}
- (void)title:(NSString *)title titleColor:(UIColor *)titleColor
    imageName:(NSString *)imageName titleFont:(UIFont *)font{
    [self backgroundColor:nil title:title titleColor:titleColor imageName:imageName titleFont:font];
}
- (void)title:(NSString *)title titleColor:(UIColor *)titleColor titleFont:(UIFont *)font backgroundColor:(UIColor *)backgroundColor{
    [self backgroundColor:backgroundColor title:title titleColor:titleColor imageName:nil titleFont:font];
}


@end
