//
//  BYStringManager.h
//  BYKit
//
//  Created by SunShine.Rock on 16/4/26.
//  Copyright © 2016年 Kevin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BYStringManager : NSObject

/*
 *  将上传的数组转换成json字符串返回
 */
+ (NSString *)getJsonString:(id)message;

/*
 *  判断字符串是否为空
 */
+ (BOOL)isBlankString:(NSString *)string;

/**
 *  仿QQ空间时间显示
 *  @param string eg:2015年5月24日 02时21分30秒
 */
+ (NSString *)format:(NSString *)string;

@end
