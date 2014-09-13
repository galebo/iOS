
//
//  UITableViewMy.m
//  baidu
//
//  Created by lee on 14-9-13.
//  Copyright (c) 2014年 lee. All rights reserved.
//

#import "UITableViewMy.h"
#include "HttpGetData.h"

@implementation ShouYiCell

@synthesize name;
@synthesize date;
@synthesize money;
@synthesize type;

-(void) initWithProduct:(ShouYi*)product{
    self.name.text = product.name;
    self.date.text = product.date;
    self.money.text = product.money;
    self.type.text = product.desc;
}
@end




@interface UITableViewMy ()
{
    NSMutableArray* datas;
    int page;
    BOOL isShowYi;
    UIRefreshControl* refreshControl;
}
@end

@implementation UITableViewMy

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/
-(void)start:(BOOL) _isShouYi{
    isShowYi=_isShouYi;
    self.delegate=self;
    self.dataSource=self;
    [self setbeginRefreshing];
    page=1;
    datas=[[NSMutableArray alloc] init];
    [self _getData];
    [self refershData];
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
    
    return datas.count;
}

#pragma 开始刷新函数

- (void)setbeginRefreshing
{
    UIRefreshControl*refresh = [[UIRefreshControl alloc]init];
    //刷新图形颜色
    refresh.tintColor = [UIColor lightGrayColor];
    //刷新的标题
    refresh.attributedTitle = [[NSAttributedString alloc] initWithString:@"下拉刷新"];
    // UIRefreshControl 会触发一个UIControlEventValueChanged事件，通过监听这个事件，我们就可以进行类似数据请求的操作了
    [refresh addTarget:  self action:@selector(refreshTableviewAction:) forControlEvents:UIControlEventValueChanged];
    refreshControl =refresh;
}


-(void)refreshTableviewAction:(UIRefreshControl *)refreshs
{
    if (refreshs.refreshing) {
        refreshs.attributedTitle = [[NSAttributedString alloc]initWithString:@"正在刷新"];
        [self performSelector:@selector(refershData) withObject:nil afterDelay:2];
        
        page++;
        [self _getData];
    }
}


-(void)refershData
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"]; //创建的时间格式
    NSString *lastUpdated = [NSString stringWithFormat:@"上一次更新时间为 %@", [formatter stringFromDate:[NSDate date]]];
    refreshControl.attributedTitle = [[NSAttributedString alloc] initWithString:lastUpdated] ;
    [refreshControl endRefreshing];
    
    
    [self reloadData];
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"cellFor");
    ShouYiCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ShouYiCell" forIndexPath:indexPath];
    
    [cell initWithProduct:[datas objectAtIndex:indexPath.row]];
    
    return cell;
}
-(void)_getData{
    if(isShowYi){
        ShouYis* shouyi=[HttpGetData getShouYi:page];
        [datas addObjectsFromArray:shouyi.shouYis];
    }else{
        ShouYis* shouyi=[HttpGetData getZhang:page];
        [datas addObjectsFromArray:shouyi.shouYis];
    }
}

@end
