//
//  MediaManager+Song.h
//  MPMedia
//
//  Created by QQ Shih on 2017/4/14.
//  Copyright © 2017年 QQ Shih. All rights reserved.
//

#import "MediaManager.h"

@class Artist;
@class Album;

@interface MediaManager (Song)

- (RLMResults<Song *> *)querySongs;


@end
