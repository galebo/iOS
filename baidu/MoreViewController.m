//
//  FirstViewController.m
//  baidu
//
//  Created by lee on 14-8-29.
//  Copyright (c) 2014年 lee. All rights reserved.
//

#import "MoreViewController.h"
#import "More1ViewController.h"

@interface MoreViewController ()

@end

@implementation MoreViewController

@synthesize listData;
@synthesize controllers;

- (void)viewDidLoad {
    
    NSArray *array = [[NSArray alloc] initWithObjects:@"公告中心",@"手势密码",//@"帮助中心",@"客服热线",@"用户反馈", @"关于",
                      @"修改手势密码",nil];
    self.listData = array;
    NSMutableArray *array2 = [[NSMutableArray alloc] init];
    //增加check控制器



    
    [super viewDidLoad];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}






@end
