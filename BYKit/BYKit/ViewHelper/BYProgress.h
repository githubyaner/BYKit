//
//  BYProgress.h
//  BYKit
//
//  Created by SunShine.Rock on 16/4/26.
//  Copyright © 2016年 Kevin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface BYProgress : NSObject
//添加风火轮
+ (void)addProgressWithView:(UIView *)view;
//删除风火轮
+ (void)deleteProgressWithView:(UIView *)view;
@end
