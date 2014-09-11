//
//  SGFocusImageFrame.m
//  SGFocusImageFrame
//
//  Created by Shane Gao on 17/6/12.
//  Copyright (c) 2012 Shane Gao. All rights reserved.
//

#import "SGFocusImageFrame.h"
#import "SGFocusImageItem.h"
#import <objc/runtime.h>
#import "HttpGetImage.h"

@interface SGFocusImageFrame () {
    UIScrollView *_scrollView;
    UIPageControl *_pageControl;
    NSMutableArray *imageItems;
}
 
- (void)setupViews;
- (void)switchFocusImageItems;
@end


static CGFloat SWITCH_FOCUS_PICTURE_INTERVAL = 3.0; //switch interval time



@implementation SGFocusImageFrame

@synthesize delegate = _delegate;

- (id)initWithFrame:(CGRect)frame delegate:(id<SGFocusImageFrameDelegate>)delegate datas:(NSMutableArray *)datas
{
    self = [super initWithFrame:frame];
    if (self) {
        imageItems=datas;
        [self setupViews];
        
        [self setDelegate:delegate]; 
    }
    return self;
}

#pragma mark - private methods
- (void)setupViews{
    _scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
    
    CGSize size = CGSizeMake(100, 44);
    _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(self.bounds.size.width *.5 - size.width *.5, self.bounds.size.height - size.height, size.width, size.height)];
    
    [self addSubview:_scrollView];
    [self addSubview:_pageControl];

    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.pagingEnabled = YES;
    
    _pageControl.numberOfPages = imageItems.count;
    _pageControl.currentPage = 0;
    
    _scrollView.delegate = self;
    
    // single tap gesture recognizer
    UITapGestureRecognizer *tapGestureRecognize = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTapGestureRecognizer:)];
    tapGestureRecognize.delegate = self;
    tapGestureRecognize.numberOfTapsRequired = 1;
    [_scrollView addGestureRecognizer:tapGestureRecognize];
    _scrollView.contentSize = CGSizeMake(_scrollView.frame.size.width * imageItems.count, _scrollView.frame.size.height);
    for (int i = 0; i < imageItems.count; i++) {
        SGFocusImageItem *item = [imageItems objectAtIndex:i];
        //添加图片展示按钮
        UIButton * imageView = [UIButton buttonWithType:UIButtonTypeCustom];
        [imageView setFrame:CGRectMake(i * _scrollView.frame.size.width, 0, _scrollView.frame.size.width, _scrollView.frame.size.height)];
        HttpGetImage* httpget=[HttpGetImage alloc];
        [httpget get:item.image forButton:imageView defaultImg:@"product_list_default_image"];
        imageView.tag = i;
        //添加点击事件
        [imageView addTarget:self action:@selector(clickPageImage:) forControlEvents:UIControlEventTouchUpInside];
        [_scrollView addSubview:imageView];
    }
    [self performSelector:@selector(switchFocusImageItems) withObject:nil afterDelay:SWITCH_FOCUS_PICTURE_INTERVAL];
}

- (void)switchFocusImageItems{
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(switchFocusImageItems) object:nil];
    
    CGFloat targetX = _scrollView.contentOffset.x + _scrollView.frame.size.width;
    [self moveToTargetPosition:targetX];
    
    [self performSelector:@selector(switchFocusImageItems) withObject:nil afterDelay:SWITCH_FOCUS_PICTURE_INTERVAL];
}

- (void)singleTapGestureRecognizer:(UIGestureRecognizer *)gestureRecognizer{
    int page = (int)(_scrollView.contentOffset.x / _scrollView.frame.size.width);
    if (page > -1 && page < imageItems.count) {
        SGFocusImageItem *item = [imageItems objectAtIndex:page];
        if ([self.delegate respondsToSelector:@selector(foucusImageFrame:didSelectItem:)]) {
            [self.delegate foucusImageFrame:self didSelectItem:item];
        }
    }
}

- (void)moveToTargetPosition:(CGFloat)targetX{
    if (targetX >= _scrollView.contentSize.width) {
        targetX = 0.0;
    }
    
    [_scrollView setContentOffset:CGPointMake(targetX, 0) animated:YES] ;
    _pageControl.currentPage = (int)(_scrollView.contentOffset.x / _scrollView.frame.size.width);
}


#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    _pageControl.currentPage = (int)(scrollView.contentOffset.x / scrollView.frame.size.width);
    
}
#pragma mark - UIButtonTouchEvent
-(void)clickPageImage:(UIButton *)sender{
    UIButton *image=(UIButton*)sender;
    if ([self.delegate respondsToSelector:@selector(foucusImageFrame:didSelectItem:)]) {
        [self.delegate foucusImageFrame:self didSelectItem:[imageItems objectAtIndex:image.tag]];
    }
}

@end
