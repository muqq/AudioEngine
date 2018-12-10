//
//  MediaManager+Artist.m
//  MPMedia
//
//  Created by QQ Shih on 2017/4/13.
//  Copyright © 2017年 QQ Shih. All rights reserved.
//

#import "MediaManager+Artist.h"
#import "Artist.h"

@implementation MediaManager (Artist)

- (RLMResults<Song *> *)querySongsByArtist:(Artist *)artist {
    RLMResults<Song *> *songsByArtist = [Song objectsWhere:[NSString stringWithFormat:@"artist.name = '%@'", artist.name]];
    return songsByArtist;
}

- (RLMResults<Artist *> *)queryArtists {
    RLMResults<Artist *> *allArtists = [Artist allObjects];
    return allArtists;
}

@end
