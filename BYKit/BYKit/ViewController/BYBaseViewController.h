//
//  BYBaseViewController.h
//  BYKit
//
//  Created by SunShine.Rock on 16/4/26.
//  Copyright © 2016年 Kevin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BYRequestManager.h"

@interface BYBaseViewController : UIViewController

/*
 *  数据请求
 *  使用的时候请先初始化
 */
@property (nonatomic, strong) BYRequestManager*requestManager;

/*
 *  回调方法
 */
@property (nonatomic, copy) void(^bySendMessageBlock)(id message);

/*
 *  添加loading
 */
- (void)addProgress;

/*
 *  删除loading
 */
- (void)deleteProgress;

/*
 *  添加loading Of Navigation
 */
- (void)addProgressOfNavigation;

/*
 *  删除loading Of Navigation
 */
- (void)deleteProgressOfNavigation;

/*
 *  取消当前请求
 */
- (void)cancelRequest;

@end
