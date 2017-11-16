//
//  MapCityModel.m
//  MapSelectDemo
//
//  Created by Adam on 2017/9/13.
//  Copyright © 2017年 Wuyunlong. All rights reserved.
//

#import "MapCityModel.h"

@implementation MapCityModel

- (instancetype)initWithDicitionary:(NSDictionary *)dic {
    
    if (dic) {
        NSArray *hotCityArr = dic[@"hotCity"];
        self.hotCity = [NSMutableArray array];
        for (int i = 0; i<hotCityArr.count; i++) {
            MapHotCity *hotCityModel = [MapHotCity new];
            [hotCityModel setValuesForKeysWithDictionary:hotCityArr[i]];
            [self.hotCity addObject:hotCityModel];
        }
        
        NSArray *cityListArr = dic[@"list"];
        self.list = [NSMutableArray array];
        for (int i = 0; i<cityListArr.count; i++) {
            MapCityList *cityListModel = [MapCityList new];
            cityListModel = [cityListModel initWithDicitionary:cityListArr[i]];
            [self.list addObject:cityListModel];
        }
    }
    
    return self;
}

@end

@implementation MapCityList

- (instancetype)initWithDicitionary:(NSDictionary *)dic {
    if (dic) {
        NSArray *hotCityArr = dic[@"citys"];
        self.citys = [NSMutableArray array];
        for (int i = 0; i<hotCityArr.count; i++) {
            MapHotCity *hotCityModel = [MapHotCity new];
            [hotCityModel setValuesForKeysWithDictionary:hotCityArr[i]];
            [self.citys addObject:hotCityModel];
        }
        
        self.initial = dic[@"initial"];
    }
    
    return self;
}

@end

@implementation MapHotCity



@end
