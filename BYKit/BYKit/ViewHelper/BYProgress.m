//
//  BYProgress.m
//  BYKit
//
//  Created by SunShine.Rock on 16/4/26.
//  Copyright © 2016年 Kevin. All rights reserved.
//

#import "BYProgress.h"
#import "MBProgressHUD.h"

@implementation BYProgress
//添加风火轮
+ (void)addProgressWithView:(UIView *)view {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeIndeterminate;
    hud.labelText = @"加载中...";
}
//删除风火轮
+ (void)deleteProgressWithView:(UIView *)view {
    [MBProgressHUD hideHUDForView:view animated:YES];
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}
@end
