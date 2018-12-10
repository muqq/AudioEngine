//
//  RLMResults+RLMArrayConversion.m
//  MPMedia
//
//  Created by QQ Shih on 2017/4/14.
//  Copyright © 2017年 QQ Shih. All rights reserved.
//

#import "RLMResults+RLMArrayConversion.h"

@implementation RLMResults (RLMArrayConversion)

- (RLMArray *)toArray {
    RLMArray * array = [[RLMArray alloc] initWithObjectClassName:self.objectClassName];
    [array addObjects:self];
    return array;
}

@end
