//
//  BYWeakScriptMessageDelegate.h
//  BYKit
//
//  Created by SunShine.Rock on 2018/8/20.
//  Copyright © 2018年 Berton. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WebKit/WebKit.h>

@interface BYWeakScriptMessageDelegate : NSObject <WKScriptMessageHandler>

@property (nonatomic, assign) id<WKScriptMessageHandler> scriptDelegate;

- (instancetype)initWithDelegate:(id<WKScriptMessageHandler>)scriptDelegate;

@end
