//
//  QZModifyPwdValidationPageVC.m
//  QZFinancialSupermarket
//
//  Created by wzh on 2017/9/13.
//  Copyright © 2017年 wzh. All rights reserved.
//

#import "QZModifyPwdValidationPageVC.h"
#import "QZInputView.h"
#import "QZLoginPwdUpdatePageVC.h"
@interface QZModifyPwdValidationPageVC ()<QZInputViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *topDesLab;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topDesLeft;
@property (weak, nonatomic) IBOutlet QZInputView *smsCodeInputView;
@property (weak, nonatomic) IBOutlet QZInputView *inputPwdView;
@property (weak, nonatomic) IBOutlet UIButton *nextBtn;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *nextBtnTop;
@property (nonatomic, strong) NSTimer * timer;
@end

@implementation QZModifyPwdValidationPageVC
{
    int downTime;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    downTime = 60;
}

#pragma mark - 修改密码-发送验证码
- (void)sendPhoneVerCode {
    NSString * phone = kGetObjectForKey(QZPhone);
    
    NSMutableDictionary * params = [NSMutableDictionary dictionary];
    [params setValue:phone?:@"" forKey:@"mobile"];
    [params setValue:@"修改密码" forKey:@"msg"];
    
    [QZAFNetwork postWithBaseURL:QZ_MODIFY_SEND_VERCODE params:params success:^(NSURLSessionDataTask *task, id json) {
        
        // 发送验证码成功
        if ([QZConfig checkResponseObject:json]) {
            [self showSuccessStatus:json[@"message"]];
            
            [self.smsCodeInputView.rightBtn setTitle:@"发送中..." forState:UIControlStateNormal];
            __weak typeof(self)WeakSelf = self;
            self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:WeakSelf selector:@selector(downTime) userInfo:nil repeats:YES];
            
        }
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
    
}

#pragma mark - 验证修改密码信息
- (void)VerModifyPasswordInfo {
    
    NSString *verCode = [self.smsCodeInputView getInputText];
    NSString *oldPwd  = [self.inputPwdView getInputText];
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setValue:verCode?:@"" forKey:@"phmsg"];
    [dic setValue:oldPwd?:@"" forKey:@"yuanpassword"];
    
    [QZAFNetwork postWithBaseURL:QZ_MODIFY_VER_OLDPWD params:dic success:^(NSURLSessionDataTask *task, id json) {
        
        // 验证成功
        if ([QZConfig checkResponseObject:json]) {
            [self showSuccessStatus:json[@"message"]];
            
            // 需要跳转
            QZLoginPwdUpdatePageVC *pwdUpdateVC = [[QZLoginPwdUpdatePageVC alloc] init];
            pwdUpdateVC.updatePwdType = QZLoginUpdatePwdTypeModifyPwd;
            pwdUpdateVC.phone = kGetObjectForKey(QZPhone);
            [self.navigationController pushViewController:pwdUpdateVC animated:YES];
            
        } else {
            [self showHudWithHint:json[@"message"]];
        }
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
    
    
}

- (void)setDefautUI{
    self.title = @"验证信息";
    self.topDesLeft.constant = 20 * kScaleOfX;
    self.nextBtnTop.constant = 90 * kScaleOfX;
    
    self.smsCodeInputView.delegate = self;
    self.smsCodeInputView.inputType = QZInputViewTypeInputDigitalCode;

    self.inputPwdView.delegate = self;
    self.inputPwdView.lineViewIsHidden = YES;
    self.inputPwdView.inputType = QZInputViewTypeInputPwd;
    self.inputPwdView.inputTextField.placeholder = @"输入原密码";
    
    [self.nextBtn title:@"确定" titleColor:[UIColor whiteColor] titleFont:[UIFont textCustomFont18] backgroundColor:[UIColor colorWith0x99BAEC]];
    self.nextBtn.enabled = NO;
    [self.nextBtn styleWithCornerRadius:kRadiusWidthWithBtn];
    
    //手机号颜色改变   colorWith0x4180E9
    NSString * phone = kGetObjectForKey(QZPhone);
    [self.topDesLab text:[NSString stringWithFormat:@"您正在修改账户%@的密码", [QZConfig getHandlePhone:phone]] textColor:[UIColor colorWith0x2A2A29] textFont:[UIFont textCustomFont15]];
}

- (void)rightActionWithBtn:(ZHVerCodeButton *)btn view:(QZInputView *)inputView{
    if(inputView == self.smsCodeInputView){
        NSLog(@"-发送验证码");
        
        [self sendPhoneVerCode];
    }
}

- (void)YXTextFieldDidBeginEditing:(ZHTextField *)textField {
    
    NSString * smsCode = [self.smsCodeInputView getInputText];
    NSString * oldPhone = [self.inputPwdView getInputText];
    
    if (oldPhone.length > 0 && smsCode.length > 0) {
        [self.nextBtn title:@"确定" titleColor:[UIColor whiteColor] titleFont:[UIFont textCustomFont18] backgroundColor:[UIColor colorWith0x4180E9]];
        self.nextBtn.enabled = YES;
    } else {
        [self.nextBtn title:@"确定" titleColor:[UIColor whiteColor] titleFont:[UIFont textCustomFont18] backgroundColor:[UIColor colorWith0x99BAEC]];
        self.nextBtn.enabled = NO;
    }
}

- (IBAction)nextBtnAction:(id)sender {
    
    // 验证
    [self VerModifyPasswordInfo];
    
}

// 倒计时
- (void)downTime {
    
    if (downTime > 0) {
        downTime--;
        [self.smsCodeInputView.rightBtn setTitle:[NSString stringWithFormat:@"%ds", downTime] forState:UIControlStateNormal];
        self.smsCodeInputView.rightBtn.enabled = NO;
        
    } else {
        downTime = 60;
        [self.smsCodeInputView.rightBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
        self.smsCodeInputView.rightBtn.enabled = YES;
        [self.timer invalidate];
        
    }
    
}

- (void)dealloc {
    NSLog(@"我出现证明释放啦！");
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
