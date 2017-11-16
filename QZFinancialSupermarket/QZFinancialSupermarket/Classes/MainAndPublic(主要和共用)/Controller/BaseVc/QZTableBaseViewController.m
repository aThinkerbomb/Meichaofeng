//
//  QZTableBaseViewController.m
//  QZFinancialSupermarket
//
//  Created by wzh on 17/3/13.
//
//

#import "QZTableBaseViewController.h"
#import "ZHBaseCellModel.h"
#import "ZHBaseTableViewCell.h"
#import "QZRefreshView.h"
@interface QZTableBaseViewController ()

@end

@implementation QZTableBaseViewController



- (UITableView *)tableView{
    if(!_tableView){
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake([self tableViewX], [self tableViewY], kScreenWidth,kScreenHeight - [self tabBarHeight]-[self navBarHeight]-[self statusBarHeight]-[self otherViewHeight]) style:[self tableViewStyle]];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.showsHorizontalScrollIndicator=NO;
        _tableView.showsVerticalScrollIndicator=NO;
        _tableView.backgroundColor=[self getTableViewBackdroundColor];
        _tableView.sectionFooterHeight = 0.0001;
        _tableView.tableHeaderView = [self tableHeaderView];
        _tableView.tableFooterView = [self tableFooterView];
        [self.view addSubview:_tableView];
        
    }
    return _tableView;
}

- (CGFloat)navBarHeight{
    return kNavBarAndStatusBarHeight - kStatusBarHeight;
}
- (CGFloat)statusBarHeight{
    return kStatusBarHeight;
}
- (CGFloat)tabBarHeight{
    return 0;
}
- (CGFloat)otherViewHeight{
    return 0;
}
- (CGFloat)tableViewX {
    return 0;
}
- (CGFloat)tableViewY {
    return 0;
}

- (void)getCurrentCell:(ZHBaseTableViewCell *)cell {
    
}
- (UITableViewStyle)tableViewStyle{
    return UITableViewStylePlain;
}
- (UIColor *)getTableViewBackdroundColor{
    return [UIColor clearColor];
}
- (UIView *)tableHeaderView{
    return nil;
}
- (UIView *)tableFooterView{
    return nil;
}
-(BOOL)isSelectionStyleNone
{
    return YES;
}
- (BOOL)isMoreSection{
    return NO;
}
- (BOOL)isViscousWithsectionHeaderAndFooderView{
    return YES;
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
//    self.pageNo = 1;
//    [self.dataArray removeAllObjects];
}

- (void)viewDidLoad{
    self.pageNo = 0;
    [super viewDidLoad];
    self.totalPage = 1;
    
}
- (void)loadNewData{
    [self loadDataList];
}
- (void)loadDataList{

}


-(void)setMJRefresh
{
    // 设置回调（一旦进入刷新状态，就调用target的action，也就是调用self的loadNewData方法）
    QZRefreshView *header = [QZRefreshView headerWithRefreshingTarget:self refreshingAction:@selector(loadNewDataNoLoading)];
    [header setImages];
    self.tableView.mj_header = header;
    
}
- (void)loadNewDataNoLoading
{
    self.pageNo = 0;
    NSLog(@"开始刷新");
    [self loadDataList];
}

- (void)setLoadMore{
    // 设置回调（一旦进入刷新状态，就调用target的action，也就是调用self的loadMoreData方法）
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
}
-(void)loadMoreData{
    if(self.pageNo+1 < self.totalPage){
        self.pageNo ++;
        [self loadDataList];
    }else{
        [self showHint:QZAlreadyLastPage];
        [self endRefreshing];
    }
}
- (void)endRefreshing{
    [self.tableView.mj_footer endRefreshing];
    [self.tableView.mj_header endRefreshing];
}


- (void)reloadData{
    [self.tableView reloadData];
    
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{

    if([self isViscousWithsectionHeaderAndFooderView] == NO && self.tableHeaderView){
        CGFloat sectionHeaderHeight = self.tableHeaderView.height;
        if (scrollView.contentOffset.y <= sectionHeaderHeight && scrollView.contentOffset.y >= 0) {
            scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
        }
        else if (scrollView.contentOffset.y >= sectionHeaderHeight) {
            scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, 0, 0);
        }
    }
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if([self isMoreSection]){
        return self.dataArray.count;
    }else{
        return 1;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if([self isMoreSection]){
        id sectionObj = self.dataArray[section];
        if ([sectionObj isKindOfClass:[NSArray class]]) {
            return [(NSArray *)sectionObj count];
        } else {
            return 1;
        }
    }else{
        return self.dataArray.count;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if([self isMoreSection]){
        id sectionObj = self.dataArray[indexPath.section];
        if ([sectionObj isKindOfClass:[NSArray class]]) {
            ZHBaseCellModel *itemModel = [sectionObj objectAtIndex:indexPath.row];
            return itemModel.cellHeight;
        } else {
            if ([sectionObj isKindOfClass:[NSDictionary class]]) {
                NSArray * array =  [sectionObj objectForKey:Single];
                ZHBaseCellModel * itemModel = [array objectAtIndex:indexPath.row];
                return itemModel.cellHeight;
            } else if ([sectionObj isKindOfClass:[ZHBaseCellModel class]]) {
                ZHBaseCellModel *itemModel = [self.dataArray objectAtIndex:indexPath.row];
                return itemModel.cellHeight;
            } else {
                return 100;
            }
            
        }
    }else{
        ZHBaseCellModel *itemModel = [self.dataArray objectAtIndex:indexPath.row];
        return itemModel.cellHeight;
    }

}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ZHBaseCellModel *itemModel = nil;
    if([self isMoreSection]){
//        NSArray *sectionArray = self.dataArray[indexPath.section];
//        itemModel = [sectionArray objectAtIndex:indexPath.row];
        
        id sectionObj = self.dataArray[indexPath.section];
        if ([sectionObj isKindOfClass:[NSArray class]]) {
            itemModel = [sectionObj objectAtIndex:indexPath.row];
        } else {
            if ([sectionObj isKindOfClass:[NSDictionary class]]) {
                NSArray * array =  [sectionObj objectForKey:Single];
                itemModel = [array objectAtIndex:indexPath.row];
                
            } else if ([sectionObj isKindOfClass:[ZHBaseCellModel class]]) {
                itemModel = [self.dataArray objectAtIndex:indexPath.row];
                
            }
            
        }

    }else{
        itemModel = [self.dataArray objectAtIndex:indexPath.row];
    }
    
    NSString *cellClassName = [self getCellClassNameWithItem:itemModel];
    ZHBaseTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellClassName];
    
    if (!cell) {
        if ([[NSBundle mainBundle] pathForResource:cellClassName ofType:@"nib"] != nil) {
            cell = [[[NSBundle mainBundle] loadNibNamed:cellClassName owner:self options:0] objectAtIndex:0];
            
        }else{
            cell = [[NSClassFromString(cellClassName) alloc]initWithStyle: UITableViewCellStyleDefault reuseIdentifier:cellClassName];
        }
    }
    
    if ([self isSelectionStyleNone]) {
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    if ([itemModel isKindOfClass:[ZHBaseCellModel class]]) {
        cell.indexPath = indexPath;
        cell.dataArray = self.dataArray;
        cell.count = self.dataArray.count;
        cell.item = itemModel;
        [self getCurrentCell:cell];
    }
   
    return cell;
}

- (NSString *)getCellClassNameWithItem:(ZHBaseCellModel *)item{
    
    NSString *cellClassName = [item cellClassName];
    if ((cellClassName && ![cellClassName isEqualToString:@"default"]) || cellClassName == nil) {
        return cellClassName;
    }
    cellClassName = NSStringFromClass([self class]);
    if ([cellClassName containsString:@"Controller"]) {
        cellClassName = [cellClassName stringByReplacingOccurrencesOfString:@"Controller" withString:@"Cell"];
        return cellClassName;
    }
    
    return nil;
}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
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
