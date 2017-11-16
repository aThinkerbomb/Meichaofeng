//
//  ZHAlertView.h
//  QZFinancialSupermarket
//
//  Created by wzh on 2017/8/23.
//
//

#import <UIKit/UIKit.h>

@interface ZHAlertView : UIView
@property (nonatomic, strong) UIView *contentView;

@property (nonatomic, strong) UILabel *titleLab;

@property (nonatomic, strong) UILabel *messageLab;

@property (nonatomic, strong) UILabel *desLab;

@property (nonatomic, strong) UIButton *leftBtn;
@property (nonatomic, strong) UIButton *rightBtn;

@property (nonatomic, copy) void(^leftHandler)();

@property (nonatomic, copy) void(^rightHandler)();

@end
