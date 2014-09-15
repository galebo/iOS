//
//  AsyncHttpTask.h
//  baidu
//
//  Created by lee on 14-9-14.
//  Copyright (c) 2014年 lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppDelegate.h"



@protocol DataProcesser <NSObject>
- (void)process: (NSMutableData*)data;
@end


@interface HttpTask : NSObject
+(id) doGet:(NSString*)url;

- (void)exe:(NSString *)strURL addBean:(id<DataProcesser>) dataProcesser;
- (void)exe:(NSString *)strURL addBean:(id<String2Bean>) _string2Bean addBean2:(id<ProcessBean>) _processBean;
@end