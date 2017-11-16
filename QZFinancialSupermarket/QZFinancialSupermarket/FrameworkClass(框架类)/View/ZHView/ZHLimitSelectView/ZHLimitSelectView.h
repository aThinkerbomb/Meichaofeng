//
//  ZHLimitSelectView.h
//  QZFinancialSupermarket
//
//  Created by wzh on 2017/6/19.
//
//

#import <UIKit/UIKit.h>

@class ZHLimitSelectView;
@protocol ZHLimitSelectViewDataSource <NSObject>
@required

- (NSInteger)numberOfItemsInLimitSelectView:(ZHLimitSelectView *)limitSelectView;
- (UIView *)limitSelectView:(ZHLimitSelectView *)limitSelectView viewForItemAtIndex:(NSInteger)index;



@end

@protocol ZHLimitSelectViewDelegate <NSObject>
@optional

- (void)limitSelectView:(ZHLimitSelectView *)limitSelectView didSelectItemAtIndex:(NSInteger)index;
- (void)changeValueWithlimitSelectView:(ZHLimitSelectView *)limitSelectView index:(NSInteger)index;

@end
@interface ZHLimitSelectView : UIView
- (void)reloadData;
@property (nonatomic, strong) UIColor *bgStytleBorderColor;

@property (nonatomic, assign) NSInteger itemCount;

@property (nonatomic, weak) IBOutlet id<ZHLimitSelectViewDataSource> dataSource;
@property (nonatomic, weak) IBOutlet id<ZHLimitSelectViewDelegate> delegate;

- (void)setDefautValueWithIndex:(NSInteger)index;

@end
