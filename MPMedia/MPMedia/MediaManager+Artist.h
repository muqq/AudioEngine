//
//  MediaManager+Artist.h
//  MPMedia
//
//  Created by QQ Shih on 2017/4/13.
//  Copyright © 2017年 QQ Shih. All rights reserved.
//

#import "MediaManager.h"
#import "Artist.h"

@interface MediaManager (Artist)

- (RLMResults<Song *> *)querySongsByArtist:(Artist *)artist;

- (RLMResults<Artist *> *)queryArtists;

@end
