//
//  ViewController2My.m
//  baidu
//
//  Created by lee on 14-9-9.
//  Copyright (c) 2014年 lee. All rights reserved.
//

#import "ViewController2My.h"
#import "SHLineGraphView.h"
#import "SHPlot.h"
#import "AppDelegate.h"
@interface ViewController2My ()

@end

@implementation ViewController2My
@synthesize viewPro;
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
    
    [self _initChartView];
    
    
    
    AppDelegate *app = [[UIApplication sharedApplication]delegate];
    [viewPro init:[app.products objectAtIndex:0] withNib:@"ViewProMy" x:0];
    UIButton* button= (UIButton*) [viewPro viewWithTag:10001];
    [button addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    [( (UIButton*) [viewPro viewWithTag:10002]) addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    [( (UIButton*) [viewPro viewWithTag:10003]) addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    [( (UIButton*) [viewPro viewWithTag:10004]) addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) _initChartView{
    
    SHLineGraphView *_lineGraph = [[SHLineGraphView alloc] initWithFrame:CGRectMake(0, 0, self.chartView.frame.size.width, self.chartView.frame.size.height)];
    NSDictionary *_themeAttributes = @{
                                       kXAxisLabelColorKey : [UIColor whiteColor],
                                       kXAxisLabelFontKey : [UIFont fontWithName:@"TrebuchetMS" size:10],
                                       kYAxisLabelColorKey : [UIColor whiteColor],
                                       kYAxisLabelFontKey : [UIFont fontWithName:@"TrebuchetMS" size:10],
                                       kYAxisLabelSideMarginsKey : @20,
                                       kPlotBackgroundLineColorKye : [UIColor redColor]
                                       };
    _lineGraph.themeAttributes = _themeAttributes;
    

    
   // _plot1.plottingPointsLabels = @[@"1", @"2", @"3", @"4", @"5", @"6" , @"7" , @"8", @"9", @"10", @"11", @"12"];
    
    NSDictionary *_plotThemeAttributes = @{
                                           kPlotFillColorKey : [UIColor redColor],
                                           kPlotStrokeWidthKey : @2,
                                           kPlotStrokeColorKey : [UIColor whiteColor],
                                           kPlotPointFillColorKey : [UIColor whiteColor],
                                           kPlotPointValueFontKey : [UIFont fontWithName:@"TrebuchetMS" size:18]
                                           };

    
    
    _lineGraph.yAxisRange = @(60);
    _lineGraph.xAxisValues = @[
                               @{ @1 : @"08-28" },
                               @{ @2 : @"08-29" },
                               @{ @3 : @"08-30" },
                               @{ @4 : @"08-31" },
                               @{ @5 : @"09-01" },
                               @{ @6 : @"09-02" },
                               @{ @7 : @"09-03" }
                               ];
    SHPlot *_plot1 = [[SHPlot alloc] init];
    
    _plot1.plottingValues = @[
                              @{ @1 : @10 },
                              @{ @2 : @20 },
                              @{ @3 : @23 },
                              @{ @4 : @22 },
                              @{ @5 : @40 },
                              @{ @6 : @45 },
                              @{ @7 : @56 }
                              ];
    
    
    _plot1.plotThemeAttributes = _plotThemeAttributes;
    [_lineGraph addPlot:_plot1];
    
    [_lineGraph setupTheView];
    
    [self.chartView setBackgroundColor:[UIColor redColor]];
    [self.chartView addSubview:_lineGraph];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(IBAction)clickButton :(id)sender{
    
    NSLog(@"%ld",[sender tag]);
}

@end
