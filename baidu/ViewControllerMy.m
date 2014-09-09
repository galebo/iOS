//
//  ViewControllerMy.m
//  baidu
//
//  Created by lee on 14-9-3.
//  Copyright (c) 2014年 lee. All rights reserved.
//

#import "ViewControllerMy.h"
#import "AppDelegate.h"
@interface ViewControllerMy ()
{
    NSMutableArray* products;
}
@end

@implementation ViewControllerMy

@synthesize _tableView;

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
    AppDelegate *app = [[UIApplication sharedApplication]delegate];
    products=app.products;
    [UIBase setExtraCellLineHidden:self._tableView];
}

- (void)viewDidAppear:(BOOL)animated{
    self.navigationController.navigationBar.hidden = YES;
    [super viewDidAppear:animated];
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
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return products.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ProductCell *cell = (ProductCell *)[tableView dequeueReusableCellWithIdentifier:@"ProductCell" forIndexPath:indexPath];
    [cell initWithProduct:(products )[indexPath.row]];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}


@end;
