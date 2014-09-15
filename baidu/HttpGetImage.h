//
//  HttpGetImage.h
//  baidu
//
//  Created by lee on 14-9-10.
//  Copyright (c) 2014年 lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HttpTask.h"

@interface HttpGetImage : NSObject<DataProcesser>

-(void)get:(NSString*) url forButton:(UIButton*)image defaultImg:(NSString*) defaultImg;
-(void)get:(NSString*) url forImage:(UIImageView*)image defaultImg:(NSString*) defaultImg;
@end
