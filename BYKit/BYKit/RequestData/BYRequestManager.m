//
//  BYRequestManager.m
//  BYKit
//
//  Created by SunShine.Rock on 16/4/26.
//  Copyright © 2016年 Kevin. All rights reserved.
//

#import "BYRequestManager.h"
#import "BYRequestHelper.h"
#import "BYStringManager.h"
#import "BYProgress.h"
#import "BYMacro.h"
#import "MBProgressHUD.h"

@implementation BYRequestManager

/*
 *  终止当前请求
 */
- (void)cancelCurrentRequest {
    NSAssert(self.operation, @"The Operation is empty!");
    if (!self.operation) {
        return;
    }
    [self.operation cancel];
}

/*
 *  GET请求
 */
- (void)GET_request:(BYRequestMaster)master {
    if (![BYRequestHelper isNetworkEnabled]) {
        [BYProgress deleteProgressWithView:self.progressSuperView];
        BYHUD(@"当前无网络,请查看您的网络连接", 1.5f);
        return;
    }
    NSAssert(![BYStringManager isBlankString:self.urlString], @"Request link is empty!");
    NSString *URLTmp = [self.urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];  //转码成UTF-8  否则可能会出现错误
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:URLTmp]];
    self.operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    [_operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *jsonDic = [BYStringManager jsonStrToDic:operation.responseString];
        master(jsonDic, operation.responseString, YES);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        master(nil, operation.responseString, NO);
    }];
    [_operation start];
}
/*
 *  customized get 请求
 */
- (void)GET_requestWithProgressSuperView:(UIView *)progressSuperView urlString:(NSString *)urlString master:(BYRequestMaster)master {
    if (![BYRequestHelper isNetworkEnabled]) {
        [BYProgress deleteProgressWithView:self.progressSuperView];
        BYHUD(@"当前无网络,请查看您的网络连接", 1.5f);
        return;
    }
    NSAssert(![BYStringManager isBlankString:urlString], @"Request link is empty!");
    NSString *URLTmp = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];  //转码成UTF-8  否则可能会出现错误
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:URLTmp]];
    self.operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    [_operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *jsonDic = [BYStringManager jsonStrToDic:operation.responseString];
        master(jsonDic, operation.responseString, YES);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        master(nil, operation.responseString, NO);
    }];
    [_operation start];
}
/*
 *  POST请求
 */
- (void)POST_request:(BYRequestMaster)master {
    if (![BYRequestHelper isNetworkEnabled]) {
        [BYProgress deleteProgressWithView:self.progressSuperView];
        BYHUD(@"当前无网络,请查看您的网络连接", 1.5f);
        return;
    }
    NSAssert(![BYStringManager isBlankString:self.urlString], @"Request link is empty!");
    NSAssert(self.parameters, @"Parameters is empty!");
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    // 设置超时时间
    [manager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    manager.requestSerializer.timeoutInterval = 60.0f;
    [manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", nil];//设置相应内容类型
    self.operation = [manager POST:self.urlString parameters:self.parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *jsonDic = [BYStringManager jsonStrToDic:operation.responseString];
        master(jsonDic, operation.responseString, YES);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        master(nil, operation.responseString, NO);
    }];
}
/*
 *  customized post 请求
 */
- (void)POST_requestWithProgressSuperView:(UIView *)progressSuperView urlString:(NSString *)urlString parameters:(id)parameters master:(BYRequestMaster)master {
    if (![BYRequestHelper isNetworkEnabled]) {
        [BYProgress deleteProgressWithView:self.progressSuperView];
        BYHUD(@"当前无网络,请查看您的网络连接", 1.5f);
        return;
    }
    NSAssert(![BYStringManager isBlankString:urlString], @"Request link is empty!");
    NSAssert(parameters, @"Parameters is empty!");
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    // 设置超时时间
    [manager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    manager.requestSerializer.timeoutInterval = 60.0f;
    [manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", nil];//设置相应内容类型
    self.operation = [manager POST:urlString parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *jsonDic = [BYStringManager jsonStrToDic:operation.responseString];
        master(jsonDic, operation.responseString, YES);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        master(nil, operation.responseString, NO);
    }];
}

/*
 *  请求会话(session)超时,假登陆(使服务器重新获取session).
 *  warning1:此方法只适用于session存储于服务器端.
 若本地存储session请自行从返回值中取出参数.
 *  warning2:参数类型如:parameters = [[NSString alloc] initWithFormat:@"username=%@&password=%@", @"用户名", @"密码/(加密后的密码)"];
 */
- (NSDictionary *)retrievesTheSessionWithUrl:(NSString *)urlString parameters:(id)parameters {
    //1.准备网址
    NSURL *url = [NSURL URLWithString:urlString];
    //2.准备请求对象
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    //2.1设置请求方式
    [request setHTTPMethod:@"POST"];
    //2.2设置请求参数
    NSData *parameter = [parameters dataUsingEncoding:NSUTF8StringEncoding];
    [request setHTTPBody:parameter];
    //3.创建链接对象,并发送请求,获取结果
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    //4.解析
    NSDictionary *jsonDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    //5.返回结果
    return jsonDic;
}

@end
