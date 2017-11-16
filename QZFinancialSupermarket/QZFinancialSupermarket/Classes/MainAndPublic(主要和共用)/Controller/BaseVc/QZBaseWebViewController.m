//
//  QZBaseWebViewController.m
//  QZFinancialSupermarket
//
//  Created by wzh on 17/3/10.
//
//


#import "QZBaseViewController.h"
#import "QZWaitAnimationTool.h"
#import "StaticAppDownCount.h"
#import "YXNetworkReachabilityManager.h"
#import "YXStatusView.h"
@interface QZBaseWebViewController ()


@end

@implementation QZBaseWebViewController


-(void)back{
    if(self.webUrl){
        if(self.webView.canGoBack){
            [self.webView goBack];
        }else{
            [self.webView stopLoading];
            [QZWaitAnimationTool endAnimation];
            [self.navigationController popViewControllerAnimated:YES];
        }
    }
    if(self.noHeaderUrlStr || self.urlStr){
        if(self.wkWebView.canGoBack){
            [self.wkWebView goBack];
        }else{
            [self.webView stopLoading];
            [QZWaitAnimationTool endAnimation];
            [self.navigationController popViewControllerAnimated:YES];
        }
    }
}



//- (void)nextBtnActionWithStatusView:(ZHStatusView *)statusView statusType:(ZHStatusViewType)statusType{
//    if([statusView currentShowStatus] == NO){
//        if(self.webUrl){
//            self.webUrl = self.webUrl;
//        }
//        if(self.noHeaderUrlStr || self.urlStr){
//            if(self.noHeaderUrlStr){
//                self.noHeaderUrlStr = self.noHeaderUrlStr;
//            }
//            if(self.urlStr){
//                self.urlStr = self.urlStr;
//            }
//        }
//    }
//}
- (void)loadNewData{
    
    self.urlStr = self.urlStr;
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    NetworkType type = [YXNetworkReachabilityManager shareInstance].networkType;
    // 无网的时候没有数据
    if (type == NetworkTypeNoReachable) {
        [self.dataArray removeAllObjects];
    } else {
        // 有网时有数据
        [self.dataArray addObject:@"为了让数组有数据，不被判断为无数据显示"];
    }
    
    [QZWaitAnimationTool startAnimation];
}
- (WKWebView *)wkWebView{
    if(!_wkWebView){
        WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc] init];
        //注册js方法
        [config.userContentController addScriptMessageHandler:self name:@"webViewQZApp"];
        _wkWebView = [[WKWebView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - kNavBarAndStatusBarHeight) configuration:config];
        _wkWebView.UIDelegate = self;
        _wkWebView.navigationDelegate = self;
        _wkWebView.backgroundColor = [UIColor clearColor];
        _wkWebView.scrollView.backgroundColor = [UIColor clearColor];
        [self.view addSubview:_wkWebView];
    }
    return _wkWebView;
}
- (UIWebView *)webView{
    if(!_webView){
        _webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - kNavBarAndStatusBarHeight)];
        _webView.delegate = self;
        _webView.backgroundColor = [UIColor clearColor];
        _webView.scrollView.backgroundColor = [UIColor clearColor];
        [self.view addSubview:_webView];
    }
    return _webView;
}

- (void)setUrlStr:(NSString *)urlStr{
    _urlStr = urlStr;
    NSLog(@"wKUrl ---------------- %@",_urlStr);
    
    [self.wkWebView loadRequest:[QZRequestHeaderSetTool requestWithUrl:_urlStr]];
}


- (void)setNoHeaderUrlStr:(NSString *)noHeaderUrlStr{
    _noHeaderUrlStr = noHeaderUrlStr;
    NSLog(@"webUrl ---------------- %@",_noHeaderUrlStr);
    NSURLRequest *request =[NSURLRequest requestWithURL:[NSURL URLWithString:_noHeaderUrlStr]];
    [self.wkWebView loadRequest:request];
}

- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message{
    
}
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
    decisionHandler(WKNavigationActionPolicyAllow);
    NSLog(@"url -   %@", navigationAction.request.URL.absoluteString);
    NSString *urlStr = navigationAction.request.URL.absoluteString;
    if ([urlStr containsString:@"https://itunes.apple.com"] || [urlStr containsString:@"http://itunes.apple.com"]) {
        // 开启App下载统计次数
        [[StaticAppDownCount shareInstance] startStaticDownCount];
        [QZAnalyticsManager event:loan_qsqjr_apk];
    }
}


-(void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation{

}

// 页面加载完成
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
    [QZWaitAnimationTool endAnimation];
    
    if(!self.titleStr || [self.titleStr isEqual:@""]){
        self.navigationItem.title = webView.title;
    }else{
        self.navigationItem.title = self.titleStr;
    }

}

// 页面加载失败
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(null_unspecified WKNavigation *)navigation withError:(NSError *)error{
    [QZWaitAnimationTool endAnimation];


}
- (void)webView:(WKWebView *)webView didFailNavigation:(WKNavigation *)navigation withError:(NSError *)error{
    

}



#pragma mark ---------------------------------------------   

- (void)setWebUrl:(NSString *)webUrl{
    _webUrl = webUrl;
    NSLog(@"webURl --------- %@",_webUrl);
    NSString *encodeString = [webUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSMutableURLRequest *request =[NSMutableURLRequest requestWithURL:[NSURL URLWithString:encodeString]];
    request.cachePolicy = NSURLRequestReloadIgnoringCacheData;
    [self.webView loadRequest:request];
}

#pragma mark - webView的代理方法
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {

    NSString *urlStr = request.URL.absoluteString;
    if ([urlStr containsString:@"https://itunes.apple.com"] || [urlStr containsString:@"http://itunes.apple.com"]) {
        // 开启App下载统计次数
        [[StaticAppDownCount shareInstance] startStaticDownCount];
        [QZAnalyticsManager event:loan_qsqjr_apk];
    }

    return YES;
}

- (void)webViewDidStartLoad:(UIWebView *)webView{
    NSLog(@" -----start");
    
}
-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    NSLog(@" -----webViewDidFinishLoad");

    if(!self.titleStr || [self.titleStr isEqual:@""]){
        self.navigationItem.title = [webView stringByEvaluatingJavaScriptFromString:@"document.title"];
    }else{
        self.navigationItem.title = self.titleStr;
    }
    JSContext *context = [webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    context[@"InterAction"] = self;
}

- (void)sharejs:(NSString *)shareData{
//    NSLog(@"分享地址=====%@",shareData);
//    NSDictionary *dataDic = [ZHTool dictionaryWithJsonString:shareData];
//    dispatch_async(dispatch_get_main_queue(), ^{
//        self.shareView.shareDic = dataDic;
//        self.shareView.hidden = NO;
//    });
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    NSLog(@" -----didFailLoadWithError");


}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)dealloc{
    [self.webView stopLoading];
    self.webView.delegate = nil;
    [self.webView removeFromSuperview];
    self.webView = nil;
}

- (void)goToHomejs{
    dispatch_async(dispatch_get_main_queue(), ^{
        self.tabBarController.selectedIndex = 0;
        [self.navigationController popToRootViewControllerAnimated:YES];
    });
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
