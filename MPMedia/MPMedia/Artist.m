//
//  Artist.m
//  MPMedia
//
//  Created by QQ Shih on 2017/4/14.
//  Copyright © 2017年 QQ Shih. All rights reserved.
//

#import "Artist.h"

@implementation Artist

- (instancetype)initWithName:(NSString *)name imageData:(NSData *)imageData id:(NSInteger)id {
    if (self = [super init]) {
        self.name = name;
        self.imageData = imageData;
        self.id = id;
    }
    return self;
}

+ (NSString *)primaryKey {
    return @"id";
}

@end
