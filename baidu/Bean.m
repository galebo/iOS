//
//  Bean.m
//  baidu
//
//  Created by lee on 14-9-11.
//  Copyright (c) 2014年 lee. All rights reserved.
//

#import "Bean.h"

@implementation Product
@synthesize name;
@synthesize desc;
@synthesize price;
@synthesize price10000;
@synthesize bei;
@synthesize shouyi;
@synthesize ziChan;
@synthesize image;
-(Product*)initByJson:(NSDictionary*)json{
    name=[json objectForKey:@"name"];
    desc=[json objectForKey:@"desc"];
    price=[json objectForKey:@"price"];
    price10000=[json objectForKey:@"price10000"];
    bei=[json objectForKey:@"bei"];
    image=[json objectForKey:@"image"];
    shouyi=[json objectForKey:@"shouyi"];
    ziChan=[json objectForKey:@"ziChan"];
    return self;
}
@end

@implementation Banner
@synthesize img;
@synthesize url;
-(Banner*)initByJson:(NSDictionary*)json{
    img=[json objectForKey:@"img"];
    url=[json objectForKey:@"url"];
    return self;
}
@end

@implementation Home
@synthesize banners;
-(Home*)initByJson:(NSDictionary*)json_{
    NSArray* jsonArray=[json_ objectForKey:@"banners"];
    banners = [NSMutableArray arrayWithCapacity:jsonArray.count];
    for (id json in jsonArray) {
        Banner *product=[[Banner alloc]initByJson:json];
        [banners addObject:product];
    }
    return self;
}
@end

