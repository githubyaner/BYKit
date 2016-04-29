//
//  BYBaseModel.m
//  BYKit
//
//  Created by SunShine.Rock on 16/4/27.
//  Copyright © 2016年 Berton. All rights reserved.
//

#import "BYBaseModel.h"

@implementation BYBaseModel
- (instancetype)initWithDic:(NSDictionary *)dic {
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
}
@end
