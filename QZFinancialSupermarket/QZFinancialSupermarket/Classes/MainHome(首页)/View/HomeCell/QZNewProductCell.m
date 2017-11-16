//
//  QZNewProductCell.m
//  QZFinancialSupermarket
//
//  Created by 张宇轩 on 2017/10/31.
//  Copyright © 2017年 wzh. All rights reserved.
//

#import "QZNewProductCell.h"
#import "NewProductView.h"
#import "ProgressView.h"
#import "HomeNewProductModel.h"


#define productViewWidth (120 * kScaleOfX)
#define productViewHeight (122 * kScaleOfX)
#define progressWidth (50 * kScaleOfX)

@interface QZNewProductCell() <UIScrollViewDelegate>
{
    NSInteger _dataCount;
}
@property (nonatomic, strong) UIScrollView * scrollView;
@property (nonatomic, strong) NewProductView * productView;
@property (nonatomic, strong) ProgressView * progressView;

@property (nonatomic, strong)NSArray * arr;
@end


@implementation QZNewProductCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setDefautUI {
    
}

- (void)setDataArray:(NSArray *)dataArray {
    __block NSUInteger index = 1;
    [dataArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:[NSDictionary class]]) {
            if ([[obj objectForKey:Single] isKindOfClass:[NSArray class]]) {
                NSArray * arr = [obj objectForKey:Single];
                if ([arr[0] isKindOfClass:[HomeNewProductModel class]]) {
                    *stop = YES;
                    index = idx;
                }
                
            }
        }
    }];
    _dataCount = [[[dataArray objectAtIndex:index] objectForKey:Single] count];
    NSArray * array = [[dataArray objectAtIndex:index] objectForKey:Single];
    
    self.arr = [NSArray arrayWithArray:array];
    
    if (_dataCount > 0) {
        // 移除重叠项（由于刷新每次都会addSubView）
        for (UIView *view in self.scrollView.subviews) {
            if ([view isKindOfClass:[NewProductView class]]) {
                [view removeFromSuperview];
            }
        }
        
        // 滚动范围width
        CGFloat scrollContentSizeW = 0.0;
        
        for (int i = 0; i < _dataCount; i++) {
            
            // 提出数据模型
            HomeNewProductModel *newProModel = array[i];
            
            // 设置宽度
            CGFloat nameW = [ZHTool sizeWithString_W:newProModel.name font:[UIFont textFont14] height:18];
            CGFloat rangeW = [ZHTool sizeWithString_W:[NSString stringWithFormat:@"可贷%@元", newProModel.range] font:[UIFont textFont13] height:18];
            CGFloat maxW = nameW > rangeW ? nameW : rangeW;
            CGFloat maxW2 = maxW + 30.0;
            CGFloat max = maxW2 > productViewWidth ? maxW2 : productViewWidth;
            
            // 初始化view
            self.productView = [[[NSBundle mainBundle] loadNibNamed:@"NewProductView" owner:self options:nil] lastObject];
            [self.productView setFrame:CGRectMake(scrollContentSizeW, 0, max, productViewHeight)];
            self.productView.ProBtton.tag = i;
            [self.productView.ProBtton addTarget:self action:@selector(clickedBtnAction:) forControlEvents:UIControlEventTouchUpInside];
            
            
            // 显示数据
            NSString * imageStr = [ImageUrl stringByAppendingPathComponent:newProModel.loanimage];
            [self.productView.logoImageView sd_setImageWithURL:[NSURL URLWithString:imageStr] placeholderImage:PlaceholderMin];
            self.productView.proName.text = newProModel.name;
            
            NSMutableAttributedString *atrStr = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"可贷%@元", newProModel.range]];
            [atrStr addAttribute:NSForegroundColorAttributeName value:[UIColor colorWith0xE56300] range:NSMakeRange(2, newProModel.range.length)];
            self.productView.proRange.attributedText = atrStr;
            
            [self.scrollView addSubview:self.productView];
            
            // 滚动范围Width
            scrollContentSizeW += max;
        }

        // 设置滚动的范围
        self.scrollView.contentSize = CGSizeMake(scrollContentSizeW, 0);
        
        [self.contentView addSubview:self.progressView];
        
    } else {
        
    }
    
}

- (void)clickedBtnAction:(UIButton *)button {
//    NSLog(@"点击第%ld个", (long)button.tag);
    HomeNewProductModel *newProModel = self.arr[button.tag];
    if (self.delegate && [self.delegate respondsToSelector:@selector(selectedModel:)]) {
        [self.delegate selectedModel:newProModel];
    }
}



- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    self.progressView.progress = scrollView.contentOffset.x/(scrollView.contentSize.width-kScreenWidth);
}


- (ProgressView *)progressView {
    if (!_progressView) {
        _progressView = [[ProgressView alloc] initWithFrame:CGRectMake((kScreenWidth - progressWidth)/2.0, productViewHeight+15*kScaleOfX, progressWidth, 2)];
        _progressView.backgroundColor =  [UIColor colorWithRed:221/255.0 green:221/255.0 blue:221/255.0 alpha:1];
    }
    return _progressView;
}


- (UIScrollView *)scrollView {
    
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 152*kScaleOfX)];
        _scrollView.delegate = self;
        _scrollView.backgroundColor = [UIColor whiteColor];
        _scrollView.contentOffset = CGPointMake(0, 0);
        _scrollView.scrollsToTop = NO;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.showsVerticalScrollIndicator = NO;
        [self.contentView addSubview:_scrollView];
    }
    return _scrollView;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
