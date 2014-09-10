//
//  ViewController2Lock.m
//  baidu
//
//  Created by lee on 14-9-5.
//  Copyright (c) 2014年 lee. All rights reserved.
//

#import "ViewController2Lock.h"
#import "AppDelegate.h"

@interface ViewController2Lock ()
@end

@implementation ViewController2Lock

int count=4;
@synthesize msg;
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
-(void)LockViewDidClick:(YYLockView *)lockView andPwd:(NSString *)pwd
{
    msg.text=[NSString stringWithFormat:@"密码错误剩余%d次",count-- ];
    if(count==0){
        count=4;
        AppDelegate *app = [[UIApplication sharedApplication]delegate];
        app.isShow=NO;
        [self.navigationController popViewControllerAnimated:YES];
    }
}
@end
