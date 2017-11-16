//
//  LX_TextField.h
//  
//
//  Created by wzh on 16/5/18.
//  Copyright © 2016年 wzh. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZHTextField;
@protocol UITextFieldExtensionDelegate <NSObject>

- (void)textFieldEditingChange:(ZHTextField *)textField;

@end

@interface ZHTextField : UITextField

@property (nonatomic, weak) __weak id<UITextFieldExtensionDelegate>extensonDelegate;

@end
