//
//  BYMacro.h
//  BYKit
//
//  Created by SunShine.Rock on 16/4/27.
//  Copyright © 2016年 Berton. All rights reserved.
//

#ifndef BYMacro_h
#define BYMacro_h


//My Macro
#define IS_IPHONE5 (([[UIScreen mainScreen] bounds].size.width == 320) ? YES : NO)
#define IS_IPhone6 (375 == [[UIScreen mainScreen] bounds].size.width ? YES : NO)
#define IS_IPhone6plus (414 == [[UIScreen mainScreen] bounds].size.width ? YES : NO)


#define BYViewWidth [UIScreen mainScreen].bounds.size.width
#define BYViewHeight [UIScreen mainScreen].bounds.size.height
#define BYBounds [UIScreen mainScreen].bounds


#define BYCellWidth self.frame.size.width
#define BYCellHeight self.frame.size.height


#define BYVersion [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]


#define Session(str) [NSString stringWithFormat:@"%@", str]


#define BYAlertView(errorStr) [[UIAlertView alloc] initWithTitle:nil message:[NSString stringWithFormat:@"%@", errorStr] delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil]

#define BYHUD(message, delay) \
\
MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow animated:YES];\
\
hud.mode = MBProgressHUDModeText;\
\
hud.labelText = [NSString stringWithFormat:@"%@", message];\
\
hud.margin = 10.f;\
\
hud.removeFromSuperViewOnHide = YES;\
\
[hud hide:YES afterDelay:delay];\
\


#define AddBYProgress(view, string) \
\
MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];\
\
hud.mode = MBProgressHUDModeIndeterminate;\
\
hud.labelText = [NSString stringWithFormat:@"%@", string];\
\


#define DeleteBYProgress \
\
[MBProgressHUD hideHUDForView:self.view animated:YES];\
\
[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;\
\



#pragma mark - 设备类型
#define kiPhone4     ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)
#define kiPhone5     ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define kiPhone6     ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)
#define kiPhone6Plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)


#pragma mark - 设备信息
#define kIOS_VERSION    [[[UIDevice currentDevice] systemVersion] floatValue]
#define kDEVICE_MODEL   [[UIDevice currentDevice] model]
#define kIS_IPAD        ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)
#define kisRetina       ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)
#define kAPP_NAME            [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"]
#define kAPP_VERSION         [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
#define kAPP_SUB_VERSION     [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]
#define kUDeviceIdentifier   [[UIDevice currentDevice] uniqueDeviceIdentifier]


#pragma mark - 常用宏定义
#define kWS(weakSelf)          __weak __typeof(&*self)weakSelf = self;
#define kSCREEN_WIDTH          ([UIScreen mainScreen].bounds.size.width)
#define kSCREEN_HEIGHT         ([UIScreen mainScreen].bounds.size.height)
#define kUSER_DEFAULT          [NSUserDefaults standardUserDefaults]
#define kNOTIFICATION_DEFAULT  [NSNotificationCenter defaultCenter]
#define kIMAGENAMED(_pointer)  [UIImage imageNamed:[UIUtil imageName:_pointer]]
#define kLOADIMAGE(file,ext)   [UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:file ofType:ext]]

#define kScreenWidthScaleSize           (MIN(SCREEN_WIDTH,SCREEN_HEIGHT)/320.0)
#define kScreenWidthScaleSizeByIphone6  (MIN(SCREEN_WIDTH,SCREEN_HEIGHT)/375.0)

#define kDegreesToRadian(x)         (M_PI * (x) / 180.0)
#define kRadianToDegrees(radian)    (radian*180.0)/(M_PI)


#pragma mark - ios版本判断

#define kIOS5_OR_LATER   ( [[[UIDevice currentDevice] systemVersion] compare:@"5.0"] != NSOrderedAscending )
#define kIOS6_OR_LATER   ( [[[UIDevice currentDevice] systemVersion] compare:@"6.0"] != NSOrderedAscending )
#define kIOS7_OR_LATER   ( [[[UIDevice currentDevice] systemVersion] compare:@"7.0"] != NSOrderedAscending )
#define kIOS8_OR_LATER   ( [[[UIDevice currentDevice] systemVersion] compare:@"8.0"] != NSOrderedAscending )


#pragma mark - 是否为空或是[NSNull null]

#define kNotNilAndNull(_ref)  (((_ref) != nil) && (![(_ref) isEqual:[NSNull null]]))
#define kIsNilOrNull(_ref)   (((_ref) == nil) || ([(_ref) isEqual:[NSNull null]]))

#pragma mark - 图片资源获取
#define kIMGFROMBUNDLE( X )     [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:X ofType:@""]]
#define kIMGNAMED( X )         [UIImage imageNamed:X]

//获取头像(沙盒)----传入参数必须带后缀类型
#define kUSERIMAGE(name) [[UIImage alloc] initWithContentsOfFile:[NSString stringWithFormat:@"%@/Documents/%@", NSHomeDirectory(), name]]




#pragma mark - 颜色
#define kCOLOR_RGB(r,g,b)     [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1.0]
#define kCOLOR_RGBA(r,g,b,a)  [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]


#pragma mark - 定义字号
#define kFONT_TITLE(X)     [UIFont systemFontSize:X]
#define kFONT_CONTENT(X)   [UIFont systemFontSize:X]


#endif /* BYMacro_h */
