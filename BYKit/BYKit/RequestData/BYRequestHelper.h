//
//  BYRequestHelper.h
//  BYKit
//
//  Created by SunShine.Rock on 16/4/28.
//  Copyright © 2016年 Berton. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SystemConfiguration/SystemConfiguration.h>

@interface BYRequestHelper : NSObject

/*
 *  判断当前网络是否可用
 */
+ (BOOL)isNetworkEnabled;

/*
 *  将请求的Json数据转成NSDictionary
 */
+ (NSDictionary *)jsonStrToDic:(NSString *)jsonStr;

@end
