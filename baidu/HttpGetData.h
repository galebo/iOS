//
//  HttpGet.h
//  baidu
//
//  Created by lee on 14-9-11.
//  Copyright (c) 2014年 lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Bean.h"

@interface HttpGetData : NSObject
+(NSMutableArray*)getProducts;
+(Home*)getHome;
+(void) getShouYi:(int) page :(id<ProcessBean>) processBean;
+(void) getZhang:(int) page :(id<ProcessBean>) processBean;
@end

