//
//  MediaManager.h
//  MPMedia
//
//  Created by QQ Shih on 2017/4/13.
//  Copyright © 2017年 QQ Shih. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MediaPlayer/MediaPlayer.h>
#import "Song.h"

@interface MediaManager : NSObject

+ (id)sharedManager;

- (void)syncSongs;

- (void)checkAuth:(void (^)(MPMediaLibraryAuthorizationStatus status))block;

@end
