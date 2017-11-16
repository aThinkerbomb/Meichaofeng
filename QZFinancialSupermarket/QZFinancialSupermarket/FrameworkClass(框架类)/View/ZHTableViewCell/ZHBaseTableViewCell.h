//
//  QZBaseTableViewCell.h
//  QZFinancialSupermarket
//
//  Created by wzh on 17/3/13.
//
//

#import <UIKit/UIKit.h>
#import "ZHBaseCellModel.h"
@interface ZHBaseTableViewCell : UITableViewCell

@property (nonatomic, strong) NSArray *dataArray;
@property (nonatomic, assign) NSIndexPath *indexPath;
@property (nonatomic, assign) NSInteger count;
@property (nonatomic, strong) ZHBaseCellModel *item;

- (void)setDefautUI;
@end
