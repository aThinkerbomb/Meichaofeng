//
//  QZMyCommentsListPageVC.m
//  QZFinancialSupermarket
//
//  Created by wzh on 2017/9/13.
//  Copyright © 2017年 wzh. All rights reserved.
//

#import "QZMyCommentsListPageVC.h"
#import "QZMyCommentsListCellItem.h"
#import "QZMyCommentsListCellItem2.h"
#import "QZMyCommentsListCell.h"
#import "QZMyCommentSectionView.h"
#import "QZRefreshView.h"

static NSString *commentCellIdentifier = @"QZMyCommentsListCell";

@interface QZMyCommentsListPageVC ()
{
    NSInteger oldPage;
}
@property (nonatomic, strong) QZMyCommentSectionView *commentSectionView;

@end

@implementation QZMyCommentsListPageVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (UITableViewStyle)tableViewStyle {
    return UITableViewStyleGrouped;
}

- (void)setDefautUI {
    
    self.title = @"我的评论";
    
    [self.tableView registerNib:[UINib nibWithNibName:@"QZMyCommentsListCell" bundle:nil] forCellReuseIdentifier:commentCellIdentifier];
    
    self.pageNo = 1;
    oldPage = 1;
    QZRefreshView *header = [QZRefreshView headerWithRefreshingTarget:self refreshingAction:@selector(loadDataList)];
    [header setImages];
    self.tableView.mj_header = header;
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
}


- (void)loadMoreData {
    self.pageNo++;
    [self requestMyComments];
}


- (void)loadDataList {
    self.pageNo = 1;
    oldPage = 1;
    [self requestMyComments];
    
}

- (void)requestMyComments {
    NSString *userid = kGetObjectForKey(QZUserid);
    
    NSDictionary *parameter = @{@"id": userid, @"page":@(self.pageNo?:0)};
    [QZAFNetwork postWithBaseURL:QZ_MY_COMMENT_URL params:parameter success:^(NSURLSessionDataTask *task, id json) {
        
        if ([QZConfig checkResponseObject:json]) {
            
            NSArray *array = [NSArray yy_modelArrayWithClass:[QZMyCommentsListCellItem class] json:json[@"data"]];
            
            if (self.pageNo > oldPage && array.count == 0) {
                // 提示已经没有数据了
                [self showHint:QZAlreadyLastPage];
                [self endRefreshing];
                self.pageNo--;
                
            } else if (self.pageNo > oldPage && array.count >  0) {
                // 加载更多数据
                for (QZMyCommentsListCellItem * commentModel  in array) {
                    [self.dataArray addObject:commentModel];
                }
                
                // 旧页数增加 （不要忘记哦）
                oldPage++;
                
            } else {
                //设置数据源 刷新
                [self.dataArray removeAllObjects];
                self.dataArray = [NSMutableArray arrayWithArray:array];
            }
            
            [self.tableView reloadData];
        }
        
        [self endRefreshing];
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        [self endRefreshing];
    }];
}

- (UIView *)tableHeaderView {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 0.001)];
    return view;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataArray.count;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    QZMyCommentsListCellItem *commentModel = self.dataArray[section];
    return commentModel.list.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    QZMyCommentsListCell * cell = [tableView dequeueReusableCellWithIdentifier:commentCellIdentifier forIndexPath:indexPath];
    QZMyCommentsListCellItem * commentModel = self.dataArray[indexPath.section];
    QZMyCommentsListCellItem2 * commentListModel = commentModel.list[indexPath.row];
    cell.item = commentListModel;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    QZMyCommentsListCellItem * commentModel = self.dataArray[indexPath.section];
    QZMyCommentsListCellItem2 * commentListModel = commentModel.list[indexPath.row];
    NSString *des = commentListModel.content;
    CGFloat height = [self getHeightOfRowWithString:des];
    return height;

}




- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    self.commentSectionView = [[[NSBundle mainBundle] loadNibNamed:@"QZMyCommentSectionView" owner:self options:nil] lastObject];
    QZMyCommentsListCellItem *commentModel = self.dataArray[section];
    CGFloat height = [self getheightOfSectionWithString:commentModel.title];
    [self.commentSectionView setFrame:CGRectMake(0, 0, kScreenWidth, height)];
    self.commentSectionView.commentModel = commentModel;
    return self.commentSectionView;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    QZMyCommentsListCellItem *commentModel = self.dataArray[section];
    CGFloat height = [self getheightOfSectionWithString:commentModel.title];
    return height;
}



- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (self.dataArray.count - 1 == section) {
        return 0.0001;
    }
    return 8 * kScaleOfX;
}

/**
 计算 section 的高度

 @param string 评论title字符串
 */
- (CGFloat)getheightOfSectionWithString:(NSString *)string {
    
    CGFloat height = (20 * kScaleOfX  + [ZHTool sizeWithString_H:string font:[UIFont textCustomFont15] width:kScreenWidth - (45 * kScaleOfX + 35 *kScaleOfX)] + 20 *kScaleOfX + 0.5);
    return height;
    
}

/**
 计算 Row 的高度
 
 @param string 评论content字符串
 */
- (CGFloat)getHeightOfRowWithString:(NSString *)string {
    CGFloat height = 10 *kScaleOfX + [ZHTool sizeWithString_H:string font:[UIFont textCustomFont12] width:kScreenWidth - 65 *kScaleOfX - 30 *kScaleOfX] +15 *kScaleOfX + 15 + 15 *kScaleOfX;
    return height;
}


-(void)dealloc {
    NSLog(@"释放啦啦啦啦～～");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
