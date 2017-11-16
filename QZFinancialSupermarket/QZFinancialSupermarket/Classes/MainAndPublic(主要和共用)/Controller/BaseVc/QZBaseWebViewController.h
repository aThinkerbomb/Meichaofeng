//
//  QZBaseWebViewController.h
//  QZFinancialSupermarket
//
//  Created by wzh on 17/3/10.
//
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>
#import <JavaScriptCore/JavaScriptCore.h>

@protocol QZJSObjcDelegate <JSExport>
- (void)sharejs:(NSString *)shareData;
- (void)goToHomejs;
@end

@interface QZBaseWebViewController : QZBaseViewController<UIWebViewDelegate,WKNavigationDelegate,WKUIDelegate,WKScriptMessageHandler,QZJSObjcDelegate>

@property (strong, nonatomic) WKWebView *wkWebView;

@property (strong, nonatomic) NSString *urlStr;
@property (strong, nonatomic) NSString *noHeaderUrlStr;
@property (copy, nonatomic) NSString *titleStr;



@property (nonatomic, strong) UIWebView *webView;
@property (nonatomic, copy) NSString *webUrl;

@end
