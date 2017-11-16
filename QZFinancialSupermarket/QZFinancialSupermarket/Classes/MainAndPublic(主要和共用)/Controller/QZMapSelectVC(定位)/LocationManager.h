//
//  LocationManager.h
//  ABAProgram
//
//  Created by 张宇轩 on 2017/7/23.
//  Copyright © 2017年 宇轩. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

typedef void(^LocationComplete)(BOOL isSuccess, CLPlacemark *placemark);

@interface LocationManager : NSObject
/**
 开启定位

 @return 开启定位
 */
+ (instancetype)ShareLocation;
- (void)beginLocation:(LocationComplete)complete;
@end
