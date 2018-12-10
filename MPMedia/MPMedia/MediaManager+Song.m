//
//  MediaManager+Song.m
//  MPMedia
//
//  Created by QQ Shih on 2017/4/14.
//  Copyright © 2017年 QQ Shih. All rights reserved.
//

#import "MediaManager+Song.h"
#import "Artist.h"

@implementation MediaManager (Song)

- (RLMResults<Song *> *)querySongs {
    RLMResults<Song *> *allSongs = [Song allObjects];
    return allSongs;
}

@end
