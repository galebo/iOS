//
//  ViewControllerFav.m
//  baidu
//
//  Created by lee on 14-9-1.
//  Copyright (c) 2014年 lee. All rights reserved.
//

#import "ViewControllerFav.h"

@interface ViewControllerFav ()

@end

@implementation ViewControllerFav

@synthesize focusView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupViews];
    //[self.view setBackgroundColor:[UIColor colorWithRed:220/255.0 green:39/255.0 blue:25/255.0 alpha:1]];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark -
- (void)setupViews
{
    SGFocusImageItem *item1 = [[SGFocusImageItem alloc] initWithTitle:nil image:[UIImage imageNamed:@"banner1"] tag:0] ;
    SGFocusImageItem *item2 = [[SGFocusImageItem alloc] initWithTitle:nil image:[UIImage imageNamed:@"banner2"] tag:1] ;
    SGFocusImageItem *item3 = [[SGFocusImageItem alloc] initWithTitle:nil image:[UIImage imageNamed:@"banner3"] tag:2] ;
    SGFocusImageItem *item4 = [[SGFocusImageItem alloc] initWithTitle:nil image:[UIImage imageNamed:@"banner4"] tag:4] ;
    SGFocusImageFrame *imageFrame = [[SGFocusImageFrame alloc] initWithFrame:CGRectMake(0, 0, focusView.bounds.size.width,144.0)
                                                                    delegate:self  focusImageItems:item1, item2, item3, item4, nil];
    [focusView addSubview:imageFrame];

}

#pragma mark -
- (void)foucusImageFrame:(SGFocusImageFrame *)imageFrame didSelectItem:(SGFocusImageItem *)item
{
    NSLog(@"%@ tapped", item.title);
}

@end
