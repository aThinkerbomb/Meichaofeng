//
//  QZRegisteredPageVC.m
//  QZFinancialSupermarket
//
//  Created by wzh on 2017/9/12.
//  Copyright © 2017年 wzh. All rights reserved.
//

#import "QZRegisteredPageVC.h"
#import "QZInputView.h"
#import <TTTAttributedLabel.h>
@interface QZRegisteredPageVC ()<QZInputViewDelegate,TTTAttributedLabelDelegate>
@property (weak, nonatomic) IBOutlet QZInputView *phoneInputView;
@property (weak, nonatomic) IBOutlet QZInputView *smsCodeInputView;
@property (weak, nonatomic) IBOutlet QZInputView *pwdInputView;
@property (weak, nonatomic) IBOutlet UIButton *registeredBtn;
@property (weak, nonatomic) IBOutlet TTTAttributedLabel *desLab;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *top;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *regisBtnTop;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *desLabTop;

@property (nonatomic, strong) NSTimer * timer;

@end

@implementation QZRegisteredPageVC
{
    int downTime;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    downTime = 60;
}

#pragma mark - 注册 获取手机号验证码
- (void)getPhoneVerCode {
    
    NSString * phone = [self.phoneInputView getInputText];
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    
    [dic setValue:@"注册" forKey:@"msg"];
    [dic setValue:phone?:@"" forKey:@"mobile"];
    
    [QZAFNetwork postWithBaseURL:QZ_REGISTER_PHONE_VERCODE params:dic success:^(NSURLSessionDataTask *task, id json) {
        
        // 获取验证码成功
        if ([QZConfig checkResponseObject:json]) {
            
            [self showSuccessStatus:json[@"message"]];
            
            [self.smsCodeInputView.rightBtn setTitle:@"发送中..." forState:UIControlStateNormal];
            __weak typeof(self)WeakSelf = self;
            self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:WeakSelf selector:@selector(downTime) userInfo:nil repeats:YES];
            
        }
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
    }];
}

#pragma mark - 注册账号接口
- (void)registerAccount {

    // 系统的获取uuid 会在删掉应用后变,只有保存在keyChain里面下次安装应用的时候从里面取出来，才会保持不变，所以用了FCUUID三方
//    NSString *uuid = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
    
    // uuidForDevice在抹掉手机的时候才会变，其他情况不会变。uuid方法也会改变
    NSString *uuid = [FCUUID uuidForDevice];
    
    NSString *ip = [QZTool getIPAddress];
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:[self.phoneInputView getInputText] forKey:@"mobile"];
    [params setValue:[self.smsCodeInputView getInputText] forKey:@"phmsg"];
    [params setValue:[self.pwdInputView getInputText] forKey:@"password"];
    [params setValue:uuid?:@"" forKey:@"phoneid"];
    [params setValue:ip?:@"" forKey:@"ip"];
    
    [QZAFNetwork postWithBaseURL:QZ_REGISTER_ACCOUNT params:params success:^(NSURLSessionDataTask *task, id json) {
        
        if ([QZConfig checkResponseObject:json]) {
            [self showSuccessStatusa:json[@"message"] delayDo:^{
                [self back];
            }];
            
        }
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
    
}

- (void)setDefautUI{
    self.title = @"注册";
    self.top.constant = 10 * kScaleOfX;
    self.regisBtnTop.constant = 90 * kScaleOfX;
    self.desLabTop.constant = 30 * kScaleOfX;
    
    self.phoneInputView.inputType = QZInputViewTypeInputPhone;
    
    self.smsCodeInputView.delegate = self;
    self.smsCodeInputView.inputType = QZInputViewTypeInputDigitalCode;
    
    self.pwdInputView.lineViewIsHidden = YES;
    self.pwdInputView.inputType = QZInputViewTypeInputPwd;
    
    
    [self.registeredBtn title:@"注册" titleColor:[UIColor whiteColor] titleFont:[UIFont textCustomFont18] backgroundColor:[UIColor colorWith0x4180E9]];
    [self.registeredBtn styleWithCornerRadius:kRadiusWidthWithBtn];
    
    [self.desLab textColor:[UIColor colorWith0x858685] textFont:[UIFont textCustomFont12]];
    NSString *desStr = @"点击注册即代表同意没钞蜂《注册协议》";
    NSString *subStr = @"《注册协议》";
    self.desLab.text = desStr;
    self.desLab.verticalAlignment = TTTAttributedLabelVerticalAlignmentCenter;
    self.desLab.delegate = self;
    
    
    
    self.desLab.linkAttributes = [NSDictionary dictionaryWithObject:[NSNumber numberWithBool:NO] forKey:(NSString *)kCTUnderlineStyleAttributeName];
    self.desLab.activeLinkAttributes = [NSDictionary dictionaryWithObject:[UIColor colorWith0x4180E9] forKey:(NSString *)kCTForegroundColorAttributeName];
    [self.desLab setText:self.desLab.text afterInheritingLabelAttributesAndConfiguringWithBlock:^ NSMutableAttributedString *(NSMutableAttributedString*mutableAttributedString){
        NSRange boldRange = [[mutableAttributedString string] rangeOfString:subStr options:NSCaseInsensitiveSearch];
        [mutableAttributedString addAttribute:(NSString*)kCTForegroundColorAttributeName value:(id)[[UIColor colorWith0x4180E9] CGColor] range:boldRange];
        return mutableAttributedString;
    }];
    //正则
    [self.desLab addLinkToURL:nil withRange:[desStr rangeOfString:subStr]];
}

- (IBAction)registeredBtnAction:(id)sender {
    NSLog(@"----注册");
    
    [self registerAccount];
    
}
- (void)rightActionWithBtn:(ZHVerCodeButton *)btn view:(QZInputView *)inputView{
    if(inputView == self.smsCodeInputView){
        NSLog(@"-发送验证码");
        
        [self getPhoneVerCode];
        
    }
}
- (void)attributedLabel:(__unused TTTAttributedLabel *)label didSelectLinkWithURL:(NSURL *)url{
    NSLog(@"点击了注册协议");
}
- (void)attributedLabel:(TTTAttributedLabel *)label didSelectLinkWithTextCheckingResult:(NSTextCheckingResult *)result{
    NSLog(@"didSelectLinkWithTextCheckingResult");

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

- (void)back {
    [super back];
    [self.timer invalidate];
    self.timer = nil;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    NSLog(@"释放啦～～～");
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
