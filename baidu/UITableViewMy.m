
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
    BOOL _loadingMore;
    UIActivityIndicatorView *tableFooterActivityIndicator ;
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
    
    [self createTableFooter];
    isShowYi=_isShouYi;
    self.delegate=self;
    self.dataSource=self;
    page=1;
    datas=[[NSMutableArray alloc] init];
    [self _getData];
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





- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    // 下拉到最底部时显示更多数据
    
    if(!_loadingMore&& scrollView.contentOffset.y > ((scrollView.contentSize.height - scrollView.frame.size.height)))
    {
        [self loadDataBegin];
    }
}



// 开始加载数据

- (void) loadDataBegin{
    
    if (_loadingMore == NO) {
        _loadingMore = YES;
        
        [tableFooterActivityIndicator startAnimating];
        [self _getData];
        
        _loadingMore = NO;
        //[tableFooterActivityIndicator stopAnimating];
        //[self createTableFooter];
    }
}


- (void)exe:bean{
    ShouYis* shouyi=bean;
    [datas addObjectsFromArray:shouyi.shouYis];
    [self reloadData];
}



// 创建表格底部

- (void) createTableFooter
{
    self.tableFooterView = nil;
    UIView *tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, self.bounds.size.width, 50.0f)];
    UILabel *loadMoreText = [[UILabel alloc] initWithFrame:CGRectMake(40.0f, 0.0f, 116.0f, 40.0f)];
    [loadMoreText setCenter:tableFooterView.center];
    [loadMoreText setFont:[UIFont fontWithName:@"Helvetica Neue" size:14]];
    [loadMoreText setText:@"上拉显示更多数据"];
    [tableFooterView addSubview:loadMoreText];
    
    tableFooterActivityIndicator = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0, 0, 20.0f, 20.0f)];
    [tableFooterActivityIndicator setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
    [tableFooterActivityIndicator setCenter:CGPointMake(80, 25)];
    [tableFooterView addSubview:tableFooterActivityIndicator];
    self.tableFooterView = tableFooterView;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ShouYiCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ShouYiCell" forIndexPath:indexPath];
    [cell initWithProduct:[datas objectAtIndex:indexPath.row]];
    return cell;
}
-(void)_getData{
    if(isShowYi){
        [HttpGetData getShouYi:page :self];
    }else{
        [HttpGetData getZhang:page :self];
    }
}


@end
