//
//  HttpGetImage.m
//  baidu
//
//  Created by lee on 14-9-10.
//  Copyright (c) 2014年 lee. All rights reserved.
//

#import "HttpGetImage.h"
@implementation HttpGetImage
{
    UIImageView* imageView;
    UIButton* button;
    NSString* _defaultImg;
    HttpTask* task;
    
}

-(void)get:(NSString*) url forButton:(UIButton*)image defaultImg:(NSString*) defaultImg{
    button=image;
    [self get:url defaultImg:defaultImg];
}
-(void)get:(NSString*) url forImage:(UIImageView*)image defaultImg:(NSString*) defaultImg{
    imageView=image;
    [self get:url defaultImg:defaultImg];
}
-(void)get:(NSString*) url  defaultImg:(NSString*) defaultImg{
    _defaultImg=defaultImg;
    //可以在显示图片前先用本地的一个loading.gif来占位。
    UIImage *img = [UIImage imageNamed:_defaultImg];
    [self setImg:img];
    task =[HttpTask alloc];
    [task exe:url addBean:self ];
}


- (void)process: (NSMutableData*)data{
    UIImage *img=[UIImage imageWithData:data];
    [self setImg:img];
}

-(void)setImg:(UIImage*)img{
    if (imageView!=nil) {
        [imageView setImage:img];
    }else if(button!=nil){
        [button setBackgroundImage:img forState:UIControlStateNormal];
    }
}
@end
