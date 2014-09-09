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


@implementation ViewController2Pro

@synthesize name;
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
    
    //将滚动视图和翻页视图添加到视图中
    [self.view addSubview:self.scrollView];
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
    int showPage=0;
    //填充滑动视图内容
    for (int i=0;i<products.count;i++) {
        Product* product=[products objectAtIndex:i];
        ViewPro* viewPro=[[[ViewPro alloc]initWithFrame:CGRectZero] init:product withNib:@"ViewPro" x:originX];
        //添加到视图中
        [self.scrollView addSubview:viewPro];
        if(product.name==name){
            showPage=i;
        }
        //确定下张图片开始的x坐标
        originX += self.scrollView.frame.size.width;
        //记录页数
        page++;
    }
    NSLog(@"page:%d",showPage);
    //显示适当区域
    [self.scrollView setContentSize:CGSizeMake(self.scrollView.frame.size.width*products.count, self.scrollView.frame.size.height)];
    CGPoint bottomOffset = CGPointMake(self.scrollView.frame.size.width*showPage,0);
    [self.scrollView setContentOffset:bottomOffset animated:YES];
    self.navigationItem.title=((Product* )[products objectAtIndex:showPage]).name;
}


//重写滑动结束后的反应

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    //取滚动视图区域的宽
    float orginX = self.scrollView.frame.size.width;
    //利用当前视图显示区域到view.frame的偏移量，来换算获取当前处在第几页
    int page = ((self.scrollView.contentOffset.x - orginX))/orginX +1;
    //当前页改为这一页。
    self.navigationItem.title=((Product* )[products objectAtIndex:page]).name;
}
@end
