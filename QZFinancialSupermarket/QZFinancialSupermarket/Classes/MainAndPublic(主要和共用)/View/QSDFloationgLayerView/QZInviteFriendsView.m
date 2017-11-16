//
//  QZInviteFriendsView.m
//  QZFinancialSupermarket
//
//  Created by wzh on 17/3/16.
//
//

#import "QZInviteFriendsView.h"
//#import <TencentOpenAPI/QQApiInterface.h>
//#import <UMSocialCore/UMSocialCore.h>
//#import "WXApi.h"
//#import "WeiboSDK.h"

@interface QZInviteFriendsView ()

@property (nonatomic, strong) NSMutableArray *titleArray;

@end


@implementation QZInviteFriendsView

- (NSMutableArray *)titleArray{
    if(!_titleArray){
        _titleArray = [NSMutableArray array];
    }
    return _titleArray;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUI];
    }
    return self;
}
- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self setUI];
    }
    return self;
}
- (void)setUI{
    [[NSBundle mainBundle] loadNibNamed:@"QZInviteFriendsView" owner:self options:nil];
    [self addSubview:self.view];
    [self setDefatUI];
}

- (void)setDefatUI{
    self.view.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.7];
    self.topIconImageVIew.image = [UIImage imageNamed:@"有礼-"];
    [self.closeBtn setImage:[UIImage imageNamed:@"还款详情关闭"] forState:UIControlStateNormal];
    self.desLab.text = @"分享到";
    self.desLab.textColor = [UIColor colorWith0xffffff];
    self.desLab.font = [UIFont textCustomFont20];
    
    self.lineView.backgroundColor = [UIColor colorWith0xd7d7d7];
    [self setShareBtnUI];
    self.isDynamicShare = NO;
}

- (void)setShareBtnUI{
    //已经安装wx
//    if([WXApi isWXAppInstalled]){
//        [self.titleArray addObject:@"微信"];
//        [self.titleArray addObject:@"朋友圈"];
//        
//    }
//    //已经安装qq
//    if ([QQApiInterface isQQInstalled]){
//        [self.titleArray addObject:@"QQ"];
//    }
    
    [self.titleArray addObject:@"微博"];
    
    for (int i = 0; i < self.titleArray.count; i ++) {

        UIButton *button = self.shareBtnArray[i];
        button.hidden = NO;
        UIImage *image = [UIImage imageNamed:self.titleArray[i]];
        if(kIphone5x_4_0 || kIphone4x_3_5){
            image = [UIImage scaleImage:image toScale:kScaleOfX];
        }
        [button setImage:image forState:UIControlStateNormal];
        [button setTitle:self.titleArray[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor colorWith0xffffff] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont textCustomFont12];
        [button layoutButtonWithEdgeInsetsStyle:ZH_ButtonEdgeInsetsStyleTop];
    
    }
    //    //已经安装新浪微博
    //    if([WeiboSDK isWeiboAppInstalled]){
    //
    //    }
}
- (IBAction)closeBtnClicked:(id)sender {
    [self.topIconImageVIew.layer removeAllAnimations];
    [self removeFromSuperview];
}
- (IBAction)shareBtnClicked:(UIButton *)sender {
    
    NSString *currentTitle = [sender currentTitle];
    NSString *shareTitle = @"我刚刷脸就直接取现了，不服你来试！";
    NSString *shareContent = @"注册就可刷脸，刷脸就能取现，你脸这么大还怕拿不到钱？";
    NSString *shareIcon = @"分享icon";
//    NSString *shareURL = [QZUrlTool getShareUrl];
    if(self.isDynamicShare == YES){
//        shareURL = [NSString stringWithFormat:@"%@",self.shareDic[@"url"]];
        shareTitle = [NSString stringWithFormat:@"%@",self.shareDic[@"title"]];
        shareContent = [NSString stringWithFormat:@"%@",self.shareDic[@"content"]];
        if([ZHTool isNONUllOrIsEmptyWith:self.shareDic[@"iconUrl"]]){
            shareIcon = [NSString stringWithFormat:@"%@",self.shareDic[@"iconUrl"]];
        }
    }
    
//    UMSocialPlatformType  platformType = UMSocialPlatformType_UnKnown;
//    if([currentTitle isEqual:@"微信"]){
//        platformType = UMSocialPlatformType_WechatSession;
//    }else if ([currentTitle isEqual:@"朋友圈"]){
//        platformType = UMSocialPlatformType_WechatTimeLine;
//    }else if ([currentTitle isEqual:@"QQ"]){
//        platformType = UMSocialPlatformType_QQ;
//    }else if ([currentTitle isEqual:@"微博"]){
//        platformType = UMSocialPlatformType_Sina;
//    }
//    UMSocialMessageObject *messageObject = [self shareToTitle:shareTitle content:shareContent icon:shareIcon shareUrl:shareURL platformType:platformType isIconUrl:self.isDynamicShare];
//    [[UMSocialManager defaultManager] shareToPlatform:platformType messageObject:messageObject currentViewController:self completion:^(id result, NSError *error) {
//        if (!error) {
//            [self showSuccessWithStatus:QZShareSuccessful];
//            [self loadDataShareSuccessfulTag];
//            if([self.delegate respondsToSelector:@selector(shareSuccessfulWithView:)]){
//                [self.delegate shareSuccessfulWithView:self];
//            }
//        } else {
//            [self showHudWithHint:QZShareFailure];
//        }
//    }];
}


//- (UMSocialMessageObject *)shareToTitle:(NSString *)tilte content:(NSString *)content icon:(NSString *)icon shareUrl:(NSString *)shareUrl platformType:(UMSocialPlatformType)platformType isIconUrl:(BOOL)isIconUrl{
//    //创建分享消息对象
//    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
//    if(platformType == UMSocialPlatformType_Sina){
//        messageObject.text = [NSString stringWithFormat:@"%@   %@%@",tilte,content,shareUrl];
//        //创建图片内容对象
//        UMShareImageObject *shareObject = [[UMShareImageObject alloc] init];
//        
//        if(self.isDynamicShare){
//            NSData* imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:icon]];
//            UIImage *image = [[UIImage alloc]initWithData:imageData];
//            [shareObject setShareImage:image];
//        }else{
//            [shareObject setShareImage:[UIImage imageNamed:icon]];
//        }
//        messageObject.shareObject = shareObject;
//    }else if (platformType == UMSocialPlatformType_WechatSession ||
//              platformType == UMSocialPlatformType_WechatTimeLine ||
//              platformType == UMSocialPlatformType_QQ){
//        //创建网页内容对象
//        
//        UIImage *iconImage = nil;
//        if(self.isDynamicShare){
//            NSData* imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:icon]];
//            UIImage *image = [[UIImage alloc]initWithData:imageData];
//            iconImage = image;
//        }else{
//            iconImage = [UIImage imageNamed:icon];
//        }
//
//        UMShareWebpageObject *shareObject = [UMShareWebpageObject shareObjectWithTitle:tilte descr:content thumImage:iconImage];
//        //设置网页地址
//        shareObject.webpageUrl = shareUrl;
//        
//        //分享消息对象设置分享内容对象
//        messageObject.shareObject = shareObject;
//    }
//    return messageObject;
//}
- (void)loadDataShareSuccessfulTag{
    NSString *activeId = self.shareDic[@"activeId"];
    if(![ZHTool isNUllOrIsEmptyWith:activeId]){
        NSMutableDictionary *mutDic = [NSMutableDictionary dictionary];
        [mutDic setObject:[ZHTool strongConversionWith:activeId] forKey:@"activeId"];
//        [QZProcessTheDataTool getShareSuccessfulTagWithParams:mutDic block:^(ZHBaseModel *dataModel, NSError *error) {}];
    }
}
- (void)layoutSubviews{
    [super layoutSubviews];
    //    self.bgLayerView.frame = self.bounds;
    self.view.frame = self.bounds;
    
}
@end
