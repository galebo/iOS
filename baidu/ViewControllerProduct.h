//
//  ViewControllerProduct.h
//  baidu
//
//  Created by lee on 14-9-2.
//  Copyright (c) 2014年 lee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewControllerProduct : UITableViewController

@end



@interface ProductCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *nameLabel;
@property (nonatomic, weak) IBOutlet UILabel *descLabel;
@property (nonatomic, weak) IBOutlet UILabel *priceLabel;
@property (nonatomic, weak) IBOutlet UIImageView *imageView;

@end

@interface Product:NSObject{
    NSString *name;
    NSString *desc;
    NSString *price;
}

//@property (nonatomic, weak) NSString *imageView;
@property (nonatomic, retain)  NSString *name;
@property (nonatomic, retain)  NSString *desc;
@property (nonatomic, retain)  NSString *price;
@end