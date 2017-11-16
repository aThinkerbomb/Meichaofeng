//
//  QZProductDetailPageVC.m
//  QZFinancialSupermarket
//
//  Created by wzh on 2017/9/14.
//  Copyright © 2017年 wzh. All rights reserved.
//

#import "QZProductDetailPageVC.h"
#import "QZGoToCommentsPageVC.h"
#import "YXNetworkReachabilityManager.h"
#import "QZShareManager.h"

#define BtnHeight 45 *kScaleOfX

@interface QZProductDetailPageVC ()
@property (nonatomic, strong) UIButton *nextBtn;
@end

@implementation QZProductDetailPageVC


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}



#pragma mark - 点击申请次数
- (void)applyRecordCount {
    
    NSString *userid = kGetObjectForKey(QZUserid);
    NSDictionary *dic = @{@"id": @(self.commentId?:0),
                        @"users_id": userid
                          };
    
    [QZAFNetwork postWithBaseURL:QZ_APPLY_COUNT_URL params:dic success:^(NSURLSessionDataTask *task, id json) {
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
}


- (void)setDefautUI{
    
    self.webView.height = kScreenHeight - kNavBarAndStatusBarHeight - BtnHeight;
    self.wkWebView.height = kScreenHeight - kNavBarAndStatusBarHeight - BtnHeight;
    self.nextBtn.frame = CGRectMake(0, CGRectGetMaxY(self.webView.frame), kScreenWidth, BtnHeight);

    
}
- (void)goToApplyAction{
    NSLog(@"去申请");
    
    [QZAnalyticsManager event:loan_qsq_button];
    
    if ([self isLoginStatus]) {
        [self applyRecordCount];
        
        [QZAnalyticsManager event:loan_qsqjr];
        
        QZBaseWebViewController *webVC = [[QZBaseWebViewController alloc] init];
        if (![self.h5link hasPrefix:@"http:"] && ![self.h5link hasPrefix:@"https:"]) {
            self.h5link = [@"http:" stringByAppendingPathComponent:self.h5link];
            
        }
        webVC.urlStr = self.h5link;
        [self.navigationController pushViewController:webVC animated:YES];
    }
    
}

- (void)goToShareAction {
    NSLog(@"分享");
    
    [UMSocialUIManager setPreDefinePlatforms:@[@0,@1,@2,@4,@5]];
    __weak typeof (self)Weakself = self;
    [UMSocialUIManager showShareMenuViewInWindowWithPlatformSelectionBlock:^(UMSocialPlatformType platformType, NSDictionary *userInfo) {

        [QZShareManager shareToPlatform:platformType title:self.proTitle content:@"1小时放款\n每日手续费3元\n贷款期限7-30天" image:[UIImage imageNamed:@"qzxq"] url:self.url presentedController:Weakself complete:^(BOOL isSuccess, NSString *errorMsg) {
            if (isSuccess) {
                [Weakself showSuccessStatus:@"分享成功"];
            } else {
                [Weakself showHint:errorMsg];
            }
            
        }];
    }];
}


- (void)goToCommentsAction{
    NSLog(@"去评论");
    if ([self isLoginStatus]) {
        QZGoToCommentsPageVC *goToCommentsPageVc = [[QZGoToCommentsPageVC alloc]init];
        goToCommentsPageVc.enterType = QZEnterTypeTypeComments;
        goToCommentsPageVc.commentId = self.commentId;
        goToCommentsPageVc.commentType = 1;
        [self.navigationController pushViewController:goToCommentsPageVc animated:YES];
    }
}


- (UIButton *)nextBtn{
    if(!_nextBtn){
        _nextBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_nextBtn title:@"去申请" titleColor:[UIColor whiteColor] titleFont:[UIFont textCustomFont15] backgroundColor:[UIColor colorWith0x4180E9]];
        [_nextBtn addTarget:self action:@selector(goToApplyAction) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_nextBtn];
        
    }
    return _nextBtn;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
