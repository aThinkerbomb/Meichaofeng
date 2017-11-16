//
//  QZInviteFriendsView.h
//  QZFinancialSupermarket
//
//  Created by wzh on 17/3/16.
//
//

#import <UIKit/UIKit.h>
@class QZInviteFriendsView;
@protocol QZInviteFriendsViewDelegate <NSObject>

@optional
- (void)shareSuccessfulWithView:(QZInviteFriendsView *)view;

@end

@interface QZInviteFriendsView : UIView

@property (assign, nonatomic) BOOL isDynamicShare;
@property (strong , nonatomic) NSDictionary *shareDic;
@property (strong, nonatomic) IBOutlet UIView *view;
@property (weak, nonatomic) IBOutlet UIImageView *topIconImageVIew;
@property (weak, nonatomic) IBOutlet UILabel *desLab;
@property (weak, nonatomic) IBOutlet UIView *lineView;
@property (weak, nonatomic) IBOutlet UIButton *closeBtn;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *shareBtnArray;

@property (weak, nonatomic) __weak id<QZInviteFriendsViewDelegate>delegate;
@end
