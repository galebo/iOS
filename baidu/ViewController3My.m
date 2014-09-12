//
//  ViewController3My.m
//  baidu
//
//  Created by lee on 14-9-11.
//  Copyright (c) 2014年 lee. All rights reserved.
//

#import "ViewController3My.h"
#import "Bean.h"
@implementation ShouYiCell

@synthesize name;
@synthesize date;
@synthesize money;
@synthesize type;

-(void) initWithProduct:(ShouYi*)product{
    self.name.text = product.name;
    self.date.text = product.date;
    self.money.text = product.money;
    self.type.text = product.type;
}
@end



@interface ViewController3My ()

@end

@implementation ViewController3My

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (IBAction)clickTop:(id)sender{
    NSLog(@"tag:%ld",[sender tag]);
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    UIView * top=[[[NSBundle mainBundle]loadNibNamed:@"ViewMyTop" owner:nil options:nil]firstObject];
    [((UIButton* )[top viewWithTag:10001]) addTarget:self action:@selector(clickTop:) forControlEvents:UIControlEventTouchUpInside];
    [((UIButton* )[top viewWithTag:10002]) addTarget:self action:@selector(clickTop:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.titleView=top;
    self.clearsSelectionOnViewWillAppear = NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 30;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ShouYiCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ShouYiCell" forIndexPath:indexPath];
    ShouYi* shouyi=[ShouYi alloc];
    shouyi.name=@"转账";
    shouyi.money=@"10000";
    shouyi.type=@"建设银行";
    shouyi.date=@"2010-09-01";
    [cell initWithProduct:shouyi];
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

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
