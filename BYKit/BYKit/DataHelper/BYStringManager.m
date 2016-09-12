//
//  BYStringManager.m
//  BYKit
//
//  Created by SunShine.Rock on 16/4/26.
//  Copyright © 2016年 Kevin. All rights reserved.
//

#import "BYStringManager.h"

@implementation BYStringManager

/*
 *将上传的数组转换成json字符串返回
 */
+ (NSString *)getJsonString:(id)message {
    NSData * jsonData = [NSJSONSerialization dataWithJSONObject:message options:0 error:nil];
    NSString * myString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    return myString;
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

/*
 *判断字符串是否为空
 */
+ (BOOL)isBlankString:(NSString *)string {
    if (string == nil || string == NULL) {
        return YES;
    }
    if ([string isKindOfClass:[NSNull class]]) {
        return YES;
    }
    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0) {
        return YES;
    }
    return NO;
}

@end
