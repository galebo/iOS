//
//  ViewControllerBase.m
//  baidu
//
//  Created by lee on 14-9-10.
//  Copyright (c) 2014年 lee. All rights reserved.
//

#import "ViewControllerBase.h"

@interface ViewControllerBase ()

@end

@implementation ViewControllerBase

bool parentIsHiddenNav=NO;
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

- (void)viewWillDisappear:(BOOL)animated{
    if(parentIsHiddenNav){
        self.navigationController.navigationBar.hidden = YES;
    }
    [super viewWillDisappear:animated];
}
-(void)viewDidAppear:(BOOL)animated{
    if(self.navigationController.navigationBar.hidden){
        self.navigationController.navigationBar.hidden = NO;
        parentIsHiddenNav=YES;
    }else{
        parentIsHiddenNav=NO;
    }
    [super viewDidAppear:animated];
}


@end
