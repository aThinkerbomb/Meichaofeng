//
//  QZForgetPwdUpdatePageVC.m
//  QZFinancialSupermarket
//
//  Created by wzh on 2017/9/12.
//  Copyright © 2017年 wzh. All rights reserved.
//

#import "QZLoginPwdUpdatePageVC.h"
#import "QZInputView.h"
#import "QZLoginPageVC.h"
#import "QZUserCenterVC.h"
@interface QZLoginPwdUpdatePageVC ()
@property (weak, nonatomic) IBOutlet QZInputView *pwdInputView;
@property (weak, nonatomic) IBOutlet QZInputView *confirmPwdInputView;
@property (weak, nonatomic) IBOutlet UIButton *confirmBtn;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *top;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *confirmBtnTop;

@end

@implementation QZLoginPwdUpdatePageVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)configNewPassword {
 
    NSString *pwd = [self.pwdInputView getInputText];
    NSString *confirmPwd = [self.pwdInputView getInputText];
    
    NSMutableDictionary * params = [NSMutableDictionary dictionary];
    [params setValue:self.phone forKey:@"mobile"];
    [params setValue:pwd?:@"" forKey:@"passwordone"];
    [params setValue:confirmPwd?:@"" forKey:@"passwordtwo"];
    
    [QZAFNetwork postWithBaseURL:QZ_SET_NEW_PWD params:params success:^(NSURLSessionDataTask *task, id json) {
        
        if ([QZConfig checkResponseObject:json]) {
            __weak typeof(self)WeakSelf = self;
            
            if (self.updatePwdType == QZLoginUpdatePwdTypeForgetPwd) {
                [self showSuccessStatusa:json[@"message"] delayDo:^{
                    [WeakSelf popToViewController:[QZLoginPageVC class]];
                }];
            } else if (self.updatePwdType == QZLoginUpdatePwdTypeModifyPwd){
                
                // 修改密码 现在pop 到设置页面，其实应该重新登录获取新的token
                
                [self showSuccessStatusa:json[@"message"] delayDo:^{
                    
                    // 修改密码后token 改变，类似退出登录，所以需要移除用户信息
                    // 登出
                    [QZConfig loginOut];
                    
                    [WeakSelf popToViewController:[QZUserCenterVC class]];
                }];
            }
            
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
    
}

- (void)setDefautUI{
    if(self.updatePwdType == QZLoginUpdatePwdTypeModifyPwd){
        self.title = @"设置新密码";
    }else {
        self.title = @"忘记密码";
    }
    self.top.constant = 10 * kScaleOfX;
    self.confirmBtnTop.constant = 90 * kScaleOfX;
    
    self.pwdInputView.inputType = QZInputViewTypeInputPwd;
    
    self.confirmPwdInputView.inputType = QZInputViewTypeInputPwd;
    self.confirmPwdInputView.lineViewIsHidden = YES;
    self.confirmPwdInputView.inputTextField.placeholder = @"确认新密码";

    
    [self.confirmBtn title:@"确认" titleColor:[UIColor whiteColor] titleFont:[UIFont textCustomFont18] backgroundColor:[UIColor colorWith0x4180E9]];
    [self.confirmBtn styleWithCornerRadius:kRadiusWidthWithBtn];


}
- (IBAction)confirmBtnAction:(id)sender {
    NSLog(@"=-----点击了确认");
    [self configNewPassword];
}

- (void)dealloc {
    NSLog(@"释放啦！！");
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
