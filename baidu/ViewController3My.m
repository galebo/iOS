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
{
    bool isSelect;
    int count;
    UIRefreshControl*refresh;
}
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
    if([sender tag]==10001){
        isSelect=FALSE;
    }else{
        isSelect=TRUE;
    }
    [[self tableView] reloadData];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    UIView * top=[[[NSBundle mainBundle]loadNibNamed:@"ViewMyTop" owner:nil options:nil]firstObject];
    [((UIButton* )[top viewWithTag:10001]) addTarget:self action:@selector(clickTop:) forControlEvents:UIControlEventTouchUpInside];
    [((UIButton* )[top viewWithTag:10002]) addTarget:self action:@selector(clickTop:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.titleView=top;
    self.clearsSelectionOnViewWillAppear = NO;
    isSelect=FALSE;
    count=1;
    [self setbeginRefreshing];
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
    return 8*count;
}

#pragma 开始刷新函数

- (void)setbeginRefreshing
{
    refresh = [[UIRefreshControl alloc]init];
    //刷新图形颜色
    refresh.tintColor = [UIColor lightGrayColor];
    //刷新的标题
    refresh.attributedTitle = [[NSAttributedString alloc] initWithString:@"下拉刷新"];
    // UIRefreshControl 会触发一个UIControlEventValueChanged事件，通过监听这个事件，我们就可以进行类似数据请求的操作了
    [refresh addTarget:  self action:@selector(refreshTableviewAction:) forControlEvents:UIControlEventValueChanged];
    self.refreshControl =refresh;
    
}


-(void)refreshTableviewAction:(UIRefreshControl *)refreshs
{
    if (refreshs.refreshing) {
        refreshs.attributedTitle = [[NSAttributedString alloc]initWithString:@"正在刷新"];
        [self performSelector:@selector(refershData) withObject:nil afterDelay:2];
        count++;
    }
}


-(void)refershData
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"]; //创建的时间格式
    NSString *lastUpdated = [NSString stringWithFormat:@"上一次更新时间为 %@", [formatter stringFromDate:[NSDate date]]];
    self.refreshControl.attributedTitle = [[NSAttributedString alloc] initWithString:lastUpdated] ;
    [self.refreshControl endRefreshing];
    [self.tableView reloadData];
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ShouYiCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ShouYiCell" forIndexPath:indexPath];
    ShouYi* shouyi=[ShouYi alloc];
    if (isSelect) {
        shouyi.name=@"转账1";
    }else{
        shouyi.name=@"转账2";
    }
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
