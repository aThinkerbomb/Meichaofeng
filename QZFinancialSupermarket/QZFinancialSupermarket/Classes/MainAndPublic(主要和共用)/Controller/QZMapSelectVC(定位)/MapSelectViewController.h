//
//  MapSelectViewController.h
//  MapSelectDemo
//
//  Created by Adam on 2017/9/13.
//  Copyright © 2017年 Wuyunlong. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol SLCityListViewControllerDelegate <NSObject>

- (void)sl_cityListSelectedCity:(NSString *)selectedCity Id:(NSInteger)Id;

@end

@interface MapSelectViewController : QZBaseViewController

/** 代理 */
@property (weak, nonatomic) id<SLCityListViewControllerDelegate> delegate;

@end
