//
//  Base64Encryption.h
//  BDaoyou
//
//  Created by SunShine.Rock on 15/9/7.
//  Copyright (c) 2015年 Kevin. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <Foundation/Foundation.h>

#define __BASE64( text )        [Base64Encryption base64StringFromText:text]
#define __TEXT( base64 )        [Base64Encryption textFromBase64String:base64]

@interface Base64Encryption : NSObject

/******************************************************************************
 函数名称 : + (NSString *)base64StringFromText:(NSString *)text
 函数描述 : 将文本转换为base64格式字符串
 输入参数 : (NSString *)text    文本
 输出参数 : N/A
 返回参数 : (NSString *)    base64格式字符串
 备注信息 :
 ******************************************************************************/
+ (NSString *)base64StringFromText:(NSString *)text withKey:(NSString *)key;

/******************************************************************************
 函数名称 : + (NSString *)textFromBase64String:(NSString *)base64
 函数描述 : 将base64格式字符串转换为文本
 输入参数 : (NSString *)base64  base64格式字符串
 输出参数 : N/A
 返回参数 : (NSString *)    文本
 备注信息 :
 ******************************************************************************/
+ (NSString *)textFromBase64String:(NSString *)base64 withKey:(NSString *)key;

@end
