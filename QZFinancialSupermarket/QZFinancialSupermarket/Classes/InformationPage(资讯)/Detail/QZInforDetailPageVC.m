//
//  QZInforDetailPageVC.m
//  QZFinancialSupermarket
//
//  Created by wzh on 2017/9/14.
//  Copyright © 2017年 wzh. All rights reserved.
//

#import "QZInforDetailPageVC.h"
#import "QZGoToCommentsPageVC.h"
#define BtnHeight 45 *kScaleOfX
@interface QZInforDetailPageVC ()

@property (nonatomic, strong) UIButton *nextBtn;

@end

@implementation QZInforDetailPageVC

- (UIButton *)nextBtn{
    if(!_nextBtn){
        _nextBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_nextBtn title:@"去评论" titleColor:[UIColor whiteColor] titleFont:[UIFont textCustomFont15] backgroundColor:[UIColor colorWith0x4180E9]];
        [_nextBtn setImage:[UIImage imageNamed:@"去评论"] forState:UIControlStateNormal];
 
        [_nextBtn addTarget:self action:@selector(goToCommentsAction) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_nextBtn];

    }
    return _nextBtn;
}
- (void)goToCommentsAction{
    NSLog(@"去评价");
    if ([self isLoginStatus]) {
        QZGoToCommentsPageVC *goToCommentsPageVc = [[QZGoToCommentsPageVC alloc]init];
        goToCommentsPageVc.enterType = QZEnterTypeTypeComments;
        goToCommentsPageVc.commentId = self.commentId;
        goToCommentsPageVc.commentType = self.commentType;
        [self.navigationController pushViewController:goToCommentsPageVc animated:YES];
    }

}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

}
- (void)setDefautUI{
    self.webUrl = @"";
    self.title = @"";
    self.webView.height = kScreenHeight - kNavBarAndStatusBarHeight - BtnHeight;
    self.wkWebView.height = kScreenHeight - kNavBarAndStatusBarHeight - BtnHeight;
    self.nextBtn.frame = CGRectMake(0, CGRectGetMaxY(self.webView.frame), kScreenWidth, BtnHeight);
    [self.nextBtn layoutButtonWithEdgeInsetsStyle:ZH_ButtonEdgeInsetsStyleLeft imageTitleSpace:5 * kScaleOfX];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
