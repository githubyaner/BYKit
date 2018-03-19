//
//  BYMacro.h
//  BYKit
//
//  Created by SunShine.Rock on 16/4/27.
//  Copyright © 2016年 Berton. All rights reserved.
//

#ifndef BYMacro_h
#define BYMacro_h


/*
 *  设备类型
 */
#pragma mark - 设备类型

#define IS_IPhone4 ((320 == [[UIScreen mainScreen] bounds].size.width && 480 == [[UIScreen mainScreen] bounds].height) ? YES : NO)
#define IS_IPhone5 ((320 == [[UIScreen mainScreen] bounds].size.width && 568 == [[UIScreen mainScreen] bounds].height) ? YES : NO)
#define IS_IPhone6 ((375 == [[UIScreen mainScreen] bounds].size.width) ? YES : NO)
#define IS_IPhone6plus ((414 == [[UIScreen mainScreen] bounds].size.width) ? YES : NO)
#define IS_iPhoneX ((375 == [[UIScreen mainScreen] bounds].size.width && 812 == [[UIScreen mainScreen] bounds].height) ? YES : NO)

#define kiPhone4     ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)
#define kiPhone5     ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define kiPhone6     ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)
#define kiPhone6Plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)
#define kiPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)


/*
 *  屏幕相关
 */
#pragma mark - 屏幕相关

#define BYViewWidth     [UIScreen mainScreen].bounds.size.width
#define BYViewHeight    [UIScreen mainScreen].bounds.size.height
#define BYBounds        [UIScreen mainScreen].bounds
#define BYStatusBarAndNavigationBarHeight (kiPhoneX ? 88.f : 64.f)
#define BYTabbarHeight  (kiPhoneX ? (49.f + 34.f) : 49.f)
#define BYSafeAreaBottomHeight (kiPhoneX ? 34.f : 0.0)
#define BYHeightCoefficient (kiPhoneX ? 667.0 / 667.0 : BYViewHeight / 667.0)

#define BYContentVWidth self.frame.size.width
#define BYContentVHeight self.frame.size.height


/*
 *  Session
 */
#pragma mark - Session

#define BYSession(str) [NSString stringWithFormat:@"%@", str]

/*
 *  Alert and Progress
 */
#pragma mark - Alert and Progress

#define BYOldAlertView(title, errorStr) [[UIAlertView alloc] initWithTitle:title message:[NSString stringWithFormat:@"%@", errorStr] delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil]

#define BYAlertView(title, messageStr, viewController) UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:messageStr preferredStyle:UIAlertControllerStyleAlert];\
[alertController addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];\
[viewController presentViewController:alertController animated:YES completion:nil];

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


/*
 *  MJRefresh iOS 11适配
 */
#pragma mark - MJRefresh iOS 11适配

#define BYAdjustsScrollViewInsetNever(controller, view) if(@available(iOS 11.0, *)) {view.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;} else if([controller isKindOfClass:[UIViewController class]]) {controller.automaticallyAdjustsScrollViewInsets = false;}


/*
 *  设备详情
 */
#pragma mark - 设备详情

#define kIOS_VERSION    [[[UIDevice currentDevice] systemVersion] floatValue]
#define kDEVICE_MODEL   [[UIDevice currentDevice] model]
#define kIS_IPAD        ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)
#define kAPP_NAME            [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"]
#define kAPP_VERSION         [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
#define kAPP_SUB_VERSION     [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]
#define kUDeviceIdentifier   [[UIDevice currentDevice] uniqueDeviceIdentifier]


/*
 *  系统版本
 */
#pragma mark - 系统版本

#define BYVersion [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]


/*
 *  常用单例以及方法
 */
#pragma mark - 常用单例以及方法

#define kWeakSelf(weakSelf)     __weak __typeof(&*self)weakSelf = self;
#define kUSER_DEFAULT           [NSUserDefaults standardUserDefaults]
#define kNOTIFICATION_DEFAULT   [NSNotificationCenter defaultCenter]

#define kIMAGENAMED(imageName)  [UIImage imageNamed:imageName]
#define kLOADIMAGE(file, ext)   [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:file ofType:ext]]
#define kSANDBOXIMAGE(name)     [[UIImage alloc] initWithContentsOfFile:[NSString stringWithFormat:@"%@/Documents/%@", NSHomeDirectory(), name]]

#define kCurrentLanguage ([[NSLocale preferredLanguages] objectAtIndex:0])
#define kLocal(x, ...) NSLocalizedString(x, nil)

//G－C－D
#define BACK(block) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block)
#define MAIN(block) dispatch_async(dispatch_get_main_queue(),block)

#define kDegreesToRadian(x)         (M_PI * (x) / 180.0)
#define kRadianToDegrees(radian)    (radian*180.0)/(M_PI)


/*
 *  是否为空或是[NSNull null]
 */
#pragma mark - 是否为空或是[NSNull null]

#define kNotNilAndNull(_ref)    (((_ref) != nil) && (![(_ref) isEqual:[NSNull null]]))
#define kIsNilOrNull(_ref)      (((_ref) == nil) || ([(_ref) isEqual:[NSNull null]]))


/*
 *  颜色
 */
#pragma mark - 颜色

#define kCOLOR_RGB(r,g,b)     [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1.0]
#define kCOLOR_RGBA(r,g,b,a)  [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]


/*
 *  定义字号
 */
#pragma mark - 定义字号

#define kFONT_TITLE(X)     [UIFont systemFontSize:X]
#define kFONT_CONTENT(X)   [UIFont systemFontSize:X]


/*
 *  DEBUG Log
 */
#pragma mark - DEBUG Log
//DLog
#ifdef DEBUG
#   define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#   define DLog(...)
#endif

//ULog
#ifdef DEBUG
#   define ULog(fmt, ...)  { UIAlertView *alert = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"%s\n [Line %d] ", __PRETTY_FUNCTION__, __LINE__] message:[NSString stringWithFormat:fmt, ##__VA_ARGS__]  delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil]; [alert show];}
#else
#   define ULog(...)
#endif


#endif /* BYMacro_h */
