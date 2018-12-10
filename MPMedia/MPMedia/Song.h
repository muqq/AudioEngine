//
//  Song.h
//  MPMedia
//
//  Created by QQ Shih on 2017/4/13.
//  Copyright © 2017年 QQ Shih. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Realm/Realm.h>
#import <MediaPlayer/MediaPlayer.h>

@class Artist;

@interface Song : RLMObject

@property (nonatomic) NSInteger id;
@property (nonatomic) NSData *imageData;
@property (nonatomic) NSString *title;
@property (nonatomic) Artist *artist;
@property (nonatomic) NSString *assetURL;

- (instancetype)initWithMediaItem:(MPMediaItem *)item;

@end
