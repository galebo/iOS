//
//  ViewController2Lock.h
//  baidu
//
//  Created by lee on 14-9-5.
//  Copyright (c) 2014年 lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YYLockView.h"

@interface ViewController2Lock : UIViewController<YYLockViewDelegate>{
    UILabel* msg;
}
@property(nonatomic,retain )  IBOutlet UILabel* msg;
@end
