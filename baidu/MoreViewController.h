//
//  FirstViewController.h
//  baidu
//
//  Created by lee on 14-8-29.
//  Copyright (c) 2014年 lee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MoreViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    NSArray* listData;
    NSArray *controllers;
}
@property(nonatomic,retain)    NSArray *listData;

@property (nonatomic, retain) NSArray *controllers;


@end
