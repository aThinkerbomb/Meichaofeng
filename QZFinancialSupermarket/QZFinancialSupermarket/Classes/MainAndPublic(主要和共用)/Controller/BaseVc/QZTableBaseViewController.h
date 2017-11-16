//
//  QZTableBaseViewController.h
//  QZFinancialSupermarket
//
//  Created by wzh on 17/3/13.
//
//

#import "QZBaseViewController.h"

@class ZHBaseTableViewCell;

@interface QZTableBaseViewController : QZBaseViewController<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) UITableView *tableView;

//默认 0
@property (nonatomic, assign) NSInteger pageNo;
//默认 0
@property (nonatomic, assign) NSInteger totalPage;
//如果YES dataArray元素为数组 
- (BOOL)isMoreSection;

- (CGFloat)tableViewX;
- (CGFloat)tableViewY;
- (CGFloat)navBarHeight;
- (CGFloat)statusBarHeight;
- (CGFloat)tabBarHeight;
- (CGFloat)otherViewHeight;
- (UITableViewStyle)tableViewStyle;
- (UIColor *)getTableViewBackdroundColor;
- (UIView *)tableHeaderView;
- (UIView *)tableFooterView;
-(BOOL)isSelectionStyleNone;
- (BOOL)isViscousWithsectionHeaderAndFooderView;

- (void)getCurrentCell:(ZHBaseTableViewCell *)cell;

//默认数据请求
- (void)loadDataList;
//刷新数据
- (void)reloadData;
//刷新新数据
-(void)setMJRefresh;
-(void)loadNewDataNoLoading;
//加载更多数据
-(void)setLoadMore;
-(void)loadMoreData;

- (void)endRefreshing;
@end
