//
//  ViewControllerMy.m
//  baidu
//
//  Created by lee on 14-9-3.
//  Copyright (c) 2014年 lee. All rights reserved.
//

#import "ViewControllerMy.h"

@interface ViewControllerMy ()

@end

@implementation ViewControllerMy

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
//    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"touming.png"] forBarMetrics:UIBarMetricsDefault];
//    self.navigationController.navigationBar.barStyle = UIBarStyleBlackTranslucent;
    // Do any additional setup after loading the view.
}
- (void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBar.hidden = YES;
    UIBarButtonItem *backButton=[[UIBarButtonItem alloc] init];
    [backButton setTitle:@"返回"];
    self.navigationItem.backBarButtonItem=backButton;
}
- (void)viewWillDisappear:(BOOL)animated{
   self.navigationController.navigationBar.hidden = NO;
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    self.navigationController.navigationBar.hidden = NO;

    NSLog(@"prepareForSegue");
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end;
