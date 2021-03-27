//
//  BYWKWebViewController.h
//  BYKit
//
//  Created by SunShine.Rock on 2018/8/20.
//  Copyright © 2018年 Berton. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BYWeakScriptMessageDelegate.h"

@interface BYWKWebViewController : UIViewController <WKNavigationDelegate>
@property (nonatomic, copy) NSString *url;
@property (nonatomic, copy) NSString *statTitle;
@property (nonatomic, strong) WKWebView *wkWebView;
@property (nonatomic, strong) UIButton *goBackBtn;
@property (nonatomic, strong) UIButton *backBtn;
@property (nonatomic, strong) UIProgressView *progressView;
- (instancetype)initWithUrl:(NSString *)url;
@end
