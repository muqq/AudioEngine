//
//  RLMResults+RLMArrayConversion.h
//  MPMedia
//
//  Created by QQ Shih on 2017/4/14.
//  Copyright © 2017年 QQ Shih. All rights reserved.
//

#import <Realm/Realm.h>

@interface RLMResults (RLMArrayConversion)

- (RLMArray *)toArray;

@end
