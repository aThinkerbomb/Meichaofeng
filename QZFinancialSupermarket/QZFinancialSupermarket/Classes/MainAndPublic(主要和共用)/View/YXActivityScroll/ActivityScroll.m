//
//  ActivityScroll.m
//  ThemeActivityScroll
//
//  Created by 张宇轩 on 2017/10/26.
//  Copyright © 2017年 宇轩. All rights reserved.
//

#import "ActivityScroll.h"
#define ImageWidth 270*kScaleOfX
#define imageHeight 350*kScaleOfX
#define ImageTag 100

#define pageControlWidth 100*kScaleOfX
#define pageControlHeight 20*kScaleOfX

#define closeBtnWidth 35*kScaleOfX

@interface ActivityScroll ()<UIScrollViewDelegate>

@property (nonatomic, assign) NSInteger total;
@property (nonatomic, copy) dataSourceHandle dataHandle;
@property (nonatomic, copy) clickedIndexHandle indexHandle;

@property (nonatomic, strong) UIScrollView * scrollView;
@property (nonatomic, strong) UIPageControl * pageControl;
@property (nonatomic, strong) UIVisualEffectView * effectView;
@property (nonatomic, strong) UIButton * closeBtn;
@end



@implementation ActivityScroll

- (instancetype)initWithFrame:(CGRect)frame total:(NSInteger)total currentShowData:(dataSourceHandle)dataHandle clickedIndex:(clickedIndexHandle)indexHandle{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.total = total;
        if (dataHandle) {
            self.dataHandle = dataHandle;
        }
        if (indexHandle) {
            self.indexHandle = indexHandle;
        }
        
        [self configView];
        
    }
    return self;
}


- (void)configView {

    self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.7];
    // 添加毛玻璃
//    [self addSubview:self.effectView];
    // pageControl
    [self addSubview:self.pageControl];
    // 滚动视图
    [self addSubview:self.scrollView];
    // 关闭按钮
    [self addSubview:self.closeBtn];
    
    
    for (int i = 0; i < self.total; i++) {
        
        UIImageView *imageView = [self imageViewWithIndex:i];
        imageView.tag = ImageTag + i;
        if (self.dataHandle) {
            self.dataHandle(i, imageView);
        }
        
        [self.scrollView addSubview:imageView];
        
    }
    
}

- (UIImageView *)imageViewWithIndex:(NSInteger)index{
    
    CGFloat widthSpace = (self.frame.size.width - ImageWidth) / 2;
    CGFloat heightSpace = (self.frame.size.height - imageHeight) / 2;
    
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(index * self.frame.size.width + widthSpace, heightSpace,ImageWidth, imageHeight)];

    imageView.layer.cornerRadius = 10;
    imageView.layer.masksToBounds = YES;
    imageView.userInteractionEnabled = YES;
    
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(TapImageView:)];
    [imageView addGestureRecognizer:tap];
    
    return imageView;
}

- (void)TapImageView:(UITapGestureRecognizer *)tap {
    
    NSInteger index = tap.view.tag - ImageTag;
    if (self.indexHandle) {
        self.indexHandle(index);
    }
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    self.pageControl.currentPage = scrollView.contentOffset.x/kScreenWidth;
    
}

- (void)closeShow {
    [self removeFromSuperview];
}

- (void)showWith:(UIView *)view {
    [view addSubview:self];
}

- (UIScrollView *)scrollView {
    if (!_scrollView) {
        CGFloat width = self.frame.size.width;
        CGFloat height = self.frame.size.height;
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, width, height)];
        _scrollView.delegate = self;
        _scrollView.backgroundColor = [UIColor clearColor];
        _scrollView.contentSize = CGSizeMake(width * self.total, height);
        _scrollView.contentOffset = CGPointMake(0, 0);
        _scrollView.scrollsToTop = NO;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.pagingEnabled = YES;
    }
    return _scrollView;
}

- (UIVisualEffectView *)effectView {
    if (!_effectView) {
        UIBlurEffect *blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
        _effectView = [[UIVisualEffectView alloc] initWithEffect:blur];
        _effectView.frame = self.frame;
        
    }
    return _effectView;
}

- (UIPageControl *)pageControl {
    if (!_pageControl) {
        
        CGFloat x = (kScreenWidth - pageControlWidth)/2;
        CGFloat y = (self.frame.size.height - imageHeight)/2+imageHeight+10;
        _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(x, y, pageControlWidth, pageControlHeight)];
        _pageControl.numberOfPages = self.total;
        _pageControl.currentPage = 0;
        
    }
    return _pageControl;
}

- (UIButton *)closeBtn {
    if (!_closeBtn) {
        
        CGFloat x = (self.frame.size.width - ImageWidth) / 2 + ImageWidth;
        CGFloat y = (self.frame.size.height - imageHeight) / 2 - closeBtnWidth - 10;
        
        _closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_closeBtn setFrame:CGRectMake(x, y, closeBtnWidth, closeBtnWidth)];
        [_closeBtn setImage:[UIImage imageNamed:@"删除"] forState:UIControlStateNormal];
        _closeBtn.backgroundColor = [UIColor clearColor];
        [_closeBtn addTarget:self action:@selector(closeShow) forControlEvents:UIControlEventTouchUpInside];
    }
    return _closeBtn;
}

@end
