//
//  QZBaseViewController.h
//  QZFinancialSupermarket
//
//  Created by wzh on 17/2/27.
//
//

#import <UIKit/UIKit.h>
#import "ZHNavBarView.h"

/**
 *   左部返回按钮图片
 */
typedef NS_ENUM(NSInteger, QZLeftBackImageType) {
    /**
     * 默认 《
     */
    QZLeftBackImageTypeDefaut = 1,
    /**
     *  ×按钮返回
     */
    QZLeftBackImageTypeCloseX,
    /**
     * 箭头返回
     */
    QZLeftBackImageTypeArrowBack,
    
    QZLeftBackImageTypeLoginBack
};
@interface QZBaseViewController : UIViewController
@property (nonatomic, strong) ZHNavBarView *navBarView;
@property (nonatomic, copy) void(^backAction)(id object);

@property (nonatomic, strong) NSMutableArray *dataArray;

// 是否需要网络检测
- (BOOL)isNeedReachibityNetwork;

//调用数据接口
- (void)loadNewData;

//Yes ViewDidLoad  no  viewWillAppear   每个界面请求界面数据用 loadNewData
- (BOOL)viewWillAppearOrviewDidLoad;

- (void)back;
- (void)disMissBack;
- (BOOL)checkInputIsNullOrCorrect;
- (QZLeftBackImageType)leftBackImageType;

- (void)setDefautUI;
// pop 到某个已经存在栈里的Vc
- (void)popToViewController:(Class)controller;

- (BOOL)isLoginStatus;
@end
