//
//  BYRequestHelper.m
//  BYKit
//
//  Created by SunShine.Rock on 16/4/28.
//  Copyright © 2016年 Berton. All rights reserved.
//

#import "BYRequestHelper.h"
#import <SystemConfiguration/SystemConfiguration.h>
#import "AFNetworking.h"
#import "BYMacro.h"
#import "MBProgressHUD.h"

@implementation BYRequestHelper

/*
 *  判断当前网络是否可用
 */
+ (BOOL)isNetworkEnabled {
    BOOL bEnabled = FALSE;
    NSString *url = @"www.baidu.com";
    SCNetworkReachabilityRef ref = SCNetworkReachabilityCreateWithName(NULL, [url UTF8String]);
    SCNetworkReachabilityFlags flags;
    
    bEnabled = SCNetworkReachabilityGetFlags(ref, &flags);
    
    CFRelease(ref);
    if (bEnabled) {
        BOOL flagsReachable = ((flags & kSCNetworkFlagsReachable) != 0);
        BOOL connectionRequired = ((flags & kSCNetworkFlagsConnectionRequired) != 0);
        BOOL nonWiFi = flags & kSCNetworkReachabilityFlagsTransientConnection;
        bEnabled = ((flagsReachable && !connectionRequired) || nonWiFi) ? YES : NO;
    }
    return bEnabled;
}

//开启网络状态检测
+ (void)startTheNetworkStateMonitoring {
    AFNetworkReachabilityManager *reachabilityManager = [AFNetworkReachabilityManager sharedManager];
    [reachabilityManager startMonitoring];
    [reachabilityManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status)
        {
            case AFNetworkReachabilityStatusUnknown:
            {
                //未知
            }
                break;
            case AFNetworkReachabilityStatusNotReachable:
            {
                BYHUD(@"网络无连接", 0.5)
                //创建一个消息对象
                NSNotification *notice = [NSNotification notificationWithName:BYNetworkState object:nil userInfo:@{@"BYNetworkState": BYNetworkState_NotReachable}];
                //发送消息
                [[NSNotificationCenter defaultCenter] postNotification:notice];

            }
                break;
            case AFNetworkReachabilityStatusReachableViaWWAN:
            {
                BYHUD(@"运营商网络", 0.5)
                //创建一个消息对象
                NSNotification *notice = [NSNotification notificationWithName:BYNetworkState object:nil userInfo:@{@"BYNetworkState": BYNetworkState_WWAN}];
                //发送消息
                [[NSNotificationCenter defaultCenter] postNotification:notice];
            }
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi:
            {
                BYHUD(@"WIFI", 0.5)
                //创建一个消息对象
                NSNotification *notice = [NSNotification notificationWithName:BYNetworkState object:nil userInfo:@{@"BYNetworkState": BYNetworkState_WIFI}];
                //发送消息
                [[NSNotificationCenter defaultCenter] postNotification:notice];
            }
                break;
                
            default:
                break;
        }

    }];
}

//开启网络状态检测
+ (void)stopTheNetworkStateMonitoring {
    AFNetworkReachabilityManager *reachabilityManager = [AFNetworkReachabilityManager sharedManager];
    [reachabilityManager stopMonitoring];
}
@end
