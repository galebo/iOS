//
//  AppDelegate.m
//  baidu
//
//  Created by lee on 14-8-29.
//  Copyright (c) 2014年 lee. All rights reserved.
//

#import "AppDelegate.h"

@implementation Product
@synthesize name;
@synthesize desc;
@synthesize price;
@synthesize price10000;
@synthesize bei;
@end




@implementation ProductCell
@synthesize nameLabel;
@synthesize descLabel;
@synthesize priceLabel;
@synthesize price10000Label;
@synthesize beiLabel;
@synthesize imageView;

-(void) initWithProduct:(Product*) product{
    self.nameLabel.text = product.name;
    self.descLabel.text = product.desc;
    self.priceLabel.text = product.price;
    
    if(self.beiLabel!=nil){
        self.beiLabel.text=product.bei;
    }
    if(self.price10000Label!=nil){
        self.price10000Label.text=product.price10000;
    }
    if(self.imageView!=nil){
        self.imageView.image =[UIImage imageNamed:product.image];
    }
}
@end


@implementation AppDelegate

@synthesize products;
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    UIColor* commonColor=[UIColor colorWithRed:233.0/255.0 green:1.0/255.0 blue:2.0/255.0 alpha:1.0];
    UIColor* fontColor=[UIColor whiteColor];
    [[UITabBar appearance] setTintColor:commonColor];
    
    [[UINavigationBar appearance] setBarTintColor:commonColor];
    [[UINavigationBar appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObject:fontColor forKey:NSForegroundColorAttributeName]];
    [[UINavigationBar appearance] setTintColor:fontColor];
    
    products = [NSMutableArray arrayWithCapacity:4];
    
    Product *player = [[Product alloc] init];
    player.name = @"百度利滚利版";
    player.desc = @"一元起购，即买即到，随用随取";
    player.price = @"4.654";
    player.price10000 = @"5";
    player.bei = @"34";
    player.image=@"product.png";
    [products addObject:player];
    player = [[Product alloc] init];
    player.name = @"百赚";
    player.desc = @"低风险，一元起购，随时买卖";
    player.price = @"4.387";
    player.price10000 = @"6";
    player.bei = @"35";
    player.image=@"button.png";
    [products addObject:player];
    player = [[Product alloc] init];
    player.name = @"百发";
    player.desc = @"团结就有8%，理财周期30天";
    player.price = @"7.859";
    player.price10000 = @"7";
    player.bei = @"36";
    player.image=@"product.png";
    [products addObject:player];
    player = [[Product alloc] init];
    player.name = @"百度理财B";
    player.desc = @"低风险，一元起购，随时买卖";
    player.price = @"4.387";
    player.price10000 = @"8";
    player.bei = @"37";
    player.image=@"button.png";
    [products addObject:player];
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
