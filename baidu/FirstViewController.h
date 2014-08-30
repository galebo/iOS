//
//  FirstViewController.h
//  baidu
//
//  Created by lee on 14-8-29.
//  Copyright (c) 2014年 lee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
{
    NSArray* listData;
    UITableView* tableView1;
}
@property(nonatomic,retain)    NSArray *listData;
@property(retain)  IBOutlet UITableView* tableView1;


@end
