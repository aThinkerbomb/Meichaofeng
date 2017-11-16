//
//  LocationManager.m
//  ABAProgram
//
//  Created by 张宇轩 on 2017/7/23.
//  Copyright © 2017年 宇轩. All rights reserved.
//

#import "LocationManager.h"


@interface LocationManager ()<CLLocationManagerDelegate>

/**
 定位管理器
 */
@property (nonatomic, strong) CLLocationManager * locationManager;

/**
 地理编码
 */
@property (nonatomic, strong) CLGeocoder      * geocoder;

@property (nonatomic, copy) LocationComplete locationComplete;
@end


@implementation LocationManager

+ (instancetype)ShareLocation {
    
    static LocationManager *manager = nil;
    
    static dispatch_once_t oneceToken;
    
    dispatch_once(&oneceToken, ^{
        
        manager = [[LocationManager alloc] init];
    
    });
    
    return manager;
    
}

- (instancetype)init {
    
    self = [super init];
    if (self) {
        
        self.locationManager = [[CLLocationManager alloc] init];
        self.locationManager.delegate = self;
        
        // 开启一直定位
        [self.locationManager requestAlwaysAuthorization];
        
        // 开启前台定位
        [self.locationManager requestWhenInUseAuthorization];
        
        // 最精准
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        
        // 水平距离5米以内不更新  5米以外才更新
        self.locationManager.distanceFilter = 5.0;
        
        // 开启定位服务
        [self.locationManager startUpdatingLocation];
        
        // 初始化地理编码
        self.geocoder = [[CLGeocoder alloc] init];
        
    }
    return self;
    
}

// 定位成功
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    
    // 停止方向
    [self.locationManager stopUpdatingHeading];
    
    // 通常为了节省电量和资源损耗，在获取到位置以后选择停止定位服务
    [self.locationManager stopUpdatingLocation];
    
    // 获取定位信息
    CLLocation *currentLocation = [locations lastObject];
    CGFloat longitude = currentLocation.coordinate.longitude;
    CGFloat latitude  = currentLocation.coordinate.latitude;
    
    
    // 反地理编码
    CLLocation *location = [[CLLocation alloc] initWithLatitude:latitude longitude:longitude];
    [self.geocoder reverseGeocodeLocation:location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        
        if (error || placemarks.count == 0) {
            [self showHint_object:@"定位失败"];
        } else {
            CLPlacemark *placemark = [placemarks lastObject];
            if (self.locationComplete) {
                self.locationComplete(YES, placemark);
            }
        }
        
    }];
    
    
}

// 定位失败
- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    // 通常为了节省电量和资源损耗，在获取到位置以后选择停止定位服务
    [self.locationManager stopUpdatingLocation];
    if (self.locationComplete) {
        self.locationComplete(NO, nil);
    }
    
    
}

// 定位状态改变
- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
    // 4.开始定位
    [self.locationManager startUpdatingLocation];
    
    
}


- (void)beginLocation:(LocationComplete)complete {
    if (complete) {
        self.locationComplete = complete;
    }
}









@end
