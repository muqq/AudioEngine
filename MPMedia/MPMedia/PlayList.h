//
//  PlayList.h
//  MPMedia
//
//  Created by QQ Shih on 2017/4/14.
//  Copyright © 2017年 QQ Shih. All rights reserved.
//

#import <Realm/Realm.h>
#import "Song.h"

RLM_ARRAY_TYPE(Song)

@interface PlayList : RLMObject

@property (nonatomic) NSInteger id;
@property (nonatomic) NSString *name;
@property (nonatomic) RLMArray<Song *><Song> *songs;

@end
