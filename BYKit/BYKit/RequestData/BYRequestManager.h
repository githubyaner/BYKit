//
//  BYRequestManager.h
//  BYKit
//
//  Created by SunShine.Rock on 16/4/26.
//  Copyright © 2016年 Kevin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "AFNetworking.h"

@interface BYRequestManager : NSObject

/*
 *  创建一个接受请求数据信息的Block
 */
typedef void (^BYRequestMaster)(NSDictionary *jsonDic, NSString *jsonStr, BOOL isSuccess);

/*
 *  请设置您的连接
 *  warning:GET请求时,请将它拼接完整,然后将其传入
 */
@property (nonatomic, copy) NSString *urlString;

/*
 *  请设置您的参数
 *  warning:POST请求专用
 */
@property (nonatomic, assign) id parameters;

/*
 *  当前请求
 */
@property (nonatomic, strong) AFHTTPRequestOperation *operation;

/*
 *  请求时添加的MBProgressHUD的父视图(self.view或者self.navigationController.view)
 *  当无网络的时候,方便去掉MBProgressHUD
 */
@property (nonatomic, strong) UIView *progressSuperView;

/*
 *  终止当前请求
 */
- (void)cancelCurrentRequest;

/*
 *  GET请求
 *  调用此方法需要提前设置urlString, parameters, progressSuperView
 */
- (void)GET_request:(BYRequestMaster)master;

/*
 *  POST请求
 *  调用此方法需要提前设置urlString, parameters, progressSuperView
 */
- (void)POST_request:(BYRequestMaster)master;

/*
 *  customized get 请求
 *  warning:请求时,请将urlString拼接完整,然后将其传入
 */
- (void)GET_requestWithProgressSuperView:(UIView *)progressSuperView urlString:(NSString *)urlString master:(BYRequestMaster)master;

/*
 *  customized post 请求
 */
- (void)POST_requestWithProgressSuperView:(UIView *)progressSuperView urlString:(NSString *)urlString parameters:(id)parameters master:(BYRequestMaster)master;

/*
 *  请求会话(session)超时,假登陆(使服务器重新获取session).
 *  warning1:此方法只适用于session存储于服务器端.
             若本地存储session请自行从返回值中取出参数.
 *  warning2:参数类型如:parameters = [[NSString alloc] initWithFormat:@"username=%@&password=%@", @"用户名", @"密码/(加密后的密码)"];
 */
- (NSDictionary *)retrievesTheSessionWithUrl:(NSString *)urlString parameters:(id)parameters;

@end
