//
//  AsyncHttpTask.m
//  baidu
//
//  Created by lee on 14-9-14.
//  Copyright (c) 2014年 lee. All rights reserved.
//

#import "HttpTask.h"





@interface HttpTask(){
    NSMutableData*weatherData;
    id<ProcessBean> processBean;
    id<String2Bean> string2Bean;
}
@end

@implementation HttpTask

static bool isWebOk=YES;

+(id) doGet:(NSString*)url{
    if (isWebOk) {
        NSError *error;
        //加载一个NSURL对象
        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
        //将请求的url数据放到NSData对象中
        NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:&error];
        if (response != nil && error == nil){
            //IOS5自带解析类NSJSONSerialization从response中解析出数据放到字典中
            id rtn = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableLeaves error:&error];
            if (rtn != nil && error == nil){
                NSLog(@"rtn:%@",rtn);
                return rtn;
            }
        }else{
            NSLog(@"error1");
            isWebOk=false;
        }
    }
    return nil;
}
- (void)exe:(NSString *)strURL addBean:(id<String2Bean>) _string2Bean addBean2:(id<ProcessBean>) _processBean{
    string2Bean=_string2Bean;
    processBean=_processBean;
    //创建URL
    NSURL *url = [[NSURL alloc] initWithString:strURL];
    
    //根据URL创建 NSURLRequest 请求
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url cachePolicy:NSURLRequestReloadIgnoringCacheData  timeoutInterval:60];
    
    //参数cachePolicy表示缓存策略,枚举类型,值有以下几种：
    //
    //    enum
    //    {
    //        NSURLRequestUseProtocolCachePolicy  = 0  NSURLRequest默认的cache policy，使用Protocol协议定义。是最能保持一致性的协议。
    //        NSURLRequestReloadIgnoringCacheData = 1  忽略缓存直接从原始地址下载 = NSURLRequestReloadIgnoringCacheData
    //        NSURLRequestReturnCacheDataElseLoad = 2  只有在cache中不存在data时才从原始地址下载
    //        NSURLRequestReturnCacheDataDontLoad = 3  只使用cache数据，如果不存在cache，请求失败;用于没有建立网络连接离线模式;
    //        NSURLRequestReloadIgnoringLocalAndRemoteCacheData =4,  忽略本地和远程的缓存数据，直接从原始地址下载，与NSURLRequestReloadIgnoringCacheData类似。
    //        NSURLRequestReloadRevalidatingCacheData = 5  验证本地数据与远程数据是否相同，如果不同则下载远程数据，否则使用本地数据。
    //    };
    //    typedef NSUInteger NSURLRequestCachePolicy;
    
    
    
    //创建连接,该消息一发送下载会立即开始
    //在代理(得了噶个)收到connectionDidFinishLoading：或者didFailWithError：消息之前 可以通过给连接发送一个cancel：消息来中断下载
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    
    
    if (connection)
    {
        //此时才创建NSMutableData 的实例,是否已晚?下载已经异步开始了
        if (!weatherData) {
            weatherData = [NSMutableData data];
        }
    }
    else
    {
        NSLog(@"创建网络连接失败!");
    }
    
}


//当服务器提供了足够客户程序创建NSURLResponse对象的信息时，代理对象会收到
//一个connection：didReceiveResponse：消息，在消息内可以检查NSURLResponse
//对象和确定数据的预期长途，mime类型，文件名以及其他服务器提供的元信息

//要注意，一个简单的连接也可能会收到多个connection：didReceiveResponse：消息
//当服务器连接重置或者一些罕见的原因（比如多组mime文档），代理都会收到该消息
//这时候应该重置进度指示，丢弃之前接收的数据

//反正当收到该信息就表示下载开始了(或者是重新开始了),把之前的数据清空即可
-(void)connection:connection didReceiveResponse:(NSURLResponse *)response
{
    [weatherData setLength:0];
    //int expectedLength = [response expectedContentLength];  该方法可以获取将要下载的信息的大小(字节长度)
}


//当下载开始的时候，每当有数据接收，代理会定期收到connection：didReceiveData：消息
//代理应当在实现中储存新接收的数据，下面的例子既是如此
//在下面的方法实现中，可以加入一个进度指示器，提示用户下载进度
-(void)connection:connection didReceiveData:(NSData *)data
{
    [weatherData appendData:data];
    // [data length]; 表示每次接收的信息的大小(字节长度)
}


//当下载的过程中有错误发生的时候，代理会收到一个connection：didFailWithError消息
//消息参数里面的NSError对象提供了具体的错误细节，它也能提供在用户信息字典里面失败的
//url请求（使用NSErrorFailingURLStringKey）

//当代理接收到连接的connection：didFailWithError消息后，该连接不会再收到任何消息,所以应该release掉

-(void)connection:connection didFailWithError:(NSError *)error
{
    //  [_weatherData release];
    NSLog(@"Connection failed! Error - %@ %@",
          [error localizedDescription],
          [[error userInfo] objectForKey:NSURLErrorFailingURLStringErrorKey]);
}


//最后，如果连接请求成功的下载，代理会接收connectionDidFinishLoading：消息
//该消息之后代理不会再收到其他任何的消息了，在消息的实现中，应该释放掉连接
- (void)connectionDidFinishLoading: (NSURLConnection *) connection
{
    //do something with the data
    NSLog(@"succeeded %lu byte receive",(unsigned long)[weatherData length]);
    //调用函数解析下载到的json格式的数据
    [self readJsonData];
}


//解析下载到的json格式的数据
- (void)readJsonData
{
    // NSJSONSerialization提供了将JSON数据转换为Foundation对象（一般都是NSDictionary和NSArray）
    //和Foundation对象转换为JSON数据（可以通过调用isValidJSONObject来判断Foundation对象是否可以转换为JSON数据）。
    
    NSError *error;
    id weatherDic = [NSJSONSerialization JSONObjectWithData:weatherData options:NSJSONReadingMutableContainers error:&error];
    
    [processBean onDataOk:[string2Bean initByJson:weatherDic]];
}

@end