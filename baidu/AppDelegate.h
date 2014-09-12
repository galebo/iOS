//
//  AppDelegate.h
//  baidu
//
//  Created by lee on 14-8-29.
//  Copyright (c) 2014年 lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Bean.h"


@interface AppDelegate : UIResponder <UIApplicationDelegate>

    @property (strong, nonatomic) NSMutableArray* products;
    @property (strong, nonatomic) UIWindow *window;
    @property( nonatomic) BOOL isShow;
@end



@interface ProductCell : UITableViewCell

    @property (nonatomic, weak) IBOutlet UILabel *nameLabel;
    @property (nonatomic, weak) IBOutlet UILabel *descLabel;
    @property (nonatomic, weak) IBOutlet UILabel *priceLabel;
    @property (nonatomic, weak) IBOutlet UILabel *shouyiLabel;
    @property (nonatomic, weak) IBOutlet UILabel *price10000Label;
    @property (nonatomic, weak) IBOutlet UILabel *beiLabel;
    @property (nonatomic, weak) IBOutlet UIImageView *imageView;
    @property (nonatomic, weak) IBOutlet UILabel *ziChanLabel;

    -(void) initWithProduct:(Product*)product;

@end

@interface ProductView : UIView

@property (nonatomic, weak) IBOutlet UILabel *nameLabel;
@property (nonatomic, weak) IBOutlet UILabel *descLabel;
@property (nonatomic, weak) IBOutlet UILabel *priceLabel;
@property (nonatomic, weak) IBOutlet UILabel *shouyiLabel;
@property (nonatomic, weak) IBOutlet UILabel *price10000Label;
@property (nonatomic, weak) IBOutlet UILabel *beiLabel;
@property (nonatomic, weak) IBOutlet UIImageView *imageView;
@property (nonatomic, weak) IBOutlet UILabel *ziChanLabel;

-(void) initWithProduct:(Product*)product;

@end

@interface ViewPro : UIView
    -(void) init:(Product*)product withNib:(NSString*)nibName x:(NSInteger)x;
@end


@interface UIBase : NSObject
//设置tableview多于行无分割线
+(void)setExtraCellLineHidden: (UITableView *)tableView;
@end
