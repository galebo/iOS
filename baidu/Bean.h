//
//  Bean.h
//  baidu
//
//  Created by lee on 14-9-11.
//  Copyright (c) 2014年 lee. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol String2Bean <NSObject>
- (id)initByJson:(id)json;
@end

@protocol ProcessBean <NSObject>
- (void)exe:(id)bean;
@end

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
-(Product*)initByJson:(NSDictionary*)json;
@end

@interface Banner:NSObject
@property (nonatomic, retain)  NSString *img;
@property (nonatomic, retain)  NSString *url;
-(id)initByJson:(NSDictionary*)json;
@end

@interface Home:NSObject
@property (nonatomic, retain)  NSMutableArray *banners;
-(Home*)initByJson:(NSDictionary*)json;
@end

@interface ShouYi:NSObject
@property (nonatomic, retain)  NSString *name;
@property (nonatomic, retain)  NSString *date;
@property (nonatomic, retain)  NSString *money;
@property (nonatomic, retain)  NSString *desc;
-(ShouYi*)initByJson:(NSDictionary*)json;
@end

@interface ShouYis:NSObject<String2Bean>
@property (nonatomic, retain)  NSMutableArray *shouYis;
-(ShouYis*)initByJson:(NSDictionary*)json;
@end