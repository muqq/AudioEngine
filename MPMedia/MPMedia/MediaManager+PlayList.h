//
//  MediaManager+PlayList.h
//  MPMedia
//
//  Created by QQ Shih on 2017/4/14.
//  Copyright © 2017年 QQ Shih. All rights reserved.
//

#import "MediaManager.h"
#import "PlayList.h"

@interface MediaManager (PlayList)

- (RLMResults<PlayList *> *)queryPlayLists;

@end
