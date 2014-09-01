//
//  MoreViewController1.m
//  baidu
//
//  Created by lee on 14-8-31.
//  Copyright (c) 2014年 lee. All rights reserved.
//

#import "MoreViewController1.h"
#import "SecondViewController.h"

@interface MoreViewController1 ()

@end

@implementation MoreViewController1


@synthesize listData;
@synthesize controllers;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
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
- (void)viewDidLoad {
    
    NSArray *array = [[NSArray alloc] initWithObjects:@"公告中心",@"手势密码",
                      @"修改手势密码",@"帮助中心",@"客服热线",@"用户反馈", @"关于",nil];
    self.listData = array;
    NSMutableArray *array2 = [[NSMutableArray alloc] init];
    //增加check控制器
	SecondViewController *checkListController = [[SecondViewController alloc] init];
	
	checkListController.title = @"Check One";
	[array2 addObject:checkListController];
    
    controllers=array2;
    
    [super viewDidLoad];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [listData count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView   cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *SimpleCellIdentifier = @"SimpleCellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:SimpleCellIdentifier];
    if (cell == nil) {
        if([indexPath row]==4){
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:SimpleCellIdentifier];
            cell.detailTextLabel.text = @"400-898-8855";
        }else{
            
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:SimpleCellIdentifier];
        }
    }
    
    NSUInteger row = [indexPath row];
    
    cell.textLabel.text = [listData objectAtIndex:row];
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
	//NSInteger row = [indexPath row];
	UIViewController *nextController = [self.controllers objectAtIndex:0];
	[self.navigationController pushViewController:nextController animated:YES];
}
@end
