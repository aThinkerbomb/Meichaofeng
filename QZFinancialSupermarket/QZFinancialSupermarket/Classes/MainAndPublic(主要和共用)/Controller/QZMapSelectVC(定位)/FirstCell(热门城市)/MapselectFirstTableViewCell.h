//
//  MapselectFirstTableViewCell.h
//  MapSelectDemo
//
//  Created by Adam on 2017/9/14.
//  Copyright © 2017年 Wuyunlong. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MapselectCityButtonClickDelegate <NSObject>

@optional

- (void)citySelect:(NSString *)cityName cityId:(NSString *)cityid;

@end

@interface MapselectFirstTableViewCell : UITableViewCell

@property (nonatomic, strong) NSArray *hotCitys;

@property (nonatomic, assign) id<MapselectCityButtonClickDelegate> delegate;

- (instancetype)initWithHotCityData:(NSArray *)array;

@end
