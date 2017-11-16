//
//  QZAlertTool.h
//  QZFinancialSupermarket
//
//  Created by wzh on 17/3/7.
//
//

#import <Foundation/Foundation.h>
#import "ZHAlertView.h"
@interface ZHAlertTool : NSObject

+ (UIAlertController *)alertCancelMesasge:(NSString *)message nextHandler:(void(^)())nextHandler;
+ (UIAlertController *)alertCancelMesasgeWithTitle:(NSString *)title mesasge:(NSString *)message nextHandler:(void(^)())nextHandler;
+ (UIAlertController *)alertMesasge:(NSString *)message nextHandler:(void(^)())nextHandler;
+ (UIAlertController *)alertMesasgeWithTitle:(NSString *)title mesasge:(NSString *)message nextHandler:(void(^)())nextHandler;

+ (UIAlertController *)alertCancelMesasge:(NSString *)message;
+ (UIAlertController *)alertCancelMesasgeWithTitle:(NSString *)title  mesasge:(NSString *)message;


/**
 *  单按钮弹框
 *
 *  @param message     描述
 *  -------------------默认 没有弹框描述 按钮标题确定 按钮事件《diss》 默认程序根视图 默认没有标题
 *  @return 单按钮弹框VC
 */
+ (UIAlertController *)alertMesasge:(NSString *)message;

/**
 *  单按钮弹框
 *
 *  @param title       标题
 *  @param message     描述
 *  -------------------默认 没有弹框描述 按钮标题确定 按钮事件《diss》 默认程序根视图
 *  @return 单按钮弹框VC
 */
+ (UIAlertController *)alertRightDetermineWithTitle:(NSString *)title  mesasge:(NSString *)message;


/**
 *  单按钮弹框
 *
 *  @param title       标题
 *  @param message     描述
 *  @param vc          弹出承载VC
 *  -------------------默认 没有弹框描述 按钮标题确定 按钮事件《diss》
 *  @return 单按钮弹框VC
 */
+ (UIAlertController *)alertOneDetermineWithTitle:(NSString *)title  mesasge:(NSString *)message viewContrller:(UIViewController*)vc;
/**
 *  单按钮弹框
 *
 *  @param title       标题
 *  @param message     描述
 *  @param nextTitle   按钮标题
 *  @param vc          弹出承载VC
 *  -------------------默认 没有弹框描述 按钮标题自定义  按钮事件《diss》
 *  @return 单按钮弹框VC
 */
+ (UIAlertController *)alertOneEventDissWithTitle:(NSString *)title  mesasge:(NSString *)message nextTitle:(NSString *)nextTitle viewContrller:(UIViewController*)vc;


/**
 *  单按钮弹框
 *
 *  @param title       标题
 *  @param message     描述
 *  @param nextTitle   按钮标题
 *  @param nextHandler 按钮事件
 *  @param vc          弹出承载VC
 *
 *  @return 单按钮弹框VC
 */
+ (UIAlertController *)alertOneTitle:(NSString *)title  mesasge:(NSString *)message nextTitle:(NSString *)nextTitle nextHandler:(void(^)())nextHandler viewContrller:(UIViewController*)vc;


/**
 *  双按钮弹框
 *
 *  @param title        标题
 *  @param rightTitle   右边按钮描述
 *  @param rightHandler 右边按钮事件
 *  @param vc           弹出承载VC
 *  --------------------默认 没有弹框描述 左部按钮为《取消》 左部按钮事件《diss》
 *  @return 双按钮弹框VC
 */
+ (UIAlertController *)alertLeftCancelWithTitle:(NSString *)title  rightTitle:(NSString *)rightTitle rightHandler:(void (^)())rightHandler viewContrller:(UIViewController*)vc;

/**
 *  双按钮弹框
 *
 *  @param title        标题
 *  @param leftTitle    左部按钮描述
 *  @param rightTitle   右边按钮描述
 *  @param leftHandler  左部按钮事件
 *  @param rightHandler 右边按钮事件
 *  @param vc           弹出承载VC
 *  --------------------默认 没有弹框描述
 *  @return 双按钮弹框VC
 */
+ (UIAlertController *)alertTitle:(NSString *)title leftTitle:(NSString *)leftTitle rightTitle:(NSString *)rightTitle leftHandler:(void (^)())leftHandler rightHandler:(void (^)())rightHandler viewContrller:(UIViewController*)vc;


/**
 *
 *
 *  @param title        标题
 *  @param message      描述
 *  @param cancelHandler  左部按钮事件
 *  @param confirmHandler 右边按钮事件
 *  @param vc           弹出承载VC
 *  ---------------------默认  左部按钮为《取消》事件自定义  右边按钮 《确定》事件自定义
 *  @return 双按钮弹框VC
 */
+ (UIAlertController *)alertLeftCancelAndRightDetermineWithTitle:(NSString *)title mesasge:(NSString *)message cancelHandler:(void (^)())cancelHandler confirmHandler:(void (^)())confirmHandler viewContrller:(UIViewController*)vc;


/**
 *
 *
 *  @param title        标题
 *  @param message      描述
 *  @param rightHandler 右边按钮事件
 *  @param vc           弹出承载VC
 *  ---------------------默认  左部按钮为《取消》 左部按钮事件《diss》  右边按钮 《确定》 事件自定义
 *  @return 双按钮弹框VC
 */
+ (UIAlertController *)alertLeftCancelAndRightDetermineWithTitle:(NSString *)title mesasge:(NSString *)message rightHandler:(void (^)())rightHandler viewContrller:(UIViewController*)vc;


/**
 *  双按钮弹框
 *
 *  @param title        标题
 *  @param message      描述
 *  @param rightTitle   右边按钮描述
 *  @param rightHandler 右边按钮事件
 *  @param vc           弹出承载VC
 *  --------------------默认左部按钮为《取消》 左部按钮事件《diss》
 *  @return 双按钮弹框VC
 */
+ (UIAlertController *)alertLeftCancelWithTitle:(NSString *)title mesasge:(NSString *)message  rightTitle:(NSString*)rightTitle rightHandler:(void(^)())rightHandler  viewContrller:(UIViewController*)vc;


/**
 *  双按钮弹框
 *
 *  @param title        标题
 *  @param message      描述
 *  @param leftTitle    左部按钮描述
 *  @param rightTitle   右边按钮描述
 *  @param leftHandler  左部按钮事件
 *  @param rightHandler 右边按钮事件
 *  --------------------承载VC 默认程序根视图
 *  @return 双按钮弹框VC
 */
+(UIAlertController *)alertTitle:(NSString *)title mesasge:(NSString *)message leftTitle:(NSString*)leftTitle rightTitle:(NSString*)rightTitle leftHandler:(void(^)())leftHandler rightHandler:(void(^)())rightHandler;
/**
 *  双按钮弹框
 *
 *  @param title        标题
 *  @param message      描述
 *  @param leftTitle    左部按钮描述
 *  @param rightTitle   右边按钮描述
 *  @param leftHandler  左部按钮事件
 *  @param rightHandler 右边按钮事件
 *  @param vc           弹出承载VC
 *
 *  @return 双按钮弹框VC
 */
+ (UIAlertController *)alertTitle:(NSString *)title mesasge:(NSString *)message leftTitle:(NSString*)leftTitle rightTitle:(NSString*)rightTitle leftHandler:(void(^)())leftHandler rightHandler:(void(^)())rightHandler viewContrller:(UIViewController*)vc;




+ (UIAlertController *)alertCallTelWithCancelHandler:(void(^)())cancelHandler callHandler:(void(^)())callHandler viewContrller:(UIViewController*)vc;


+ (ZHAlertView *)showCallTelAlertView:(UIView *)containerView leftHandler:(void(^)())leftHandler rightHandler:(void(^)())rightHandler animated:(BOOL)animated;

+ (ZHAlertView *)showCallTelAlertView:(UIView *)containerView  animated:(BOOL)animated;


//+ (UIAlertController *)alertWithConfirmTitle:(NSString *)title mesasge:(NSString *)message;
//+ (UIAlertController *)alertWithConfirmTitle:(NSString *)title mesasge:(NSString *)message  nextHandler:(void(^)())nextHandler;
//
//+ (UIAlertController *)alertTitle:(NSString *)title mesasge:(NSString *)message nextTitle:(NSString*)nextTitle  nextHandler:(void(^)())nextHandler;
//+ (UIAlertController *)alertTitle:(NSString *)title mesasge:(NSString *)message nextTitle:(NSString*)nextTitle  nextHandler:(void(^)())nextHandler  viewContrller:(UIViewController*)vc;



@end
