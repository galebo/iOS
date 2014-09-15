//
//  UITableViewMy.h
//  baidu
//
//  Created by lee on 14-9-13.
//  Copyright (c) 2014年 lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HttpGetData.h"
@interface UITableViewMy : UITableView<UITableViewDelegate,UITableViewDataSource,ProcessBean>
-(void)start:(BOOL)isShouYi;
@end


@interface ShouYiCell : UITableViewCell
@property (nonatomic, weak) IBOutlet UILabel *name;
@property (nonatomic, weak) IBOutlet UILabel *date;
@property (nonatomic, weak) IBOutlet UILabel *money;
@property (nonatomic, weak) IBOutlet UILabel *type;
@end