//
//  LX_TextField.m
//  
//
//  Created by wzh on 16/5/18.
//  Copyright © 2016年 wzh. All rights reserved.
//

#import "ZHTextField.h"

@implementation ZHTextField

- (instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        [self setUI];
    }
    return self;
}
- (id)initWithCoder:(NSCoder *)decoder
{
    if (self = [super initWithCoder:decoder]) {
        
        [self setUI];
    }
    return self;
}
- (void)setUI{
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldEditingChange:) name:UITextFieldTextDidChangeNotification object:self];
    [self addTarget:self action:@selector(textFieldEditingChange:) forControlEvents:UIControlEventEditingChanged];
//    [self setValue:CommonGrayTextColor forKeyPath:@"_placeholderLabel.textColor"];

}
//- (void)dealloc
//{
//    [[NSNotificationCenter defaultCenter] removeObserver:self];
//}

- (void)textFieldEditingChange:(UITextField *)textField{
    if(self.extensonDelegate  && [self.extensonDelegate respondsToSelector:@selector(textFieldEditingChange:)]){
        [self.extensonDelegate performSelector:@selector(textFieldEditingChange:) withObject:self];
    }//外面响应代理
}
@end
