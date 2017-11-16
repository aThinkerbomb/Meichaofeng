//
//  QZHomeAdvertCell.m
//  QZFinancialSupermarket
//
//  Created by 张宇轩 on 2017/11/1.
//  Copyright © 2017年 wzh. All rights reserved.
//

#import "QZHomeAdvertCell.h"
#import "SGAdvertScrollView.h"
#import "QZHomeAdvertModel.h"
@interface QZHomeAdvertCell () <SGAdvertScrollViewDelegate>
@property (weak, nonatomic) IBOutlet SGAdvertScrollView *advertView;

@end


@implementation QZHomeAdvertCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)setDefautUI {
    self.backgroundColor = [UIColor whiteColor];
}

- (void)setDataArray:(NSArray *)dataArray {
    NSArray * array = [dataArray[0] objectForKey:Single];
    if (array.count > 0) {
      
        NSMutableArray * titles = [NSMutableArray array];
        for (QZHomeAdvertModel *model in array) {
     
            // 拼接公告字符串 设置颜色
            NSString * phone = [QZConfig getHandlePhone:model.mobile];
            NSString * str = [NSString stringWithFormat:@"%@在%@成功贷款%@元", phone, model.name, model.money];
            NSMutableAttributedString * attriStr = [[NSMutableAttributedString alloc] initWithString:str];
            [attriStr addAttribute:NSForegroundColorAttributeName value:[UIColor colorWith0xFe5F19] range:NSMakeRange(phone.length+1, model.name.length)];
            [attriStr addAttribute:NSForegroundColorAttributeName value:[UIColor colorWith0xFe5F19] range:NSMakeRange(str.length-1-model.money.length, model.money.length)];
            [titles addObject:attriStr];
        }
        _advertView.delegate = self;
        _advertView.titles = titles;
        
    }
    
}

- (void)advertScrollView:(SGAdvertScrollView *)advertScrollView didSelectedItemAtIndex:(NSInteger)index{
    NSLog(@"---%ld", (long)index);
    if (self.delegate && [self.delegate respondsToSelector:@selector(homeClickedAdvertAtIndex:)]) {
        [self.delegate homeClickedAdvertAtIndex:index];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
