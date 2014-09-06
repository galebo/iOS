//
//  ViewController2Pro.m
//  baidu
//
//  Created by lee on 14-9-6.
//  Copyright (c) 2014年 lee. All rights reserved.
//

#import "ViewController2Pro.h"

#import "AppDelegate.h"

@interface ViewController2Pro ()
{
    NSMutableArray* products;
}
@end


@implementation ViewPro
//可滚动页面
@synthesize img;
@synthesize name;
@synthesize desc;
@synthesize price;
@synthesize bei;
@end


@implementation ViewController2Pro

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)viewDidLoad
{
    [super viewDidLoad];
    AppDelegate *app = [[UIApplication sharedApplication]delegate];
    products=app.products;
    
    
    //创建可滑动视图
    self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, 320, 460)];
//    //创建页点
//    self.pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(0, 420, 320, 36)];
//    
//    [self.pageControl  setBackgroundColor:[UIColor clearColor]];
//    [self.pageControl  setAlpha:1];
    //初始化数组,将图片压入数组
    
    //将滚动视图和翻页视图添加到视图中
    [self.view addSubview:self.scrollView];
//    [self.view addSubview:self.pageControl];
    self.view.backgroundColor = [UIColor whiteColor];
    [self createsCrollView:nil];
}


#pragma ------创建视图区域----------

//创建滚动视图区域

- (void)createsCrollView:(id)sender{
    //设置委托
    self.scrollView.delegate = self;
    //将是否取消对内容视图触摸的反应设为NO
    self.scrollView.canCancelContentTouches = NO;
    //设置滚动条类型
    self.scrollView.indicatorStyle = UIScrollViewIndicatorStyleWhite;
    //是否可以缩放
    self.scrollView.scrollEnabled = YES;    
    //是否可以进行页面切换
    self.scrollView.pagingEnabled = YES;
    
    NSUInteger page = 0;//为了记录页数
    int originX = 0;
    //填充滑动视图内容
    for (int i=0;i<products.count;i++) {
        Product* product=[products objectAtIndex:i];
        ProductCell * cell=[[[NSBundle mainBundle]loadNibNamed:@"ViewPro" owner:nil options:nil]firstObject];
        [cell initWithProduct:product];
        //添加到视图中
        [self.scrollView addSubview:cell];
        cell.frame=CGRectMake(originX, 0, cell.frame.size.width, cell.frame.size.width);
        
        //确定下张图片开始的x坐标
        originX += self.scrollView.frame.size.width;
        //记录页数
        page++;
    }
    
    //设置总页数
    
//    self.pageControl.numberOfPages = page;
//    //设置默认页为首页
//    self.pageControl.currentPage = 0;
//    self.pageControl.tag = 100;
//    //为页数控制关联方法
//    [self.pageControl addTarget:self action:@selector(_changePage:) forControlEvents:UIControlEventValueChanged];
    //显示适当区域
    [self.scrollView setContentSize:CGSizeMake(originX, self.scrollView.frame.size.height)];
}


//点击小点切换页面

- (void)_changePage:(id)sender
{
    //创建一个区域
    CGRect rect;
    rect.origin.x = self.pageControl.currentPage * self.scrollView.frame.size.width;
    rect.origin.y = 0;
    rect.size.width = self.scrollView.frame.size.width;
    rect.size.height = self.scrollView.frame.size.height;
    //设置滚动视图的可视区域
    [self.scrollView scrollRectToVisible:rect animated:YES];
    
}
//重写滑动结束后的反应，就是把pageConteol的当前页跟随滑动而动

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    //取滚动视图区域的宽
    float orginX = self.scrollView.frame.size.width;
    //利用当前视图显示区域到view.frame的偏移量，来换算获取当前处在第几页
    int page = ((self.scrollView.contentOffset.x - orginX))/orginX +1;
    //当前页改为这一页。
//    self.pageControl.currentPage = page;
    self.navigationItem.title=((Product* )[products objectAtIndex:page]).name;
}
@end
