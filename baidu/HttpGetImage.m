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
    NSURLResponse* _response;
    NSMutableData* _data;
    UIImageView* imageView;
    UIButton* button;
    NSString* _defaultImg;
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
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:url]];
    [request setHTTPMethod:@"GET"];
    
    NSURLConnection *conn=[[NSURLConnection alloc] initWithRequest:request delegate:self];
    if (conn)
    {
        _data = [NSMutableData data];
    }
    else
    {
        NSLog(@"error");
    }
}
- (void)connection:(NSURLConnection*)connection didReceiveResponse:(NSURLResponse*)response{
    _data = [[NSMutableData alloc] init];
    //保存接收到的响应对象，以便响应完毕后的状态。
    _response = response;
}
- (void)connection:(NSURLConnection*)connection didReceiveData:(NSData*)data {
    //_data为NSMutableData类型的私有属性，用于保存从网络上接收到的数据。
    //也可以从此委托中获取到图片加载的进度。
    [_data appendData:data];
    NSLog(@"%lld%%", data.length/_response.expectedContentLength * 100);
}
- (void)connection:(NSURLConnection*)connection didFailWithError:(NSError*)error{
    //请求异常，在此可以进行出错后的操作，如给UIImageView设置一张默认的图片等。
    NSLog(@"didFailWithError:%@",error.description);
    
}
- (void)connectionDidFinishLoading:(NSURLConnection*)connection{
    //加载成功，在此的加载成功并不代表图片加载成功，需要判断HTTP返回状态。
    NSHTTPURLResponse*response=(NSHTTPURLResponse*)_response;
    if(response.statusCode == 200){
        //请求成功
        UIImage *img=[UIImage imageWithData:_data];
        [self setImg:img];
    }else{
        NSLog(@"response.statusCode:%ld",response.statusCode);
    }
}

-(void)setImg:(UIImage*)img{
    if (imageView!=nil) {
        [imageView setImage:img];
    }else if(button!=nil){
        [button setBackgroundImage:img forState:UIControlStateNormal];
    }
}
@end
