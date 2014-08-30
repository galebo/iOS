//
//  FirstViewController.m
//  baidu
//
//  Created by lee on 14-8-29.
//  Copyright (c) 2014年 lee. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

@synthesize listData;
@synthesize tableView1;

- (void)viewDidLoad {
    NSArray *array = [[NSArray alloc] initWithObjects:@"公告中心",@"手势密码",
                      @"修改手势密码",@"帮助中心",@"客服热线",@"用户反馈", @"关于",nil];
    self.listData = array;
    
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
            

            
        return cell;
}
@end
