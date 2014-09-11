//
//  Bean.h
//  baidu
//
//  Created by lee on 14-9-11.
//  Copyright (c) 2014年 lee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Product:NSObject
//@property (nonatomic, weak) NSString *imageView;
@property (nonatomic, retain)  NSString *name;
@property (nonatomic, retain)  NSString *desc;
@property (nonatomic, retain)  NSString *price;
@property (nonatomic, retain)  NSString *price10000;
@property (nonatomic, retain)  NSString *bei;
@property (nonatomic, retain)  NSString *image;
@property (nonatomic, retain)  NSString *shouyi;
@property (nonatomic, retain)  NSString *ziChan;
-(id)initByJson:(NSDictionary*)json;
@end

@interface Banner:NSObject
@property (nonatomic, retain)  NSString *img;
@property (nonatomic, retain)  NSString *url;
-(id)initByJson:(NSDictionary*)json;
@end

@interface Home:NSObject
@property (nonatomic, retain)  NSMutableArray *banners;
-(id)initByJson:(NSDictionary*)json;
@end