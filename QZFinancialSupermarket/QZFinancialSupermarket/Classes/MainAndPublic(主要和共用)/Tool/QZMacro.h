//
//  QZMacro.h
//  QZFinancialSupermarket
//
//  Created by wzh on 17/2/27.
//
//

#ifndef QZMacro_h
#define QZMacro_h

#import <SDWebImage/UIButton+WebCache.h>

#define BaseUrlKey @"YX_BaseURL_Key"
#define BaseUrlImageKey @"YX_BaseURL_Image_Key"
/*
 测试地址：连接 http://192.168.1.31:8081/
         图片 http://donlad.ufile.ucloud.com.cn
 正式地址：连接 http://106.75.18.183/
         图片 http://donlad.ufile.ucloud.com.cn
 */

#define BaseUrl   [QZConfig getBaseUrlConfigure]
#define ImageUrl  [QZConfig getImageBaseUrlConfigure]

// 表示一个cell中有多个模型
#define Single @"single"

// 表示是否可以升级新版本 YES/1 - 升级  NO／0 - 不升级
#define ShouldUpdateVersion @"Should"

// 作为一个通知的name，表示弹出推荐活动页的key
#define ShowRecommendActivityName @"ShowRecommendActivityName"

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define kScaleOfX kScreenWidth / 375.0 // 6宽度缩放比例

// 宏定义做数据运算一定要注意数据独立性
#define kNavBarAndStatusBarHeight  ((kDevice_Is_iPhoneX) ? (88) : (64))
#define kTabBarHeigth  ((kDevice_Is_iPhoneX) ? (83) : (49))
#define kStatusBarHeight ((kDevice_Is_iPhoneX) ? (44) : (20))

#define kIphone4x_3_5 ([UIScreen mainScreen].bounds.size.height==480.0f)
#define kIphone5x_4_0 ([UIScreen mainScreen].bounds.size.height==568.0f)
#define kIphone6_4_7 ([UIScreen mainScreen].bounds.size.height==667.0f)
#define kIphone6Plus_5_5 ([UIScreen mainScreen].bounds.size.height==736.0f || [UIScreen mainScreen].bounds.size.height==414.0f)

#define kUIImageNamed(imageName) [UIImage imageNamed:(imageName)]
#define kDevice_Is_iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)


#define PlaceholderMax  [UIImage imageNamed:@"placeholderMax"]
#define PlaceholderMin  [UIImage imageNamed:@"placeholderMin"]


//赋值
#define kSetObjectForKey(object,key) [[NSUserDefaults standardUserDefaults]setObject:object forKey:key]; \
[[NSUserDefaults standardUserDefaults] synchronize];
//取值
#define kGetObjectForKey(key) [[NSUserDefaults standardUserDefaults]objectForKey:key]; \
[[NSUserDefaults standardUserDefaults] synchronize]

//移除值
#define kRemoveObjectForKey(key)  [[NSUserDefaults standardUserDefaults] removeObjectForKey:(key)]


#define kUIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]   //颜色
#define kUIColorFromRGBalpha(rgbValue,a) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:a]   //颜色


#define iOS7 ([[UIDevice currentDevice].systemVersion doubleValue] >= 7.0)
#define iOS8 ([[UIDevice currentDevice].systemVersion doubleValue] >= 8.0)
#define iOS9 [[UIDevice currentDevice].systemVersion floatValue] >= 9.0
#define iOS9WithLessThan ([[UIDevice currentDevice].systemVersion doubleValue] < 9.0)
#define IOS11 @available(iOS 11.0, *)
//#define iOS11 ([UIDevice currentDevice].systemVersion.floatValue >= 11.0) //据说有警告


#define kRadiusWidthWithBtn 4 *kScaleOfX

#define kRadiusWidth 5 * kScaleOfX
#define QZRootVC ((QZTabBarController *)[[[UIApplication sharedApplication].delegate window] rootViewController])
#define QZAPPDelegate [UIApplication sharedApplication].delegate

#define HUDTime 1

#define QZUserid @"userid"
#define QZToken  @"token"
#define QZPhone  @"phone"



#import "UIView+Extension.h"
#import "UIView+LayerStyle.h"
#import "UIColor+Extension.h"
#import "UIImage+Extension.h"
#import "CALayer+Animation.h"
#import "NSObject+ToDealWithTool.h"
#import "UIButton+ImageTitleSpacing.h"
#import "UIBarButtonItem+Extension.h"
#import "UIImage+Extension.h"
#import "UIColor+UsedColor.h"
#import "UIFont+UsedFont.h"
#import "NSString+Tool.h"
#import "UIViewController+HUD.h"
#import "NSObject+HUD.h"
#import "NSObject+SVPHUD.h"
#import "NSDate+Extension.h"
#import "UILabel+Extension.h"
#import "UIButton+Extension.h"
#import "AFHTTPSessionManager+Extension.h"
#import "NSMutableAttributedString+SubAttributedString.h"



#import "QZTableBaseViewController.h"
#import "QZBaseWebViewController.h"
#import "QZTabBarController.h"

#import "QZConst.h"
#import "ZHTool.h"
#import "ZHAlertTool.h"
#import "QZChooseRootVcManagerTool.h"
#import "QZRequestHeaderSetTool.h"
#import "QZTool.h"
#import "QZLoginAccountTool.h"
#import "ZHVerCodeButton.h"
#import "ZHTextField.h"



//#import "QZJPUSHServiceManagerTool.h"
//#import "QZBaseViewController.h"
//#import "QZNavigationViewController.h"
//#import "QZProcessTheDataTool.h"
//#import "QZDefautDataConst.h"
//
//#import "QZLoginTool.h"
//#import "QZFloatingLayerManagerTool.h"
//#import "QZLoginViewController.h"
//#import "QZLoginNavViewController.h"
//#import "ZHBannerView.h"
//#import "QZConstKey.h"
//#import "QZCalculateTool.h"
//#import "QZLoanDataManager.h"
//#import "QZActivityManagerTool.h"
//#import "QZAnalyicsManagerTool.h"
//#import "QZCommonProblemsVC.h"
//#import "QZWaitAnimationTool.h"
//#import "ZHAdPageManagerTool.h"

#endif /* QZMacro_h */
