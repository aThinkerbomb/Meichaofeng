//
//  QZUserCenterItem.m
//  
//
//  Created by wzh on 17/3/13.
//
//

#import "QZUserCenterItem.h"

@implementation QZUserCenterItem

- (NSString *)cellClassName{
    return @"QZUserCenterCell";
}
-(CGFloat)cellHeight{
    return 55 * kScaleOfX;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.isArrow = NO;
        self.isHot = NO;
        self.isRedPoint = NO;
        self.isSwitch = NO;
    }
    return self;
}
+ (instancetype)itemWithTitle:(NSString *)title des:(NSString *)des isArraw:(BOOL)isArraw lineType:(QZLineType)lineType showNewVersion:(BOOL)isShow {
    return [self itemWithIcon:nil title:title des:des isArraw:YES lineType:lineType showNewVersion:isShow];
}
+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title lineType:(QZLineType)lineType{
    return [self itemWithIcon:icon title:title des:@"" lineType:lineType];
}

+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title des:(NSString *)des lineType:(QZLineType)lineType{
    return [self itemWithIcon:icon title:title des:des isArraw:YES lineType:lineType showNewVersion:NO];
}
+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title des:(NSString *)des isArraw:(BOOL)isArraw lineType:(QZLineType)lineType showNewVersion:(BOOL)isShow{
    QZUserCenterItem *item = [[self alloc] init];
    item.title = title;
    item.des = des;
    item.icon = icon;
    item.isArrow = isArraw;
    item.lineType = lineType;
    item.showNewVersion = isShow;
    return item;
}
+ (instancetype)itemWithTitle:(NSString *)title des:(NSString *)des isArraw:(BOOL)isArraw lineType:(QZLineType)lineType{
    return [self itemWithIcon:nil title:title des:des lineType:lineType];
}




@end
