//
//  QZLoginPageVC.m
//  QZFinancialSupermarket
//
//  Created by wzh on 2017/9/11.
//  Copyright © 2017年 wzh. All rights reserved.
//

#import "QZLoginPageVC.h"
#import "QZRegisteredPageVC.h"
#import "QZForgetPwdPageVC.h"
#import "QZInputView.h"
#import "LoginModel.h"
#import "QZLoginAccountModel.h"
#import "QZLoginAccountTool.h"

@interface QZLoginPageVC ()<QZInputViewDelegate>
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;
@property (weak, nonatomic) IBOutlet QZInputView *phoneInputView;
@property (weak, nonatomic) IBOutlet QZInputView *smsAndPwdInputView;
@property (weak, nonatomic) IBOutlet UIButton *forgetPwdBtn;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;

@property (weak, nonatomic) IBOutlet UIButton *registeredBtn;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *forgetTop;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *registeredBtnTop;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *loginBtnTop;

@property (nonatomic, strong) LoginModel *loginModel;             // 登录model
@property (nonatomic, strong) NSTimer * timer;
@end

@implementation QZLoginPageVC
{
    int downTime;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    downTime = 60;
}

#pragma mark - 短线登录获取手机号验证码
- (void)getMsgloginPhoneVerCode {
    
    NSString *phone = [self.phoneInputView getInputText];
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setValue:phone?:@"" forKey:@"mobile"];
    [dic setValue:@"短信登陆" forKey:@"msg"];
    
    [QZAFNetwork postWithBaseURL:QZ_LOGIN_PHONE_VERCODE params:dic success:^(NSURLSessionDataTask *task, id json) {
        
        if ([QZConfig checkResponseObject:json]) {
            [self showSuccessStatus:json[@"message"]];
            
            [self.smsAndPwdInputView.rightBtn setTitle:@"发送中..." forState:UIControlStateNormal];
            __weak typeof(self)WeakSelf = self;
            self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:WeakSelf selector:@selector(downTime) userInfo:nil repeats:YES];
            
        }
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
    
}

#pragma mark - 手机号密码登录
- (void)PhonePwdLogin {
    NSString *phone = [self.phoneInputView getInputText];
    NSString *password   = [self.smsAndPwdInputView getInputText];
    NSMutableDictionary * dic = [NSMutableDictionary dictionary];
    [dic setValue:phone?:@"" forKey:@"mobile"];
    [dic setValue:password?:@"" forKey:@"password"];
    
    [QZAFNetwork postWithBaseURL:QZ_PHONE_LOGIN params:dic success:^(NSURLSessionDataTask *task, id json) {
        
        if ([QZConfig checkResponseObject:json]) {
            
            self.loginModel = [[LoginModel alloc] initWithJson:json[@"data"]];
            kSetObjectForKey(self.loginModel.token, QZToken);
            kSetObjectForKey(@(self.loginModel.users_id), QZUserid);
            kSetObjectForKey(self.loginModel.mobile, QZPhone);
            
            [self showSuccessStatusa:json[@"message"] delayDo:^{
                [self back];
            }];
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
}


#pragma mark - 短信登录
- (void)MsgLogin {
    
    NSString *phone = [self.phoneInputView getInputText];
    NSString *sms   = [self.smsAndPwdInputView getInputText];
    NSMutableDictionary * dic = [NSMutableDictionary dictionary];
    [dic setValue:phone?:@"" forKey:@"mobile"];
    [dic setValue:sms?:@"" forKey:@"phmsg"];
    
    [QZAFNetwork postWithBaseURL:QZ_MSG_LOGIN params:dic success:^(NSURLSessionDataTask *task, id json) {
        
        if ([QZConfig checkResponseObject:json]) {
            
            // 本地存储
            self.loginModel = [[LoginModel alloc] initWithJson:json[@"data"]];
            kSetObjectForKey(self.loginModel.token, QZToken);
            kSetObjectForKey(@(self.loginModel.users_id), QZUserid);
            kSetObjectForKey(self.loginModel.mobile, QZPhone);
            [self showSuccessStatusa:json[@"message"] delayDo:^{
                [self back];
            }];
        }
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
    
}



- (void)setDefautUI{
    self.title = @"登录";
    self.forgetTop.constant = 15 * kScaleOfX;
    self.loginBtnTop.constant = 100 * kScaleOfX;
    self.registeredBtnTop.constant = 25 * kScaleOfX;
    
    [self.segmentedControl setTitle:@"账号登录" forSegmentAtIndex:0];
    [self.segmentedControl setTitle:@"短信登录" forSegmentAtIndex:1];
    self.segmentedControl.tintColor = [UIColor colorWith0x4180E9];
    //选中的颜色
    [self.segmentedControl setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]} forState:UIControlStateSelected];
    //未选中的颜色
    [self.segmentedControl setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWith0x4180E9]} forState:UIControlStateNormal];
    self.phoneInputView.inputType = QZInputViewTypeInputPhone;
    
    self.smsAndPwdInputView.lineViewIsHidden = YES;
    self.smsAndPwdInputView.delegate = self;
    self.smsAndPwdInputView.inputType = QZInputViewTypeInputPwd;
    
    
    [self.forgetPwdBtn title:@"忘记密码?" titleColor:[UIColor colorWith0x4180E9]titleFont:[UIFont textCustomFont15]];
    [self.loginBtn title:@"登录" titleColor:[UIColor whiteColor] titleFont:[UIFont textCustomFont18] backgroundColor:[UIColor colorWith0x4180E9]];
    [self.loginBtn styleWithCornerRadius:kRadiusWidthWithBtn];
    [self.registeredBtn title:@"去注册>" titleColor:[UIColor colorWith0x4180E9] titleFont:[UIFont textCustomFont16]];
}
- (IBAction)segmentedControlAction:(UISegmentedControl *)sender {
    switch (sender.selectedSegmentIndex) {
        case 0:{
            self.smsAndPwdInputView.inputType = QZInputViewTypeInputPwd;
            self.smsAndPwdInputView.inputTextField.text = @"";
        }
            break;
        case 1:{
            self.smsAndPwdInputView.inputType = QZInputViewTypeInputDigitalCode;
            self.smsAndPwdInputView.inputTextField.text = @"";
        }
            break;
        default:
            break;
    }
    [self.smsAndPwdInputView layoutSubviews];
    
}
- (IBAction)forgetPwdBtnAction:(id)sender {
    NSLog(@"忘记密码");
    QZForgetPwdPageVC *fotgetPwdPageVc = [[QZForgetPwdPageVC alloc]init];
    [self.navigationController pushViewController:fotgetPwdPageVc animated:YES];
}
- (IBAction)loginBtnAcion:(id)sender {
    NSLog(@"登录");
    if (self.segmentedControl.selectedSegmentIndex == 0) {
        [self PhonePwdLogin];
    }
    
    if (self.segmentedControl.selectedSegmentIndex == 1) {
        [self MsgLogin];
    }

}
- (IBAction)registeredBtnAction:(id)sender {
    NSLog(@"注册");
    QZRegisteredPageVC *registeredPageVc = [[QZRegisteredPageVC alloc]init];
    [self.navigationController pushViewController:registeredPageVc animated:YES];

}
#pragma mark --- QZInputViewDelegate
- (void)rightActionWithBtn:(ZHVerCodeButton *)btn view:(QZInputView *)inputView{
    if(inputView == self.smsAndPwdInputView && self.segmentedControl.selectedSegmentIndex == 1){
        NSLog(@"发送验证码");
        
        [self getMsgloginPhoneVerCode];

    }
}


// 倒计时
- (void)downTime {
    
    if (downTime > 0) {
        downTime--;
        [self.smsAndPwdInputView.rightBtn setTitle:[NSString stringWithFormat:@"%ds", downTime] forState:UIControlStateNormal];
        self.smsAndPwdInputView.rightBtn.enabled = NO;
        
    } else {
        downTime = 60;
        [self.smsAndPwdInputView.rightBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
        self.smsAndPwdInputView.rightBtn.enabled = YES;
        [self.timer invalidate];
        
    }
    
}

- (void)dealloc {
    NSLog(@"释放啦～～～");
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
