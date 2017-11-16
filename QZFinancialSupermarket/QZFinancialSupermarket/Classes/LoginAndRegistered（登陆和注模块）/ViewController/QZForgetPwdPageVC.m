//
//  QZForgetPwdPageVC.m
//  QZFinancialSupermarket
//
//  Created by wzh on 2017/9/12.
//  Copyright © 2017年 wzh. All rights reserved.
//

#import "QZForgetPwdPageVC.h"
//#import "QZModifyPwdValidationPageVC.h"
#import "QZLoginPwdUpdatePageVC.h"
#import "QZInputView.h"
@interface QZForgetPwdPageVC ()<QZInputViewDelegate>
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *top;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *nextBtnTop;
@property (weak, nonatomic) IBOutlet QZInputView *phoneInputView;
@property (weak, nonatomic) IBOutlet QZInputView *smsCodeInputView;
@property (weak, nonatomic) IBOutlet UIButton *nextBtn;

@property (nonatomic, strong) NSTimer * timer;

@end

@implementation QZForgetPwdPageVC
{
    int downTime;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    downTime = 60;
}

#pragma mark - 忘记密码获取验证码
- (void)getForgetPwdVerCode {
    
    NSString * phone = [self.phoneInputView getInputText];

    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setValue:phone?:@"" forKey:@"mobile"];
    [dic setValue:@"找回密码" forKey:@"msg"];
    
    [QZAFNetwork postWithBaseURL:QZ_FORGET_PWD_VERCODE params:dic success:^(NSURLSessionDataTask *task, id json) {
        
        if ([QZConfig checkResponseObject:json]) {
            [self showSuccessStatus:json[@"message"]];
            
            [self.smsCodeInputView.rightBtn setTitle:@"发送中..." forState:UIControlStateNormal];
            __weak typeof(self)WeakSelf = self;
            self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:WeakSelf selector:@selector(downTime) userInfo:nil repeats:YES];
        }
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
}


#pragma mark - 忘记密码验证码下一步
- (void)forgetPwdNext {
    
    NSString *verCode = [self.smsCodeInputView getInputText];
    
    NSDictionary *dic = @{@"phmsg": verCode?:@""};
    
    [QZAFNetwork postWithBaseURL:QZ_FORGET_PWD_NEXT params:dic success:^(NSURLSessionDataTask *task, id json) {
        
        if ([QZConfig checkResponseObject:json]) {
            
            // push  修改密码界面
            QZLoginPwdUpdatePageVC *forgetPwdUpdatePageVc = [[QZLoginPwdUpdatePageVC alloc]init];
            forgetPwdUpdatePageVc.updatePwdType = QZLoginUpdatePwdTypeForgetPwd;
            forgetPwdUpdatePageVc.phone = [self.phoneInputView getInputText];
            [self.navigationController pushViewController:forgetPwdUpdatePageVc animated:YES];
            
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
}


- (void)setDefautUI{
    self.title = @"忘记密码";
    self.top.constant = 10 * kScaleOfX;
    self.nextBtnTop.constant = 90 * kScaleOfX;
    
    self.phoneInputView.inputType = QZInputViewTypeInputPhone;
    self.phoneInputView.delegate = self;
    
    self.smsCodeInputView.delegate = self;
    self.smsCodeInputView.inputType = QZInputViewTypeInputDigitalCode;
    self.smsCodeInputView.lineViewIsHidden = YES;
    
    [self.nextBtn title:@"下一步" titleColor:[UIColor whiteColor] titleFont:[UIFont textCustomFont18] backgroundColor:[UIColor colorWith0x99BAEC]];
    self.nextBtn.enabled = NO;
    [self.nextBtn styleWithCornerRadius:kRadiusWidthWithBtn];
    
    
}
- (void)rightActionWithBtn:(ZHVerCodeButton *)btn view:(QZInputView *)inputView{
    if(inputView == self.smsCodeInputView){
        NSLog(@"-发送验证码");
        
        [self getForgetPwdVerCode];
    }
}
- (IBAction)nextBtnAction:(id)sender {
    
    [self forgetPwdNext];
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

- (void)YXTextFieldDidBeginEditing:(ZHTextField *)textField {
    NSString * phone = [self.phoneInputView getInputText];
    NSString * smsCode = [self.smsCodeInputView getInputText];
    if (phone.length > 0 && smsCode.length > 0) {
        [self.nextBtn title:@"下一步" titleColor:[UIColor whiteColor] titleFont:[UIFont textCustomFont18] backgroundColor:[UIColor colorWith0x4180E9]];
        self.nextBtn.enabled = YES;
    } else {
        [self.nextBtn title:@"下一步" titleColor:[UIColor whiteColor] titleFont:[UIFont textCustomFont18] backgroundColor:[UIColor colorWith0x99BAEC]];
        self.nextBtn.enabled = NO;
    }
}



- (void)back {
    [super back];
    [self.timer invalidate];
    self.timer = nil;
}

- (void)dealloc {
    NSLog(@"释放啦～～");
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
