//
//  BYKit.h
//  BYKit
//
//  Created by SunShine.Rock on 16/4/27.
//  Copyright © 2016年 Berton. All rights reserved.
//

#import <UIKit/UIKit.h>

//! Project version number for BYKit.
FOUNDATION_EXPORT double BYKitVersionNumber;

//! Project version string for BYKit.
FOUNDATION_EXPORT const unsigned char BYKitVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <BYKit/PublicHeader.h>


#import "BYBaseModel.h"
#import "BYBaseViewController.h"


#import "BYRequestManager.h"
#import "BYRequestHelper.h"


#import "BYProgress.h"


#import "BYDataManager.h"
#import "BYStringManager.h"
#import "BYMacro.h"
#import "BYOtherMacro.h"


#import "AFNetworking.h"
#import "QiniuUploader.h"
#import "MBProgressHUD.h"
#import "DACircularProgressView.h"
/*
 *  framework不包含以下三种(因为以下三种有存在静态库)
 */
/*
#import "BaiduMobStat.h"
#import "MJRefresh.h"
#import "JPUSHService.h"
 */


#import "MyMD5.h"
#import "Base64Encryption.h"
#import "AESCrypt.h"


#import "PNChart.h"
#import "ATLabel.h"
#import "CXAlertView.h"
#import "STAlertView.h"
#import "DailyView.h"
#import "HMSegmentedControl.h"
#import "UIViewController+KNSemiModal.h"
#import "KxMenu.h"
#import "QRCodeGenerator.h"
#import "UICountingLabel.h"
#import "ZFModalTransitionAnimator.h"

/*
 *  使用以下分类,需要设置:TARGETS->Build Settings->Other Linker Flags:-objc,-all_load
 */
#import "UIImageView+WebCache.h"
#import "UIButton+WebCache.h"
#import "UIKit+AFNetworking.h"


