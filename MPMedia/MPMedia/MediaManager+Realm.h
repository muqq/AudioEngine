//
//  MediaManager+Realm.h
//  MPMedia
//
//  Created by QQ Shih on 2017/4/14.
//  Copyright © 2017年 QQ Shih. All rights reserved.
//

#import "MediaManager.h"

@interface MediaManager (Realm)

- (void)updateObjectWithObject:(RLMObject *)object block:(void (^)(void))block;

- (void)addOrUpdateObjectsFromArray:(id)array;

- (void)deleteObject:(RLMObject *)object;

@end
