//
//  PlayList.m
//  MPMedia
//
//  Created by QQ Shih on 2017/4/14.
//  Copyright © 2017年 QQ Shih. All rights reserved.
//

#import "PlayList.h"

@implementation PlayList

- (instancetype)init {
    if (self = [super init]) {
        self.id = arc4random();
    }
    return self;
}

+ (NSString *)primaryKey {
    return @"id";
}

@end
