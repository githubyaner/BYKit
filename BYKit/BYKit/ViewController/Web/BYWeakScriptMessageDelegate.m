//
//  BYWeakScriptMessageDelegate.m
//  BYKit
//
//  Created by SunShine.Rock on 2018/8/20.
//  Copyright © 2018年 Berton. All rights reserved.
//

#import "BYWeakScriptMessageDelegate.h"

@implementation BYWeakScriptMessageDelegate

- (instancetype)initWithDelegate:(id<WKScriptMessageHandler>)scriptDelegate {
    self = [super init];
    if (self) {
        _scriptDelegate = scriptDelegate;
    }
    return self;
}

- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message {
    [self.scriptDelegate userContentController:userContentController didReceiveScriptMessage:message];
}

@end
