//
//  QZGoToCommentsPageVC.m
//  QZFinancialSupermarket
//
//  Created by wzh on 2017/9/13.
//  Copyright © 2017年 wzh. All rights reserved.
//

#import "QZGoToCommentsPageVC.h"
#import "ZHTextView.h"
@interface QZGoToCommentsPageVC ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *top;
@property (weak, nonatomic) IBOutlet ZHTextView *inputTextView;
@property (weak, nonatomic) IBOutlet UIButton *nextBtn;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *nextBtnTop;

@end

@implementation QZGoToCommentsPageVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (BOOL)isNeedReachibityNetwork {
    return NO;
}

#pragma mark - 发布评论接口
- (void)sendComment {
    
    NSMutableDictionary * parameter = [NSMutableDictionary dictionary];
    
    NSString * content = self.inputTextView.text;
    NSString * userid = kGetObjectForKey(QZUserid);
    
    [parameter setValue:userid?:@"" forKey:@"userid"];
    [parameter setValue:@(self.commentType?:0) forKey:@"type"];
    [parameter setValue:@(self.commentId?:0) forKey:@"msgid"];
    [parameter setValue:content?:@"" forKey:@"content"];
    
    [QZAFNetwork postWithBaseURL:QZ_SEND_COMMENT_URL params:parameter success:^(NSURLSessionDataTask *task, id json) {
        
        if ([QZConfig checkResponseObject:json]) {
            [self showHint:@"评论成功" delayDo:^{
                [self back];
            }];
        }
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
    
}

#pragma mark - 意见反馈
- (void)sendFeedBack {
    
    NSMutableDictionary * parameter = [NSMutableDictionary dictionary];
    
    NSString * content = self.inputTextView.text;
    NSString * userid = kGetObjectForKey(QZUserid);
    
    [parameter setValue:userid?:@"" forKey:@"id"];
    [parameter setValue:content?:@"" forKey:@"content"];
    
    [QZAFNetwork postWithBaseURL:QZ_USER_FEEDBACK params:parameter success:^(NSURLSessionDataTask *task, id json) {
        
        if ([QZConfig checkResponseObject:json]) {
            [self showHint:@"意见反馈成功" delayDo:^{
                [self back];
            }];
        }
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
}



- (void)setDefautUI{
    if(self.enterType == QZEnterTypeTypeComments){
        self.title = @"评论";
        self.inputTextView.placehoder = @"请认真填写您的观点";

    }else if (self.enterType == QZEnterTypeTypeFeedback){
        self.title = @"意见反馈";
        self.inputTextView.placehoder = @"请认真填写您的意见";
    }
    
    self.inputTextView.placehoderColor = [UIColor colorWith0xCBCBCB];
    [self.inputTextView setFont:[UIFont textCustomFont15]];
    self.inputTextView.textColor = [UIColor colorWith0x333333];
    
    
    [self.nextBtn title:@"提交" titleColor:[UIColor whiteColor] titleFont:[UIFont textCustomFont18] backgroundColor:[UIColor colorWith0x4180E9]];
    [self.nextBtn styleWithCornerRadius:kRadiusWidthWithBtn];
}
- (IBAction)nextBtnAction:(id)sender {
    NSLog(@"点击了提交");
    
    if (self.enterType == QZEnterTypeTypeComments) {
        
        [self sendComment];
    } else if (self.enterType == QZEnterTypeTypeFeedback) {
        
        [self sendFeedBack];
    }
    
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
