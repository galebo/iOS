//
//  ViewController2Pro.h
//  baidu
//
//  Created by lee on 14-9-6.
//  Copyright (c) 2014年 lee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController2Pro : UIViewController<UIScrollViewDelegate>
//可滚动页面
@property (retain, nonatomic) UIScrollView *scrollView;
//页点
@property (retain, nonatomic) UIPageControl *pageControl;
//保存图片的数组
@property (retain, nonatomic) NSMutableArray *imageArray;
@end
