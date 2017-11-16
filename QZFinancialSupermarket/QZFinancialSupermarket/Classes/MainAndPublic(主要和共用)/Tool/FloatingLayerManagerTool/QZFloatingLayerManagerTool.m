//
//  QZFloatingLayerManagerTool.m
//  QZFinancialSupermarket
//
//  Created by wzh on 17/3/13.
//
//

#import "QZFloatingLayerManagerTool.h"

@implementation QZFloatingLayerManagerTool
//+ (QZAccountPromptView *)showAccountPromptView:(UIView *)containerView{
//   return [self showAccountPromptViewView:containerView animated:NO];
//}
//
//+ (QZAccountPromptView *)showAccountPromptViewView:(UIView *)containerView animated:(BOOL)animated{
//    QZAccountPromptView *accountPromptView = [[QZAccountPromptView alloc]initWithFrame:[UIScreen mainScreen].bounds];
//    if(animated){
//        [accountPromptView.contentView.layer addBeatingAnimationWithDuration:0.5];
//    }
//    [containerView addSubview:accountPromptView];
//    return accountPromptView;
//}
//
//+ (QZInviteFriendsView *)showInviteFirendsView:(UIView *)containerView{
//    return [self showInviteFirendsView:containerView animated:NO];
//}
//+ (QZInviteFriendsView *)showInviteFirendsView:(UIView *)containerView animated:(BOOL)animated{
//    QZInviteFriendsView *inviteFirendsView = [[QZInviteFriendsView alloc]initWithFrame:[UIScreen mainScreen].bounds];
//    if(animated){
//        [inviteFirendsView.topIconImageVIew.layer addBeatingAnimationWithDuration:0.5];
//    }
//    [containerView addSubview:inviteFirendsView];
//    return inviteFirendsView;
//}
//
//+ (QZCouponRuleView *)showCouponRuleView:(UIView *)containerView{
//    return [self showCouponRuleView:containerView animated:NO];
//}
//+ (QZCouponRuleView *)showCouponRuleView:(UIView *)containerView animated:(BOOL)animated{
//    QZCouponRuleView *couponRuleView = [[QZCouponRuleView alloc]initWithFrame:[UIScreen mainScreen].bounds];
//    if(animated){
//        [couponRuleView.contentView.layer addBeatingAnimationWithDuration:0.5];
//    }
//    [containerView addSubview:couponRuleView];
//    return couponRuleView;
//}
//+ (QZHisRecDetailView *)showBorrowingHisRecDetailView:(UIView *)containerView listArray:(NSArray *)listArray{
//    return [self showBorrowingHisRecDetailView:containerView animated:NO listArray:listArray];
//}
//+ (QZHisRecDetailView *)showBorrowingHisRecDetailView:(UIView *)containerView animated:(BOOL)animated listArray:(NSArray *)listArray{
//    return [self showHisRecDetailView:containerView animated:animated listArray:listArray type:QZHisRecDetailViewTypeReimbursement];
//
//}
//+ (QZHisRecDetailView *)showReimbursementHisRecDetailView:(UIView *)containerView listArray:(NSArray *)listArray{
//    return [self showReimbursementHisRecDetailView:containerView animated:NO listArray:listArray];
//
//}
//
//+ (QZHisRecDetailView *)showReimbursementHisRecDetailView:(UIView *)containerView animated:(BOOL)animated listArray:(NSArray *)listArray{
//    return [self showHisRecDetailView:containerView animated:animated listArray:listArray type:QZHisRecDetailViewTypeBorrowing];
//}
//
//+ (QZHisRecDetailView *)showHisRecDetailView:(UIView *)containerView animated:(BOOL)animated listArray:(NSArray *)listArray type:(QZHisRecDetailViewType)type{
//    QZHisRecDetailView *hisRecDetailView = [[QZHisRecDetailView alloc]initWithFrame:[UIScreen mainScreen].bounds listArray:listArray andType:type];
//    if(animated){
//        [hisRecDetailView.contentView.layer addBeatingAnimationWithDuration:0.5];
//    }
//    [containerView addSubview:hisRecDetailView];
//    return hisRecDetailView;
//}
//
//+ (QZServerCodeInstruView *)showServerCodeInstruView:(UIView *)containerView{
//    return [self showServerCodeInstruView:containerView animated:NO];
//}
//
//+ (QZServerCodeInstruView *)showServerCodeInstruView:(UIView *)containerView animated:(BOOL)animated{
//    QZServerCodeInstruView *serverCodeInstruView = [[QZServerCodeInstruView alloc]initWithFrame:[UIScreen mainScreen].bounds];
//    if(animated){
//        [serverCodeInstruView.contentView.layer addBeatingAnimationWithDuration:0.5];
//    }
//    [containerView addSubview:serverCodeInstruView];
//    return serverCodeInstruView;
//}
//
//
//+ (QZActivityView *)showActivityView:(UIView *)containerView{
//    return [self showActivityView:containerView animated:NO];
//    
//}
//
//+ (QZActivityView *)showActivityView:(UIView *)containerView animated:(BOOL)animated{
//    QZActivityView *showActivityView = [[QZActivityView alloc]initWithFrame:[UIScreen mainScreen].bounds];
//    if(animated){
//        [showActivityView.contentView.layer addBeatingAnimationWithDuration:0.5];
//    }
//    [containerView addSubview:showActivityView];
//    return showActivityView;
//}
//
//+ (QZQrCodeView *)showQrCodeView:(UIView *)containerView model:(QZUserCenterDataModel *)model{
//    return [self showQrCodeView:containerView animated:NO model:model];
//
//}
//+ (QZQrCodeView *)showQrCodeView:(UIView *)containerView animated:(BOOL)animated model:(QZUserCenterDataModel *)model{
//    QZQrCodeView *qrCodeView = [[QZQrCodeView alloc]initWithFrame:[UIScreen mainScreen].bounds];
//    qrCodeView.model = model;
//    if(animated){
//        [qrCodeView.contentView.layer addBeatingAnimationWithDuration:0.5];
//    }
//    [containerView addSubview:qrCodeView];
//    return qrCodeView;
//}
//
//
//+ (QZBillPageFreeDetailView *)showBillPageFreeDetailView:(UIView *)containerView listArray:(NSArray *)listArray{
//    return [self showBillPageFreeDetailView:containerView animated:NO listArray:listArray];
//}
//+ (QZBillPageFreeDetailView *)showBillPageFreeDetailView:(UIView *)containerView animated:(BOOL)animated listArray:(NSArray *)listArray{
//    QZBillPageFreeDetailView *billPageDetailView = [[QZBillPageFreeDetailView alloc]initWithFrame:[UIScreen mainScreen].bounds listArray:listArray];
//    if(animated){
//        [billPageDetailView.contentView.layer addBeatingAnimationWithDuration:0.5];
//    }
//    [containerView addSubview:billPageDetailView];
//    return billPageDetailView;
//}
//+ (QZNewUserAlertView *)showNewUserAlertView:(UIView *)containerView{
//    return [self showNewUserAlertView:containerView animated:NO];
//}
//+ (QZNewUserAlertView *)showNewUserAlertView:(UIView *)containerView animated:(BOOL)animated{
//    QZNewUserAlertView *newUserAlertView = [[QZNewUserAlertView alloc]initWithFrame:[UIScreen mainScreen].bounds];
//    if(newUserAlertView){
//        [newUserAlertView.imageViewBtn.layer addBeatingAnimationWithDuration:0.5];
//    }
//    [containerView addSubview:newUserAlertView];
//    return newUserAlertView;
//}
@end
