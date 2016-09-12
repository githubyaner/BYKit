//
//  BYFileManager.h
//  BYKit
//
//  Created by SunShine.Rock on 16/9/12.
//  Copyright © 2016年 Berton. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>


@interface BYFileManager : NSObject
/*
 *  删除沙盒文件
 */
+ (BOOL)deleteFile:(NSString *)key;
/*
 *  获取缓存大小
 */
+ (CGFloat)folderSizeAtPath:(NSString *)folderPath;
/*
 *  清除缓存
 */
+ (void)myClearCacheAction;
@end
