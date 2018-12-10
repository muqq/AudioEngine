//
//  Song.m
//  MPMedia
//
//  Created by QQ Shih on 2017/4/13.
//  Copyright © 2017年 QQ Shih. All rights reserved.
//

#import "Song.h"
#import "Artist.h"

@implementation Song

- (instancetype)initWithMediaItem:(MPMediaItem *)item {
    if ((self = [super init])) {
        MPMediaItemArtwork *itemArtwork = [item valueForProperty:MPMediaItemPropertyArtwork];
        UIImage *artworkImage = [itemArtwork imageWithSize:CGSizeMake(64, 64)];
        NSData *data = UIImagePNGRepresentation(artworkImage);
        self.id = [[NSNumber numberWithUnsignedLongLong:item.persistentID] integerValue];
        self.imageData = data;
        self.title = item.title;
        
        NSInteger artistId = [[NSNumber numberWithUnsignedLongLong:item.artistPersistentID] integerValue];
        self.artist = [[Artist alloc] initWithName:item.artist imageData:data id:artistId];
        self.assetURL = item.assetURL.absoluteString;
    }
    return self;
}

+ (NSString *)primaryKey {
    return @"id";
}

@end
