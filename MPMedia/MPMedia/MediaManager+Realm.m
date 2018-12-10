//
//  MediaManager+Realm.m
//  MPMedia
//
//  Created by QQ Shih on 2017/4/14.
//  Copyright © 2017年 QQ Shih. All rights reserved.
//

#import "MediaManager+Realm.h"

@implementation MediaManager (Realm)

- (void)updateObjectWithObject:(RLMObject *)object block:(void (^)(void))block {
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm beginWriteTransaction];
    block();
    [realm addOrUpdateObject:object];
    [realm commitWriteTransaction];
}

- (void)addOrUpdateObjectsFromArray:(id)array {
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm beginWriteTransaction];
    [realm addOrUpdateObjectsFromArray:array];
    [realm commitWriteTransaction];
}

- (void)deleteObject:(RLMObject *)object {
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm beginWriteTransaction];
    [realm deleteObject:object];
    [realm commitWriteTransaction];
}


@end
