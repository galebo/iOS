//
//  ViewController3My.m
//  baidu
//
//  Created by lee on 14-9-11.
//  Copyright (c) 2014年 lee. All rights reserved.
//

#import "ViewController3My.h"
#import "Bean.h"



@interface ViewController3My ()
{
    bool isShouYiSelect;
}
@end

@implementation ViewController3My

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (IBAction)clickTop:(id)sender{
    if([sender tag]==10001){
        isShouYiSelect=TRUE;
        [[self TableViewShouyi] setHidden:NO];
        [[self TableViewZhang] setHidden:YES];
    }else{
        isShouYiSelect=FALSE;
        [[self TableViewZhang] setHidden:NO];
        [[self TableViewShouyi] setHidden:YES];
    }
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    UIView * top=[[[NSBundle mainBundle]loadNibNamed:@"ViewMyTop" owner:nil options:nil]firstObject];
    [((UIButton* )[top viewWithTag:10001]) addTarget:self action:@selector(clickTop:) forControlEvents:UIControlEventTouchUpInside];
    [((UIButton* )[top viewWithTag:10002]) addTarget:self action:@selector(clickTop:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.titleView=top;
    isShouYiSelect=YES;
    
    [[self TableViewShouyi] start:YES];
    [[self TableViewZhang] start:NO];
    //self.TableViewShouyi.clearsSelectionOnViewWillAppear = NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
