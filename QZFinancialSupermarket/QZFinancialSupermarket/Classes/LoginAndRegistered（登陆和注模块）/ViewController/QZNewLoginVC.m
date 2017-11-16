//
//  QZNewLoginVC.m
//  QZFinancialSupermarket
//
//  Created by 张宇轩 on 2017/10/30.
//  Copyright © 2017年 wzh. All rights reserved.
//

#import "QZNewLoginVC.h"
#import "QZInputView.h"
#import "LoginModel.h"
#import "QZBaseWebViewController.h"

@interface QZNewLoginVC ()<QZInputViewDelegate, UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *HeaderBackViewHeight; //264
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *closeTop; //30
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *closeWidth; //17
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *closeHeight; //17

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *logoTop; //20
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *logoWidth;//93
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *logoheight;//93

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *loginLabelTop;//8

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *WhiteBackViewTop;// -56
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *WhiteBackViewHeight; //255
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *WihteBackViewWidth; // 345
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *inputViewTop;//45
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *inputViewHeight;//45
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *inputViewWidth;//300
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *loginBtnWidth;//275
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *loginBtnHeight;//50
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *loginBtnTop;//-40
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *xieyiTop;//10


@property (weak, nonatomic) IBOutlet QZInputView *phoneView;
@property (weak, nonatomic) IBOutlet QZInputView *numberVerView;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (weak, nonatomic) IBOutlet UIButton *XieyiBtn;

@property (nonatomic, strong) NSTimer * timer;
@property (nonatomic, strong) LoginModel *loginModel;             // 登录model

@end

@implementation QZNewLoginVC
{
    int downTime;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    downTime = 60;
}

// 不需要请求数据检测网络
- (BOOL)isNeedReachibityNetwork {
    return NO;
}

- (void)setDefautUI {
    
    self.navigationController.delegate = self;
    
    // 适配约束
    self.HeaderBackViewHeight.constant = 264 * kScaleOfX;
    
    self.closeTop.constant = 30 * kScaleOfX;
    self.closeWidth.constant = 30 * kScaleOfX;
    self.closeHeight.constant = 30 * kScaleOfX;
    
    self.logoTop.constant = 20 * kScaleOfX;
    self.logoWidth.constant = 93 * kScaleOfX;
    self.logoheight.constant = 93 * kScaleOfX;
    
    self.loginLabelTop.constant = 8 * kScaleOfX;
    
    self.WhiteBackViewTop.constant = -45 * kScaleOfX;
    self.WihteBackViewWidth.constant = 345 * kScaleOfX;
    self.WhiteBackViewHeight.constant = 210 * kScaleOfX;
    
    self.inputViewTop.constant = 45 * kScaleOfX;
    self.inputViewHeight.constant = 45 * kScaleOfX;
    self.inputViewWidth.constant = 300 * kScaleOfX;
    
    self.loginBtnWidth.constant = 275 * kScaleOfX;
    self.loginBtnHeight.constant = 50 * kScaleOfX;
    self.loginBtnTop.constant = -40 * kScaleOfX;
    self.xieyiTop.constant = 5 * kScaleOfX;
    
    // 输入框
    self.phoneView.inputType = QZInputViewTypeDefaut;

    NSString *phone = kGetObjectForKey(QZPhone);
    if (phone) {
        self.phoneView.inputTextField.text = phone;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.numberVerView.inputTextField becomeFirstResponder];
        });
    }
    
    self.numberVerView.inputType = QZInputViewTypeInputDigitalCode;
    self.numberVerView.lineViewIsHidden = YES;
    self.numberVerView.delegate = self;
    
    // 登录按钮
    [self.loginBtn title:@"快速登录" titleColor:[UIColor whiteColor] titleFont:[UIFont textCustomFont18] backgroundColor:[UIColor colorWith0x99BAEC]];
    self.loginBtn.enabled = NO;
    [self.loginBtn styleWithCornerRadius:25.0 * kScaleOfX];
    
    
    // 协议
    NSString *str = @"    开始使用表示同意没钞蜂的《注册服务协议》。";
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:str];
    [attrStr addAttribute:NSForegroundColorAttributeName value:[UIColor colorWith0xFe5F19] range:NSMakeRange(str.length - 9, 8)];
    self.XieyiBtn.titleLabel.attributedText = attrStr;
    
}


#pragma mark - 加密。。。不太懂为什么这样操作～～～
- (void)verCodeJIAMI {
    [QZAFNetwork postWithBaseURL:QZ_VERCODE_JIAMI_URL success:^(NSURLSessionDataTask *task, id json) {
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
}

#pragma mark - 短线登录获取手机号验证码
- (void)getMsgloginPhoneVerCode {
    
    NSString *phone = [self.phoneView getInputText];
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setValue:phone?:@"" forKey:@"mobile"];
    [dic setValue:@"短信登陆" forKey:@"msg"];
    
    [QZAFNetwork postWithBaseURL:QZ_LOGIN_PHONE_VERCODE params:dic success:^(NSURLSessionDataTask *task, id json) {
        
        if ([QZConfig checkResponseObject:json]) {
            [self showHint:@"短信验证码发送成功"];
            
            [self.phoneView.rightBtn setTitle:@"发送中..." forState:UIControlStateNormal];
            __weak typeof(self)WeakSelf = self;
            self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:WeakSelf selector:@selector(downTime) userInfo:nil repeats:YES];
            
        }
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
    
}



#pragma mark - 短信登录
- (void)MsgLogin {
    
    NSString *phone = [self.phoneView getInputText];
    NSString *sms   = [self.numberVerView getInputText];
    NSMutableDictionary * dic = [NSMutableDictionary dictionary];
    [dic setValue:phone?:@"" forKey:@"mobile"];
    [dic setValue:sms?:@"" forKey:@"phmsg"];
    
    [QZAFNetwork postWithBaseURL:QZ_MSG_LOGIN params:dic success:^(NSURLSessionDataTask *task, id json) {
        
        if ([QZConfig checkResponseObject:json]) {
            
            
            [QZAnalyticsManager event:login_dlcg];
            [QZAnalyticsManager event:login_zccg];
            
            // 本地存储
            self.loginModel = [[LoginModel alloc] initWithJson:json[@"data"]];
            kSetObjectForKey(self.loginModel.token, QZToken);
            kSetObjectForKey(@(self.loginModel.users_id), QZUserid);
            kSetObjectForKey(self.loginModel.mobile, QZPhone);
            [self showHint:json[@"message"] delayDo:^{
                [self disMissBack];
            }];
        } else {
            [QZAnalyticsManager event:login_dlsb];
            [QZAnalyticsManager event:login_zcsb];
        }
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
    
}



#pragma mark - 输入框代理方法
- (void)rightActionWithBtn:(ZHVerCodeButton *)btn view:(QZInputView *)inputView{
    
    if (inputView == self.numberVerView) {
        NSLog(@"点击获取手机号验证码");
        
        if ([self.phoneView getInputText].length != 11) {
            [self showHint:@"手机号格式不正确"];
            return;
        }
        // 获取验证码前加密
        [self verCodeJIAMI];
        // 睡0.5秒
        [NSThread sleepForTimeInterval:0.3];
        // 获取验证码
        [self getMsgloginPhoneVerCode];
        
        [QZAnalyticsManager event:login_hqyzm];
    }
}

- (void)YXTextFieldDidBeginEditing:(ZHTextField *)textField {
    
    NSString * phone = [self.phoneView getInputText];
    NSString * verCode = [self.numberVerView getInputText];
    
    if (phone.length > 0 && verCode.length > 0) {
        [self.loginBtn title:@"快速登录" titleColor:[UIColor whiteColor] titleFont:[UIFont textCustomFont18] backgroundColor:[UIColor colorWith0x4180E9]];
        self.loginBtn.enabled = YES;
    } else {
        [self.loginBtn title:@"快速登录" titleColor:[UIColor whiteColor] titleFont:[UIFont textCustomFont18] backgroundColor:[UIColor colorWith0x99BAEC]];
        self.loginBtn.enabled = NO;
    }
}


// 将要显示控制器
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    // 判断要显示的控制器是否是自己
    BOOL isShowHomePage = [viewController isKindOfClass:[self class]];
    [self.navigationController setNavigationBarHidden:isShowHomePage animated:YES];
}

- (IBAction)XieyiBtnAction:(UIButton *)sender {
    NSLog(@"协议");
    QZBaseWebViewController *webVC = [[QZBaseWebViewController alloc] init];
    webVC.urlStr = [BaseUrl stringByAppendingPathComponent:QZ_XIEYI_URL];

    [self.navigationController pushViewController:webVC animated:YES];
}

- (IBAction)LoginAction:(UIButton *)sender {
    NSLog(@"登录");
    if ([[self.phoneView getInputText] isEqualToString:@""]) {
        [self showHint:@"手机号不能为空"];
        return;
    } else if ([self.phoneView getInputText].length != 11) {
        [self showHint:@"手机号格式不正确"];
        return;
    }
    
    if ([[self.numberVerView getInputText] isEqualToString:@""]) {
        [self showHint:@"验证码不能为空"];
        return;
    } else if ([self.numberVerView getInputText].length != 6) {
        [self showHint:@"验证码格式不正确"];
        return;
    }
    [self MsgLogin];
}
- (IBAction)closeAction:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

// 倒计时
- (void)downTime {
    
    if (downTime > 0) {
        downTime--;
        [self.numberVerView.rightBtn setTitle:[NSString stringWithFormat:@"%ds", downTime] forState:UIControlStateNormal];
        self.numberVerView.rightBtn.enabled = NO;
        
    } else {
        downTime = 60;
        [self.numberVerView.rightBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
        self.numberVerView.rightBtn.enabled = YES;
        [self.timer invalidate];
        
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
