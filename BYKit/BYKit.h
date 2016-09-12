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


/*
 *  BY Kit
 */
#import "BYBaseModel.h"
#import "BYBaseViewController.h"

#import "BYRequestManager.h"
#import "BYRequestHelper.h"

#import "BYProgress.h"

#import "BYDataManager.h"
#import "BYStringManager.h"
#import "BYFileManager.h"
#import "BYImageManager.h"

#import "BYMacro.h"
#import "BYOtherMacro.h"



/*
 *  BY Category
 */
#import "UIControl+BYContinuous.h"



/*
 *  other sources
 */
#import "AFNetworking.h"
#import "MBProgressHUD.h"

#import "MyMD5.h"
#import "Base64Encryption.h"
#import "AESCrypt.h"


/*
 *  使用以下分类,需要设置:TARGETS->Build Settings->Other Linker Flags:-objc,-all_load
 */
#import "UIImageView+WebCache.h"
#import "UIButton+WebCache.h"
#import "UIKit+AFNetworking.h"


