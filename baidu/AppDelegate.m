//
//  AppDelegate.m
//  baidu
//
//  Created by lee on 14-8-29.
//  Copyright (c) 2014年 lee. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController2Lock.h"

@implementation Product
    @synthesize name;
    @synthesize desc;
    @synthesize price;
    @synthesize price10000;
    @synthesize bei;
    @synthesize shouyi;
    @synthesize ziChan;
    @synthesize image;
-(id)initByJson:(NSDictionary*)json{
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




@implementation ProductCell

    @synthesize nameLabel;
    @synthesize descLabel;
    @synthesize priceLabel;
    @synthesize price10000Label;
    @synthesize beiLabel;
    @synthesize imageView;
    @synthesize ziChanLabel;

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
        if(self.shouyiLabel!=nil){
            self.shouyiLabel.text =product.shouyi;
        }
        if(self.ziChanLabel!=nil){
            self.ziChanLabel.text =product.ziChan;
        }
    }
@end

@implementation ViewPro

    - (id)initWithFrame:(CGRect)frame
    {
        self = [super initWithFrame:frame];
        if (self) {
            // Initialization code
        }
        return self;
    }

    -(void) init:(Product*)product withNib:(NSString*)nibName x:(NSInteger)x{
        ProductCell * cell=[[[NSBundle mainBundle]loadNibNamed:nibName owner:nil options:nil]firstObject];
        [cell initWithProduct:product];
        cell.frame=CGRectMake(x,0, cell.frame.size.width, cell.frame.size.height);
        [self addSubview:cell];    }
@end


@implementation UIBase

    //设置tableview多于行无分割线
    +(void)setExtraCellLineHidden: (UITableView *)tableView{
        UIView *view = [UIView new];
        view.backgroundColor = [UIColor clearColor];
        [tableView setTableFooterView:view];
    }

@end


@implementation HttpGet
static bool ByJson=true;
+(NSMutableArray*)getProducts{
    if (ByJson) {
        NSError *error;
        //加载一个NSURL对象
        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://192.168.235.1:8080/shop/j_room?id=1"]];
        //将请求的url数据放到NSData对象中
        NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
        //IOS5自带解析类NSJSONSerialization从response中解析出数据放到字典中
        NSArray* deserializedArray = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableLeaves error:&error];
        
        if (deserializedArray != nil && error == nil){
            NSMutableArray* products = [NSMutableArray arrayWithCapacity:deserializedArray.count];
            for (id json in deserializedArray) {
                Product *product=[[Product alloc]initByJson:json];
                [products addObject:product];
            }
            return products;
        }
    }else{
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
    return nil;
   }
@end

@implementation AppDelegate

@synthesize products;
@synthesize isShow;
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    UIColor* commonColor=[UIColor colorWithRed:233.0/255.0 green:1.0/255.0 blue:2.0/255.0 alpha:1.0];
    UIColor* fontColor=[UIColor whiteColor];
    [[UITabBar appearance] setTintColor:commonColor];
    
    [[UINavigationBar appearance] setBarTintColor:commonColor];
    [[UINavigationBar appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObject:fontColor forKey:NSForegroundColorAttributeName]];
    [[UINavigationBar appearance] setTintColor:fontColor];
    
    products=[HttpGet getProducts];
    isShow=NO;
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
    if(!isShow){
        isShow=YES;
        UITabBarController *tab=(UITabBarController *)self.window.rootViewController;
        UINavigationController* nav=(UINavigationController*)[tab.viewControllers objectAtIndex:tab.selectedIndex];
        ViewController2Lock  *lock=[nav.storyboard instantiateViewControllerWithIdentifier:@"10001"];
        lock.navigationItem.hidesBackButton=YES;
        lock.hidesBottomBarWhenPushed=YES;
        [nav pushViewController:lock animated:YES];
        //[currentViewCtrl presentViewController:lock animated:NO completion:nil];
    }
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
