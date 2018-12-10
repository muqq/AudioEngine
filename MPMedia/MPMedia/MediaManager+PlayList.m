//
//  MediaManager+PlayList.m
//  MPMedia
//
//  Created by QQ Shih on 2017/4/14.
//  Copyright © 2017年 QQ Shih. All rights reserved.
//

#import "MediaManager+PlayList.h"

@implementation MediaManager (PlayList)

- (RLMResults<PlayList *> *)queryPlayLists {
    RLMResults<PlayList *> *playLists = [PlayList allObjects];
    return playLists;
}

@end
