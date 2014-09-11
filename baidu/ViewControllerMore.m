//
//  MoreViewController1.m
//  baidu
//
//  Created by lee on 14-8-31.
//  Copyright (c) 2014年 lee. All rights reserved.
//

#import "ViewControllerMore.h"
#import "ViewController2Web.h"
#import "AppDelegate.h"

@interface ViewControllerMore ()
{
    NSArray *listData;
}
@end

@implementation ViewControllerMore

@synthesize _uiTableView;

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
    
    NSArray *array = [[NSArray alloc] initWithObjects:@"公告中心",@"手势密码",@"修改手势密码",@"帮助中心",@"客服热线",@"用户反馈", @"关于",nil];
    listData = array;

    [UIBase setExtraCellLineHidden:_uiTableView];
   
    [super viewDidLoad];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma implement UITableViewDataSource start
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
#pragma implement UITableViewDataSource end



#pragma implement UITableViewDelegate start
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
	ViewController2Web* vc=[self.storyboard instantiateViewControllerWithIdentifier:@"ViewController2Web"];
    vc.url=@"http://www.baidu.com";
	[self.navigationController pushViewController:vc animated:YES];
}
#pragma implement UITableViewDelegate end
@end
