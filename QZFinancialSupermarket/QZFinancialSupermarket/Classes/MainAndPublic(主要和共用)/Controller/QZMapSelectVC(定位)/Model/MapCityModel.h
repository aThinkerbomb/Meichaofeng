//
//  MapCityModel.h
//  MapSelectDemo
//
//  Created by Adam on 2017/9/13.
//  Copyright © 2017年 Wuyunlong. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MapHotCity;
@class MapCityList;

@interface MapCityModel : NSObject

/** 热门城市 */
@property (strong, nonatomic) NSMutableArray<MapHotCity *> *hotCity;
/** 城市列表 */
@property (strong, nonatomic) NSMutableArray<MapCityList *> *list;

- (instancetype)initWithDicitionary:(NSDictionary *)dic;

@end


@interface MapCityList : NSObject
/** 城市数组 */
@property (strong, nonatomic) NSMutableArray<MapHotCity *> *citys;

/** 首字母 */
@property (strong, nonatomic) NSString *initial;

- (instancetype)initWithDicitionary:(NSDictionary *)dic;

@end


@interface MapHotCity : NSObject

@property (strong, nonatomic) NSString *domain;
/** 城市 */
@property (strong, nonatomic) NSString *name;
/** ID */
@property (assign, nonatomic) NSInteger Id;
/** 是否被选中 */
@property (assign, nonatomic, getter=isSelected) BOOL selected;
@end
