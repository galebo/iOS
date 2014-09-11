//
//  ViewController2Web.m
//  baidu
//
//  Created by lee on 14-9-11.
//  Copyright (c) 2014年 lee. All rights reserved.
//

#import "ViewController2Web.h"

@interface ViewController2Web ()

@end

@implementation ViewController2Web
@synthesize url;
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
    // Do any additional setup after loading the view.
    if (url!=nil) {
        NSURL *url_ = [[NSURL alloc]initWithString:url];
        UIWebView* webView=(UIWebView*)self.view;
        [webView loadRequest:[NSURLRequest requestWithURL:url_]];
    }
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

@end
