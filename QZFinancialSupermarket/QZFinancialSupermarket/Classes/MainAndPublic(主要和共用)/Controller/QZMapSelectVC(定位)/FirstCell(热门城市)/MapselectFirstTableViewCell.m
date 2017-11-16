//
//  MapselectFirstTableViewCell.m
//  MapSelectDemo
//
//  Created by Adam on 2017/9/14.
//  Copyright © 2017年 Wuyunlong. All rights reserved.
//

#import "MapselectFirstTableViewCell.h"

#import "MapCityModel.h"

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@implementation MapselectFirstTableViewCell

- (instancetype)initWithHotCityData:(NSArray *)array {
    
    self.hotCitys = array;
    
    return [self initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@""];
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        NSInteger floot = self.hotCitys.count / 3;
        NSInteger others = self.hotCitys.count % 3;
        
        if (others > 0) {
            floot = floot + 1;
        }
        
        for (int i = 0; i<self.hotCitys.count; i++) {
            
            NSInteger xScale = i % 3;
            
            NSInteger yScale = i / 3;
            
            UIButton *hotCityButton = [[UIButton alloc] initWithFrame:CGRectMake(xScale * (17 + 100) * kScaleOfX + 17 * kScaleOfX, yScale * (15 + 37) * kScaleOfX + 15 * kScaleOfX, 100 * kScaleOfX, 37 * kScaleOfX)];
            [self addSubview:hotCityButton];
            hotCityButton.layer.borderWidth = 1;
            hotCityButton.layer.borderColor = UIColorFromRGB(0xf5f5f5).CGColor;
            hotCityButton.tag = 100 + i;
            
            MapHotCity *model = self.hotCitys[i];
            [hotCityButton setTitle:model.name forState:UIControlStateNormal];
            [hotCityButton setTitleColor:UIColorFromRGB(0x333333) forState:UIControlStateNormal];
            
            [hotCityButton addTarget:self action:@selector(cityButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        }
    }
    return self;
}

- (void)cityButtonClick:(UIButton *)sender {
    
    if ([self.delegate respondsToSelector:@selector(citySelect:cityId:)]) {
        
        NSInteger index = sender.tag - 100;
        
        NSString *selectCityName = @"";
        
        NSString *selectCityID = @"";
        
        if (index < self.hotCitys.count) {
            
            MapHotCity *city = self.hotCitys[index];
            
            selectCityName = city.name;
            
            selectCityID = [NSString stringWithFormat:@"%lu", city.Id];
        }
        
        [self.delegate citySelect:selectCityName cityId:selectCityID];
    }
    
}

@end
