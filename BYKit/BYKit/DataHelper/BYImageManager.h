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
 *  压缩图片至指定的大小KB.(文件压缩+尺寸压缩)
 */
- (NSData *)compressWithImage:(UIImage *)image maxKB:(NSInteger)maxKB;

/*
 *  读取本地图片
 */
+ (UIImage *)getLocationImage:(NSString *)key;

/*
 *  加载拉伸图片
 */
+ (UIImage *)resizedImageWithName:(NSString *)name;
@end
