//
//  HttpGetImage.h
//  baidu
//
//  Created by lee on 14-9-10.
//  Copyright (c) 2014年 lee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HttpGetImage : NSObject

-(void)get:(NSString*) url forImage:(UIImageView*)image defaultImg:(NSString*) defaultImg;
@end
