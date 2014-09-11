//
//  HttpGet.m
//  baidu
//
//  Created by lee on 14-9-11.
//  Copyright (c) 2014年 lee. All rights reserved.
//
#import "DataMake.h"
#import "HttpGetData.h"

@implementation HttpGetData
static bool isWebOk=true;
+(NSMutableArray*)getProducts{
    NSArray* rtnJson =[HttpGetData doGet:@"http://10.58.187.47:8080/shop/j_products"];
    if (rtnJson!=nil) {
        NSMutableArray* products = [NSMutableArray arrayWithCapacity:rtnJson.count];
        for (id json in rtnJson) {
            Product *product=[[Product alloc]initByJson:json];
            [products addObject:product];
        }
        return products;
    }else{
        return [DataMake getProducts];
    }
}

+(Home*) getHome{
    id rtnJson = [HttpGetData doGet:@"http://10.58.187.47:8080/shop/j_home"];
    if (rtnJson!=nil) {
        Home* home=[[Home alloc]initByJson:rtnJson];
        return home;
    }else{
        return [DataMake getHome];
    }
}

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
@end
