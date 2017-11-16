//
//  MapselectTopView.m
//  MapSelectDemo
//
//  Created by Adam on 2017/9/13.
//  Copyright © 2017年 Wuyunlong. All rights reserved.
//

#import "MapselectTopView.h"

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface MapselectTopView ()

@property (nonatomic, strong) UILabel *cityLabel;

@end

@implementation MapselectTopView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIButton *tipTitleButton = [[UIButton alloc] initWithFrame:CGRectMake(14 * kScaleOfX, 10 * kScaleOfX, 110 * kScaleOfX, 15 * kScaleOfX)];
        tipTitleButton.titleLabel.font = [UIFont systemFontOfSize:15];
        [tipTitleButton setTitle:@"您当前的位置" forState:UIControlStateNormal];
        [tipTitleButton setTitleColor:UIColorFromRGB(0x666666) forState:UIControlStateNormal];
        [tipTitleButton setImage:[UIImage imageNamed:@"当前位置"] forState:UIControlStateNormal];
        [self addSubview:tipTitleButton];
        
        CGFloat width = [UIScreen mainScreen].bounds.size.width;
        UIView *selectCityView = [[UIView alloc] initWithFrame:CGRectMake(0, 30 * kScaleOfX, width, 45 * kScaleOfX)];
        selectCityView.backgroundColor = UIColorFromRGB(0xffffff);
        [self addSubview:selectCityView];
        
        UILabel *currentLabel = [[UILabel alloc] initWithFrame:CGRectMake(20 * kScaleOfX, 15 * kScaleOfX, kScreenWidth - 2 * (20 * kScaleOfX), 17 * kScaleOfX)];
        currentLabel.font = [UIFont systemFontOfSize:17];
        [selectCityView addSubview:currentLabel];
        currentLabel.text = @"";
        self.cityLabel = currentLabel;
    }
    return self;
}

- (void)setSelectCityName:(NSString *)selectCityName {
    _selectCityName = selectCityName;
    
    self.cityLabel.text = selectCityName;
}

@end
