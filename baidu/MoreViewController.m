//
//  FirstViewController.m
//  baidu
//
//  Created by lee on 14-8-29.
//  Copyright (c) 2014年 lee. All rights reserved.
//

#import "MoreViewController.h"


@interface MoreViewController (){
    
    UIView * view;
}
@end

@implementation MoreViewController


- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    
//    button = [[UIButton alloc] initWithFrame:CGRectMake(10, 100, 150, 30)];
    view=[[UIView alloc]initWithFrame:CGRectMake(0, 370, 330, 150.0)];
    view.backgroundColor = [UIColor yellowColor];
    UIButton  *    button = [[UIButton alloc ]initWithFrame:CGRectMake(30, 0, 270, 57.0)];
    [button setTitle:@"我是button3" forState:UIControlStateNormal ];
    button.backgroundColor = [UIColor redColor];
    [view addSubview:button];
    [self.tableView  addSubview:view];

    
//    [self.tableView addSubview:button];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    view.frame = CGRectMake(view.frame.origin.x, 370+self.tableView.contentOffset.y , view.frame.size.width, view.frame.size.height);
}
@end
