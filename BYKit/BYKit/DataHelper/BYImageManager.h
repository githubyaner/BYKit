//
//  BYImageManager.h
//  BYKit
//
//  Created by SunShine.Rock on 16/9/12.
//  Copyright © 2016年 Berton. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface BYImageManager : NSObject
/*
 *  压缩图片
 */
+ (UIImage*)imageWithImage:(UIImage*)image scaledToSize:(CGSize)newSize;

/*
 *  读取本地图片
 */
+ (UIImage *)getLocationImage:(NSString *)key;

/*
 *  加载拉伸图片
 */
+ (UIImage *)resizedImageWithName:(NSString *)name;
@end
