//
//  BYRequestHelper.h
//  BYKit
//
//  Created by SunShine.Rock on 16/4/28.
//  Copyright © 2016年 Berton. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SystemConfiguration/SystemConfiguration.h>

static NSString * _Nonnull BYNetworkState = @"BYNetworkState";
static NSString * _Nonnull BYNetworkState_NotReachable = @"BYNetworkState_NotReachable";
static NSString * _Nonnull BYNetworkState_WWAN = @"BYNetworkState_WWAN";
static NSString * _Nonnull BYNetworkState_WIFI = @"BYNetworkState_WIFI";


@interface BYRequestHelper : NSObject
/*
 *  判断当前网络是否可用
 */
+ (BOOL)isNetworkEnabled;
/*
 *  开启网络状态检测
 */
+ (void)startTheNetworkStateMonitoring;
/*
 *  关闭网络状态检测
 */
+ (void)stopTheNetworkStateMonitoring;
@end
