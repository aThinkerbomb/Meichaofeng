//
//  CycleScrollView.m
//  CycleScrollView
//
//  Created by 张宇轩 on 16/4/18.
//  Copyright © 2016年 Tintin. All rights reserved.
//
#define imageViewTag  100
#define labelTag 200
#define viewTag 300

#import "CycleScrollView.h"
@interface CycleScrollView ()<UIScrollViewDelegate>
@property(nonatomic,strong)UIScrollView *scrollView;
@property(nonatomic,strong)UIPageControl * pageControl;
@property(nonatomic,assign)NSUInteger totleCount;


@end

@implementation CycleScrollView

-(void)removeFromSuperview{
    
    [self.timer invalidate];
    
    
    [super removeFromSuperview];
}

-(instancetype)initWithFrame:(CGRect)frame totleCount:(NSInteger)totleCount {
    return [self initWithFrame:frame totleCount:totleCount currentIndexShow:nil sourceHandler:nil];
}

-(instancetype)initWithFrame:(CGRect)frame totleCount:(NSInteger)totleCount sourceHandler:(SourceIndexHandle)sourceHandler {
    return [self initWithFrame:frame totleCount:totleCount currentIndexShow:nil sourceHandler:sourceHandler];
}

-(instancetype)initWithFrame:(CGRect)frame totleCount:(NSInteger)totleCount currentIndexShow:(SourceAtIndex)sourceIndex sourceHandler:(SourceIndexHandle)sourceHandler {
    self =[super initWithFrame:frame];
    if (self) {
        self.totleCount = totleCount;
        if (sourceIndex) {
            self.sourceIndex = sourceIndex;
        }
        if (sourceHandler) {
            self.sourceHandler = sourceHandler;
        }
        [self initData];
        [self configView];
    }
    return self;
}
- (void)initData {
    self.pageAligment = CCPageAlignmentRight;
    self.showPageControl = YES;
}


-(void)configView {
    
    self.timeInterval = 4;
    
    float pageWidth = self.frame.size.width;
    float pageHeight = self.frame.size.height;
    
    self.currentIndex = 0;
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, pageWidth, pageHeight)];
    self.scrollView.scrollsToTop = NO;
    self.scrollView.backgroundColor =[UIColor darkGrayColor];
    self.scrollView.showsHorizontalScrollIndicator = NO;
    
    if (self.totleCount > 1) {
        self.scrollView.pagingEnabled = YES;
        self.scrollView.contentSize = CGSizeMake(self.frame.size.width*3, pageHeight);
        self.scrollView.contentOffset = CGPointMake(pageWidth, 0);
        self.scrollView.delegate = self;
        for (int i = 0; i<3; i++) {
            
            UIImageView * imageView = [self imageViewWithIndex:i width:pageWidth height:pageHeight];
            imageView.tag = imageViewTag+i;
            
            UIView *view = [self backviewWithIndex:i width:pageWidth height:pageHeight];
            view.tag = viewTag + i;
            
            UILabel * label = [self labelWithIndex:i width:pageWidth height:pageHeight];
            label.tag = labelTag + i;
            
            
            NSInteger index = i;
            index--;
            if (index < 0) {
                index = self.totleCount-1;
            }
            
            self.sourceIndex(index,imageView, label);//显示imageView图片
            [self.scrollView addSubview:imageView];
            [self.scrollView addSubview:view];
            [self.scrollView addSubview:label];
            
        }
    }else {
        
        self.scrollView.contentSize = CGSizeMake(pageWidth, pageHeight);
        self.scrollView.contentOffset = CGPointMake(0, 0);
        self.scrollView.backgroundColor = [UIColor clearColor];
        self.scrollView.scrollEnabled = NO;
        
        UIImageView * imageView = [self imageViewWithIndex:0 width:pageWidth height:pageHeight];
        imageView.tag = imageViewTag;
        
        UIView *view = [self backviewWithIndex:0 width:pageWidth height:pageHeight];
        view.tag = viewTag;
        
        UILabel * label = [self labelWithIndex:0 width:pageWidth height:pageHeight];
        label.tag = labelTag;
        
        [self.scrollView addSubview:imageView];
        [self.scrollView addSubview:view];
        [self.scrollView addSubview:label];
        
    }
    [self addSubview:self.scrollView];
    
    if (self.totleCount > 1) {
        CGFloat width = self.totleCount*20+(self.totleCount-1)*7;
        self.pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, 0, width, 20)];
        self.pageControl.numberOfPages = self.totleCount;
        self.pageControl.currentPage = self.currentIndex;
        self.pageControl.center = CGPointMake(pageWidth-10- width/2 , pageHeight - 25);
        self.pageControl.hidesForSinglePage = YES;
        [self addSubview:self.pageControl];
    }
}
//初始化用到
- (UIImageView *)imageViewWithIndex:(NSInteger)index width:(CGFloat)width height:(CGFloat)height{
   
    UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(index * width, 0, width, height)];
    
    //添加点击手势
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapImageView:)];
    
    [imageView addGestureRecognizer:tap];
    
    imageView.userInteractionEnabled = YES;
    
    
    return imageView;
}

- (UIView *)backviewWithIndex:(NSInteger)index width:(CGFloat)width height:(CGFloat)height{
    
    UIView *titleView = [[UIView alloc] initWithFrame:CGRectMake(index * width, height - 35, width, 35)];
    titleView.backgroundColor = [UIColor whiteColor];
    titleView.alpha = 0.5;
    return titleView;
}


- (UILabel *)labelWithIndex:(NSInteger)index width:(CGFloat)width height:(CGFloat)height {
    
    // 标题
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(index * width + 10, height - 35, width - 20, 35)];
    
    // 设置参数
    label.tag = index + imageViewTag + 100;
    
    return label;
}

- (void)tapImageView:(UITapGestureRecognizer * )tap{
    
    //获取对应image所在位置
    NSInteger  locationIndex   = tap.view.tag - imageViewTag;
   
    NSInteger index =   [self imageIndexInLocation:locationIndex];//位置转换成业务位置
    
    self.sourceHandler(index);//点击实现
    
    
}

#pragma  mark 基本配置

-(void)startScrollAnimation{
    
    if (self.totleCount == 1) {
        return;
    }
    
    if (self.timer) {
        
    }else{
        self.timer = [NSTimer scheduledTimerWithTimeInterval:self.timeInterval target:self selector:@selector(repeatToscrollToNext) userInfo:nil repeats:YES];
        self.timer.fireDate = [NSDate dateWithTimeIntervalSinceNow:self.timeInterval];
        [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
        
    }
    
}

- (void)repeatToscrollToNext{
    
    [UIView animateWithDuration:0.3 animations:^{
        self.scrollView.contentOffset = CGPointMake(self.frame.size.width*2, 0);
    } completion:^(BOOL finished) {
        
        if (self.currentIndex >= self.totleCount -1) {
            self.currentIndex = 0;
        }else{
            self.currentIndex ++;
        }
        
    }];
    
    
}


- (void)setShowPageControl:(BOOL)showPageControl {
    _showPageControl = showPageControl;
    [self.pageControl setHidden:!showPageControl];
}


- (void)setPageAligment:(CyclePageAlignment)pageAligment {
    _pageAligment = pageAligment;
    if (self.showPageControl== NO) {
        return;
    }
    CGFloat width = self.totleCount*20+(self.totleCount-1)*7;
    float pageHeight = self.frame.size.height;
    float pageWidth = self.frame.size.width;
    
    switch (pageAligment) {
        case CCPageAlignmentLeft: {
            self.pageControl.center = CGPointMake(10 + width/2 , pageHeight - 25);
            break;
        }
        case CCPageAlignmentRight: {
            self.pageControl.center = CGPointMake(pageWidth-10- width/2 , pageHeight - 25);
            break;
        }
        case CCPageAlignmentCenter: {
            self.pageControl.center = CGPointMake((pageWidth- width)/2 , pageHeight - 25);
            break;
        }
        default:
            break;
    }
}

-(void)setCurrentIndex:(NSInteger)currentIndex{
    if (self.totleCount == 1) {
        return;
    }
    _currentIndex = currentIndex;
    self.pageControl.currentPage = currentIndex;
    [self refreshView];
    
    
}






#pragma mark---ScrollDelegate
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    
    self.timer.fireDate = [NSDate distantFuture];
    
}

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    self.timer.fireDate = [NSDate dateWithTimeIntervalSinceNow:2];
    scrollView.scrollEnabled = NO;
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView;      // called when scroll view grinds to a halt
{
    float width = scrollView.frame.size.width;
    float originx = scrollView.contentOffset.x;
    
    if (originx > width + width/2) {//向右
        
        self.scrollView.contentOffset = CGPointMake(width*2, 0);
        if (self.currentIndex >= self.totleCount -1) {
            self.currentIndex = 0;
        }else{
            self.currentIndex ++;
        }
        [self refreshView];
        scrollView.scrollEnabled = YES;
        
    }else if (originx < width - width/2) {//向左 {
        
        self.scrollView.contentOffset = CGPointMake(0, 0);
        if (self.currentIndex == 0) {
            self.currentIndex = self.totleCount - 1;
        }else{
            self.currentIndex --;
        }
        scrollView.scrollEnabled = YES;
        ;
        
    }else{
        self.scrollView.contentOffset = CGPointMake(width, 0);
        
    }
    
    scrollView.scrollEnabled = YES;
    
}



#pragma mark scrollview 相对位置显示相关
-(void)refreshView {
    
    
    for (int i = 0; i <3; i++) {
        [self refreshViewAtlocation:i andvideoIndex:[self imageIndexInLocation:i]];
    }
    
    float pageWidth = self.frame.size.width;
    
    self.scrollView.contentOffset = CGPointMake(pageWidth, 0);
}

//刷新图片显示

-(void)refreshViewAtlocation:(int)i andvideoIndex:(NSInteger)index{
    
    UIImageView * imageview = [self.scrollView viewWithTag:imageViewTag+i];
    UILabel * label = [self.scrollView viewWithTag:labelTag+i];
    
    if (self.sourceIndex) {
        self.sourceIndex(index,imageview,label); //刷新imageView
    }
}

//获取相对位置具体对应的 显示图片的index

-(NSInteger)imageIndexInLocation:(NSInteger)i{
    
    //    i 只有 0 1 2
    if (i == 0) {  //左边
        NSInteger  lefIndex = self.currentIndex - 1;
        if (lefIndex<0) {
            lefIndex = self.totleCount - 1;
        }
        return lefIndex;
    }
    
    if (i == 1) {//中间
        return self.currentIndex;
    }
    
    if (i == 2) {//右边
        NSInteger  right = self.currentIndex + 1;
        if (right > self.totleCount-1) {
            right = 0;
        }
        return right;
    }
    
    
    return 0;
}

- (void)setIsShowCycTitle:(BOOL)isShowCycTitle {
    _isShowCycTitle = isShowCycTitle;
    
    UILabel * label;
    UIView * view;
    if (self.totleCount > 1) {
        for (int i = 0; i < 3; i++) {
            label = [self.scrollView viewWithTag:labelTag+i];
            view = [self.scrollView viewWithTag:viewTag+i];
            label.hidden = !_isShowCycTitle;
            view.hidden = !_isShowCycTitle;
        }
    } else {
        label = [self.scrollView viewWithTag:labelTag];
        view = [self.scrollView viewWithTag:viewTag];
        label.hidden = !_isShowCycTitle;
        view.hidden = !_isShowCycTitle;
    }

    
}


-(void)dealloc{
    
    NSLog(@"释放了");
    
}

@end
