//
//  QZUserCenterItem.h
//  
//
//  Created by wzh on 17/3/13.
//
//

#import "ZHBaseCellModel.h"

typedef NS_ENUM(NSInteger, QZLineType) {
    QZLineTypeDefaut = 0,
    //上下线都显示 都是长的
    QZLineTypeTopShowBottomShow,
    //上下线都显示 上长下段
    QZLineTypeTopShowBottomShortShow,
    //上隐藏下显示 下长
    QZLineTypeTopHiddenBottomShow,
    //上下都隐藏
    QZLineTypeTopHiddenBottomHidden,
    //上隐藏下显示 下段 == QZLineTypeDefaut
    QZLineTypeTopHiddenBottomShortShow = QZLineTypeDefaut

};
@interface QZUserCenterItem : ZHBaseCellModel

@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *des;
@property (nonatomic, assign) BOOL isArrow;

@property (nonatomic, assign) QZLineType lineType;

@property (nonatomic, assign) BOOL isHot;
@property (nonatomic, assign) BOOL isRedPoint;

@property (nonatomic, assign) BOOL isSwitch;
@property (nonatomic, assign) BOOL showNewVersion;


+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title lineType:(QZLineType)lineType;

+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title des:(NSString *)des lineType:(QZLineType)lineType;

+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title des:(NSString *)des isArraw:(BOOL)isArraw lineType:(QZLineType)lineType showNewVersion:(BOOL)isShow;

+ (instancetype)itemWithTitle:(NSString *)title des:(NSString *)des isArraw:(BOOL)isArraw lineType:(QZLineType)lineType;

+ (instancetype)itemWithTitle:(NSString *)title des:(NSString *)des isArraw:(BOOL)isArraw lineType:(QZLineType)lineType showNewVersion:(BOOL)isShow;


@end
