//
//  AppDelegate.h
//  baidu
//
//  Created by lee on 14-8-29.
//  Copyright (c) 2014年 lee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

    @property (strong, nonatomic) NSMutableArray* products;
    @property (strong, nonatomic) UIWindow *window;

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
    @end

    @interface ProductCell : UITableViewCell

    @property (nonatomic, weak) IBOutlet UILabel *nameLabel;
    @property (nonatomic, weak) IBOutlet UILabel *descLabel;
    @property (nonatomic, weak) IBOutlet UILabel *priceLabel;
    @property (nonatomic, weak) IBOutlet UILabel *shouyiLabel;
    @property (nonatomic, weak) IBOutlet UILabel *price10000Label;
    @property (nonatomic, weak) IBOutlet UILabel *beiLabel;
    @property (nonatomic, weak) IBOutlet UIImageView *imageView;

    -(void) initWithProduct:(Product*)product;

@end


@interface ViewPro : UIView
    -(id) init:(Product*)product withNib:(NSString*)nibName x:(NSInteger)x;
@end


@interface UIBase : NSObject
    //设置tableview多于行无分割线
    +(void)setExtraCellLineHidden: (UITableView *)tableView;
@end