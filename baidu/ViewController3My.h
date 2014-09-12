//
//  ViewController3My.h
//  baidu
//
//  Created by lee on 14-9-11.
//  Copyright (c) 2014年 lee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController3My : UITableViewController

@end


@interface ShouYiCell : UITableViewCell
@property (nonatomic, weak) IBOutlet UILabel *name;
@property (nonatomic, weak) IBOutlet UILabel *date;
@property (nonatomic, weak) IBOutlet UILabel *money;
@property (nonatomic, weak) IBOutlet UILabel *type;
@end