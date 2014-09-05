//
//  ViewControllerFav.m
//  baidu
//
//  Created by lee on 14-9-1.
//  Copyright (c) 2014年 lee. All rights reserved.
//

#import "ViewControllerFav.h"
#import "SecondViewController.h"

@interface ViewControllerFav ()

@end

@implementation ViewControllerFav

@synthesize focusView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupViews];
    [self initNav];
    //[self.view setBackgroundColor:[UIColor colorWithRed:220/255.0 green:39/255.0 blue:25/255.0 alpha:1]];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark -
- (void)setupViews
{
    SGFocusImageItem *item1 = [[SGFocusImageItem alloc] initWithTitle:nil image:[UIImage imageNamed:@"banner1"] tag:0] ;
    SGFocusImageItem *item2 = [[SGFocusImageItem alloc] initWithTitle:nil image:[UIImage imageNamed:@"banner2"] tag:1] ;
    SGFocusImageItem *item3 = [[SGFocusImageItem alloc] initWithTitle:nil image:[UIImage imageNamed:@"banner3"] tag:2] ;
    SGFocusImageFrame *imageFrame = [[SGFocusImageFrame alloc] initWithFrame:CGRectMake(0, 0, focusView.bounds.size.width,175.0)
                                                                    delegate:self  focusImageItems:item1, item2, item3, nil];
    [focusView addSubview:imageFrame];

}

#pragma mark -
- (void)foucusImageFrame:(SGFocusImageFrame *)imageFrame didSelectItem:(SGFocusImageItem *)item
{
    if(item.tag==0){
        NSURL *url = [NSURL URLWithString:@"http://google.com"];
        [[UIApplication sharedApplication] openURL:url];
    }else if(item.tag==1){
        NSURL *url=[NSURL URLWithString:@"tel://555-1234"];
        [[UIApplication sharedApplication] openURL:url];
    }else{
        NSURL *url = [NSURL URLWithString:@"http://maps.google.com/maps?q=pizza"];
        [[UIApplication sharedApplication] openURL:url];
    }
}

- (void)initNav {
    {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 100.0f, 40.0f)];//初始化图片视图控件
        imageView.contentMode = UIViewContentModeScaleAspectFit;//设置内容样式,通过保持长宽比缩放内容适应视图的大小,任何剩余的区域的视图的界限是透明的。
        UIImage *image = [UIImage imageNamed:@"logo.png"];//初始化图像视图
        [imageView setImage:image];
        self.navigationItem.titleView = imageView;//设置导航栏的titleView为imageView
    }
    {
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 21.0f, 28.0f)];//初始化图片视图控件
        btn.contentMode = UIViewContentModeScaleAspectFit;//设置内容样式,通过保持长宽比缩放内容适应视图的大小,任何剩余的区域的视图的界限是透明的。
        UIImage *image = [UIImage imageNamed:@"out.png"];//初始化图像视图
        [btn setBackgroundImage:image forState:UIControlStateNormal];
        
        [btn addTarget:self action:@selector(btnPressed:) forControlEvents:UIControlEventTouchUpInside];
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    }

}
-(IBAction)btnPressed :(id)sender{
    SecondViewController *checkListController = [[SecondViewController alloc] init];
    [self.navigationController pushViewController:checkListController animated:YES];
}
@end
