//
//  BYRequestHelper.m
//  BYKit
//
//  Created by SunShine.Rock on 16/4/28.
//  Copyright © 2016年 Berton. All rights reserved.
//

#import "BYRequestHelper.h"
#import <SystemConfiguration/SystemConfiguration.h>

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

/*
 *  将请求的Json数据转成NSDictionary
 */
+ (NSDictionary *)jsonStrToDic:(NSString *)jsonStr {
    NSString *requestTmp = [NSString stringWithString:jsonStr];
    NSData *resData = [[NSData alloc] initWithData:[requestTmp dataUsingEncoding:NSUTF8StringEncoding]] ;
    NSDictionary *jsonDic = [NSJSONSerialization JSONObjectWithData:resData options:NSJSONReadingMutableLeaves error:nil];
    return jsonDic;
}

@end
