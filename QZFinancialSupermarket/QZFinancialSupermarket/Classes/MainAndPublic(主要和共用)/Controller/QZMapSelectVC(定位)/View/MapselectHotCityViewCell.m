//
//  MapselectHotCityViewCell.m
//  MapSelectDemo
//
//  Created by Adam on 2017/9/13.
//  Copyright © 2017年 Wuyunlong. All rights reserved.
//

#import "MapselectHotCityViewCell.h"

@implementation MapselectHotCityViewCell

+ (instancetype)getCellWith:(UITableView *)tableview index:(NSIndexPath *)indexPath {
    
    return [tableview dequeueReusableCellWithIdentifier:@"HotCityView" forIndexPath:indexPath];
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

@end
