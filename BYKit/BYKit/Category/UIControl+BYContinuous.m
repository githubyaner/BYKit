//
//  UIControl+BYContinuous.m
//  BYKit
//
//  Created by SunShine.Rock on 16/9/12.
//  Copyright © 2016年 Berton. All rights reserved.
//

#import "UIControl+BYContinuous.h"
#import <objc/runtime.h>

@implementation UIControl (BYContinuous)

static const char *clickEventIntervalKey = "clickEventIntervalKey";
static const char *ignoreEventKey = "ignoreEventKey";



- (NSTimeInterval)clickEventInterval {
    return [objc_getAssociatedObject(self, clickEventIntervalKey) doubleValue];
}

- (void)setClickEventInterval:(NSTimeInterval)clickEventInterval {
    objc_setAssociatedObject(self, clickEventIntervalKey, @(clickEventInterval), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


- (NSNumber *)ignoreEvent {
    return objc_getAssociatedObject(self, ignoreEventKey);
}

- (void)setIgnoreEvent:(NSNumber *)ignoreEvent {
    objc_setAssociatedObject(self, ignoreEventKey, ignoreEvent, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


+ (void)load {
    Method a = class_getInstanceMethod(self, @selector(sendAction:to:forEvent:));
    Method b = class_getInstanceMethod(self, @selector(__by_sendAction:to:forEvent:));
    method_exchangeImplementations(a, b);
}

- (void)__by_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event {
    if (self.ignoreEvent.boolValue) return;
    if (!self.clickEventInterval) {
        self.clickEventInterval = CLICK_INTERVAL_DEFAULT;
    }
    if (self.clickEventInterval > 0) {
        self.ignoreEvent = @(YES);
        
        [self performSelector:@selector(setIgnoreEvent:) withObject:@(NO) afterDelay:self.clickEventInterval];
    }
    [self __by_sendAction:action to:target forEvent:event];
}



@end
