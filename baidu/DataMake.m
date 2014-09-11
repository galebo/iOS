//
//  DataMake.m
//  baidu
//
//  Created by lee on 14-9-10.
//  Copyright (c) 2014年 lee. All rights reserved.
//

#import "DataMake.h"
#import "AppDelegate.h"
@implementation DataMake
+(NSMutableArray*) getProducts{
    NSMutableArray* products = [NSMutableArray arrayWithCapacity:4];
    
    Product *player = [[Product alloc] init];
    player.name = @"百度利滚利版";
    player.desc = @"一元起购，即买即到，随用随取";
    player.price = @"4.654";
    player.price10000 = @"5";
    player.bei = @"34";
    player.image=@"product.png";
    player.shouyi=@"30.0元";
    player.ziChan=@"10000";
    [products addObject:player];
    player = [[Product alloc] init];
    player.name = @"百赚";
    player.desc = @"低风险，一元起购，随时买卖";
    player.price = @"4.387";
    player.price10000 = @"6";
    player.bei = @"35";
    player.image=@"button.png";
    player.shouyi=@"31.0元";
    player.ziChan=@"20000";
    [products addObject:player];
    player = [[Product alloc] init];
    player.name = @"百发";
    player.desc = @"团结就有8%，理财周期30天";
    player.price = @"7.859";
    player.price10000 = @"7";
    player.bei = @"36";
    player.image=@"product.png";
    player.shouyi=@"32.0元";
    player.ziChan=@"30000";
    [products addObject:player];
    player = [[Product alloc] init];
    player.name = @"百度理财B";
    player.desc = @"低风险，一元起购，随时买卖";
    player.price = @"4.387";
    player.price10000 = @"8";
    player.bei = @"37";
    player.image=@"button.png";
    player.shouyi=@"33.0元";
    player.ziChan=@"40000";
    [products addObject:player];
    return products;

}
@end
