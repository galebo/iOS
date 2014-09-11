//
//  AppDelegate.m
//  baidu
//
//  Created by lee on 14-8-29.
//  Copyright (c) 2014年 lee. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController2Lock.h"
#import "DataMake.h"

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

@implementation Banner
@synthesize img;
@synthesize url;
-(id)initByJson:(NSDictionary*)json{
    img=[json objectForKey:@"img"];
    url=[json objectForKey:@"url"];
    return self;
}
@end
@implementation Home
@synthesize banners;
-(id)initByJson:(NSDictionary*)json_{
    NSArray* jsonArray=[json_ objectForKey:@"banners"];
    banners = [NSMutableArray arrayWithCapacity:jsonArray.count];
    for (id json in jsonArray) {
        Banner *product=[[Banner alloc]initByJson:json];
        [banners addObject:product];
    }
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

+(NSMutableArray*)getProducts{
    NSArray* rtnJson =[HttpGet doGet:@"http://10.58.187.47:8080/shop/j_room"];
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
    id deserializedArray = [HttpGet doGet:@"http://10.58.187.47:8080/shop/j_home"];
    Home* home=[[Home alloc]initByJson:deserializedArray];
    return home;
}

+(id) doGet:(NSString*)url{
    NSError *error;
    //加载一个NSURL对象
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    //将请求的url数据放到NSData对象中
    NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    //IOS5自带解析类NSJSONSerialization从response中解析出数据放到字典中
    id rtn = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableLeaves error:&error];
    if (rtn != nil && error == nil){
        NSLog(@"rtn:%@",rtn);
        return rtn;
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
    isShow=YES;
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
