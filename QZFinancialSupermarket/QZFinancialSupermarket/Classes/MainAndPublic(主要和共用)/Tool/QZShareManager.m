//
//  QZShareManager.m
//  QZFinancialSupermarket
//
//  Created by 张宇轩 on 2017/10/9.
//  Copyright © 2017年 wzh. All rights reserved.
//

#import "QZShareManager.h"

#import "UMSocialQQHandler.h"
#import "UMSocialWechatHandler.h"
#import "UMSocialSinaHandler.h"
#import <UShareUI/UShareUI.h>

#define UMengShareKey @"59db1620cae7e77058000020"

#define redirect @"http://www.yccit.com"


#define QQAPPID @"1106287210"
#define QQAPPKEY  @"c0xNR14XeY4mFwCu"

#define WeiXinAppKey @"wx909f8c29eb7ddae2"
#define WeiXinAppSecret @"d96535da24a9fd2d8faf31a409e029e4"


#define SinaAppKey @"1014488485"
#define SinaSecret @"b1bc1e0f8057d1254b9fcfa60048453b"
#define SinaRedirect @"https://api.weibo.com/oauth2/default.html"

@implementation QZShareManager



+(void)registerShare {
    
    [[UMSocialManager defaultManager] setUmSocialAppkey:UMengShareKey];
    [[UMSocialManager defaultManager] openLog:YES];
    
    
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_Sina appKey:SinaAppKey appSecret:SinaSecret redirectURL:SinaRedirect];
    
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_QQ appKey:QQAPPID appSecret:QQAPPKEY redirectURL:redirect];
    
    
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_WechatSession appKey:WeiXinAppKey appSecret:WeiXinAppSecret redirectURL:redirect];
    
    
}

+ (BOOL)HandleCallBackOpenurl:(NSURL *)url {
    BOOL result = [[UMSocialManager defaultManager] handleOpenURL:url];
    if (!result) {
        // 其他如支付等SDK的回调
    }
    return result;
}


+ (void)shareToPlatform:(UMSocialPlatformType)platform title:(NSString *)title content:(NSString *)content image:(id)image url:(NSString *)url presentedController:(UIViewController *)presentedController complete:(void (^)(BOOL, NSString *))complete {
    
    UMSocialPlatformType sharePlatform = platform;
    
    // 创建消息分享对象
    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
    
    if ( !image || ([image isKindOfClass:[NSString class]] && ((NSString *)image).length == 0)) {
        image = [UIImage imageNamed:@"qzxq"];//本地图片
    }
    
    // 创建内容分享对象
    UMShareWebpageObject *shareObject = [UMShareWebpageObject shareObjectWithTitle:title descr:content thumImage:image];
    
    //设置网页地址
    shareObject.webpageUrl = url;
    
    //分享消息对象设置分享内容对象
    messageObject.shareObject = shareObject;
    //调用分享接口
    
    [[UMSocialManager defaultManager] shareToPlatform:sharePlatform messageObject:messageObject currentViewController:presentedController completion:^(UMSocialShareResponse * data, NSError *error) {
        if (error) {
            complete(NO,[self errorMessageWithCode:error.code]);
        }else{
            complete(YES,data.message);
        }
    }];
    
    
}
+ (NSString *)errorMessageWithCode:(UMSocialPlatformErrorType)responseCode {
    switch (responseCode) {
        case UMSocialPlatformErrorType_Unknow:
            return @"未知错误";
            break;
        case UMSocialPlatformErrorType_NotSupport:
            return @"不支持";
            break;
        case UMSocialPlatformErrorType_AuthorizeFailed:
            return @"授权失败";
            break;
        case UMSocialPlatformErrorType_ShareFailed:
            return @"分享失败";
            break;
        case  UMSocialPlatformErrorType_ShareDataNil:
            return @"分享内容为空";
            break;
        case  UMSocialPlatformErrorType_ShareDataTypeIllegal:
            return @"分享内容不支持";
            break;
        case  UMSocialPlatformErrorType_CheckUrlSchemaFail:
            return @"schemaurl fail";
            break;
        case  UMSocialPlatformErrorType_NotInstall:
            return @"应用未安装";
            break;
        case UMSocialPlatformErrorType_Cancel:
            return @"已取消";
            break;
        case UMSocialPlatformErrorType_NotNetWork:
            return @"网络异常";
            break;
        case UMSocialPlatformErrorType_SourceError:
            return @"第三方错误";
            break;
        case UMSocialPlatformErrorType_ProtocolNotOverride:
            return @"对应的    UMSocialPlatformProvider的方法没有实现";
            break;
        default:
            return @"请求发生未知错误";
            break;
    }
}





@end
