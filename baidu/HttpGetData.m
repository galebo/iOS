//
//  HttpGet.m
//  baidu
//
//  Created by lee on 14-9-11.
//  Copyright (c) 2014年 lee. All rights reserved.
//
#import "DataMake.h"
#import "HttpGetData.h"
#import "HttpTask.h"

@implementation HttpGetData
+(NSMutableArray*)getProducts{
    NSArray* rtnJson =[HttpTask doGet:@"http://107.170.199.9:9080/shop/j_products"];
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
    id rtnJson = [HttpTask doGet:@"http://107.170.199.9:9080/shop/j_home"];
    if (rtnJson!=nil) {
        Home* home=[[Home alloc]initByJson:rtnJson];
        return home;
    }else{
        return [DataMake getHome];
    }
}
+(void) getShouYi:(int) page :(id<ProcessBean>)processBean{
    NSString* url=[NSString stringWithFormat:@"http://107.170.199.9:9080/shop/j_shouyi?page=%d",page];
    
    HttpTask* http=[HttpTask alloc];
    [http exe:url addBean:[ShouYis alloc] addBean2:processBean];
}
+(void) getZhang:(int) page :(id<ProcessBean>)processBean{
    NSString* url=[NSString stringWithFormat:@"http://107.170.199.9:9080/shop/j_zhang?page=%d",page];
    
    HttpTask* http=[HttpTask alloc];
    [http exe:url addBean:[ShouYis alloc] addBean2:processBean];
}


@end







