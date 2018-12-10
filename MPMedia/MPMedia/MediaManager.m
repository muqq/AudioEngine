//
//  MediaManager.m
//  MPMedia
//
//  Created by QQ Shih on 2017/4/13.
//  Copyright © 2017年 QQ Shih. All rights reserved.
//

#import "MediaManager.h"
#import "MediaManager+Song.h"
#import "MediaManager+Realm.h"

@implementation MediaManager

+ (id)sharedManager {
    static MediaManager *mediaManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        mediaManager = [[MediaManager alloc] init];
    });
    return mediaManager;
}

- (void)checkAuth:(void (^)(MPMediaLibraryAuthorizationStatus status))block {
    if ([MPMediaLibrary authorizationStatus] != MPMediaLibraryAuthorizationStatusAuthorized) {
        [MPMediaLibrary requestAuthorization:^(MPMediaLibraryAuthorizationStatus status) {
            block(status);
        }];
    } else {
        block(MPMediaLibraryAuthorizationStatusAuthorized);
    }
}

- (void)syncSongs {
    MPMediaQuery *query = [MPMediaQuery songsQuery];
    NSMutableArray *songs = [[NSMutableArray alloc] init];
    for (MPMediaItemCollection *collection in query.collections) {
        for (MPMediaItem *item in collection.items) {
            Song *song = [[Song alloc] initWithMediaItem:item];
            [songs addObject:song];
        }
    }
    
    [self addOrUpdateObjectsFromArray:songs];
}

@end
