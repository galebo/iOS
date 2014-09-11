//
//  SGFocusImageFrame.h
//  SGFocusImageFrame
//
//  Created by Shane Gao on 17/6/12.
//  Copyright (c) 2012 Shane Gao. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SGFocusImageItem;
@class SGFocusImageFrame;

#pragma mark - SGFocusImageFrameDelegate
@protocol SGFocusImageFrameDelegate <NSObject>
    - (void)foucusImageFrame:(SGFocusImageFrame *)imageFrame didSelectItem:(SGFocusImageItem *)item;
@end




@interface SGFocusImageFrame : UIView <UIGestureRecognizerDelegate, UIScrollViewDelegate>

    @property (nonatomic, assign) id<SGFocusImageFrameDelegate> delegate;

    - (id)initWithFrame:(CGRect)frame delegate:(id<SGFocusImageFrameDelegate>)delegate datas:(NSMutableArray *)datas;
    - (void)clickPageImage:(UIButton *)sender;

@end

