//
//  UIControl+BYContinuous.h
//  BYKit
//
//  Created by SunShine.Rock on 16/9/12.
//  Copyright © 2016年 Berton. All rights reserved.
//

#import <UIKit/UIKit.h>

#define CLICK_INTERVAL_DEFAULT 0.5

@interface UIControl (BYContinuous)
/*
 *  两次响应之间的时间间隔
 */
@property (nonatomic, assign) NSTimeInterval clickEventInterval;
/*
 *  是否忽略事件true 忽略 flase不忽略
 */
@property (nonatomic, strong) NSNumber *ignoreEvent;
@end
