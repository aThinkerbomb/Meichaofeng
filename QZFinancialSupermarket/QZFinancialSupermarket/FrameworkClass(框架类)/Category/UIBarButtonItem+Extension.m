//
//  UIBarButtonItem+Extension.m
//  QZFinancialSupermarket
//
//  Created by wzh on 17/3/6.
//
//

#import "UIBarButtonItem+Extension.h"

@implementation UIBarButtonItem (Extension)
+ (UIBarButtonItem *)itemWithBgImageName:(NSString *)bgImageName target:(id)target action:(SEL)action{
    return [self itemWithBgImage:bgImageName bgHighImage:nil target:target action:action];
}
+ (instancetype)itemWithBgImage:(NSString *)bgImageName bgHighImage:(NSString *)bgHighImage target:(id)target action:(SEL)action{
    
    return [self itemWithImage:nil highImage:nil bgImage:bgImageName bgHighImage:bgHighImage frame:CGRectZero title:nil titleAlignment:NSTextAlignmentCenter  titleFont:nil titleColor:nil  titleEdgeInsets:UIEdgeInsetsZero imageEdgeInsets:UIEdgeInsetsZero target:target action:action];
}

+ (UIBarButtonItem *)itemWithImageName:(NSString *)imageName target:(id)target action:(SEL)action{
    return [self itemWithImage:imageName highImage:nil target:target action:action];
}
+ (instancetype)itemWithImage:(NSString *)image highImage:(NSString *)highImage target:(id)target action:(SEL)action{
    return [self itemWithImage:image highImage:highImage title:nil target:target action:action];
}

+ (instancetype)itemWithImage:(NSString *)image highImage:(NSString *)highImage title:(NSString *)title target:(id)target action:(SEL)action{
    return [self itemWithImage:image highImage:highImage bgImage:nil bgHighImage:nil frame:CGRectZero title:nil titleAlignment:NSTextAlignmentCenter  titleFont:nil titleColor:nil titleEdgeInsets:UIEdgeInsetsZero imageEdgeInsets:UIEdgeInsetsZero target:target action:action];
}




+ (UIBarButtonItem *)itemWithTitle:(NSString *)title target:(id)target action:(SEL)action{
    return [self itemWithTitle:title font:nil titleColor:nil target:target action:action];
}
+ (UIBarButtonItem *)itemWithTitle:(NSString *)title font:(UIFont *)font titleColor:(UIColor *)titleColor target:(id)target action:(SEL)action{
    return [self itemWithTitle:title font:font titleColor:titleColor titleEdgeInsets:UIEdgeInsetsZero target:target action:action];
}
+ (UIBarButtonItem *)itemWithTitle:(NSString *)title font:(UIFont *)font titleColor:(UIColor *)titleColor titleEdgeInsets:(UIEdgeInsets)titleEdgeInsets target:(id)target action:(SEL)action{
    return [self itemWithImage:nil highImage:nil bgImage:nil bgHighImage:nil frame:CGRectZero title:title titleAlignment:NSTextAlignmentCenter titleFont:font titleColor:titleColor titleEdgeInsets:titleEdgeInsets imageEdgeInsets:UIEdgeInsetsZero target:target action:action];
}
+ (UIBarButtonItem *)itemWithTitle:(NSString *)title font:(UIFont *)font titleColor:(UIColor *)titleColor titleAlignment:(NSTextAlignment)titleAlignment target:(id)target action:(SEL)action{
    return [self itemWithImage:nil highImage:nil bgImage:nil bgHighImage:nil frame:CGRectZero title:title titleAlignment:titleAlignment titleFont:nil titleColor:titleColor titleEdgeInsets:UIEdgeInsetsZero imageEdgeInsets:UIEdgeInsetsZero target:target action:action];
}


+ (UIBarButtonItem *)itemWithImage:(NSString *)image highImage:(NSString *)highImage bgImage:(NSString *)bgImage bgHighImage:(NSString *)bgHighImage frame:(CGRect)frame title:(NSString *)title titleAlignment:(NSTextAlignment)titleAlignment titleFont:(UIFont *)font titleColor:(UIColor *)titleColor titleEdgeInsets:(UIEdgeInsets)titleEdgeInsets imageEdgeInsets:(UIEdgeInsets)imageEdgeInsets target:(id)target action:(SEL)action{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectZero;
    btn.titleLabel.textAlignment = titleAlignment;
    
    if(image){
        [btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    }
    if(highImage){
        [btn setImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
    }
    
    if(bgImage){
        [btn setBackgroundImage:[UIImage zhImageWithName:bgImage] forState:UIControlStateNormal];
    }
    
    if(bgHighImage){
        [btn setBackgroundImage:[UIImage zhImageWithName:bgHighImage] forState:UIControlStateHighlighted];
    }
    
    if(font){
        btn.titleLabel.font = font;
    }
    
    if(title){
        [btn setTitle:title forState:UIControlStateNormal];
    }
    if(titleColor){
        [btn setTitleColor:titleColor forState:UIControlStateNormal];
    }

    if(!UIEdgeInsetsEqualToEdgeInsets(titleEdgeInsets, UIEdgeInsetsZero)){
        [btn setTitleEdgeInsets:titleEdgeInsets];
    }
    
    if(!UIEdgeInsetsEqualToEdgeInsets(imageEdgeInsets, UIEdgeInsetsZero)){
        [btn setImageEdgeInsets:imageEdgeInsets];
    }
    if(!CGRectEqualToRect(CGRectZero, frame)){
        btn.frame = frame;
    }else{
        if(bgImage){
            btn.size = btn.currentBackgroundImage.size;
        }
        if(image){
            btn.size = btn.currentImage.size;
        }
        if(CGRectEqualToRect(CGRectZero, btn.frame)){
            [btn sizeToFit];
        }
        
    }
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}


@end
