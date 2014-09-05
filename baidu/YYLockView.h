//
//  YYLockView.h
//  01-手势解锁（基本）
//
//  Created by apple on 14-6-18.
//  Copyright (c) 2014年 itcase. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YYLockView;
@protocol YYLockViewDelegate <NSObject>
    //自定义一个协议
    //协议方法，把当前视图作为参数
    -(void)LockViewDidClick:(YYLockView *)lockView andPwd:(NSString *)pwd;
@end

@interface YYLockView : UIView
    //代理
    @property(nonatomic,weak) IBOutlet id<YYLockViewDelegate>delegate;
@end