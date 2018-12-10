//
//  ViewController.h
//  MPMedia
//
//  Created by QQ Shih on 2017/4/13.
//  Copyright © 2017年 QQ Shih. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Song.h"

RLM_ARRAY_TYPE(Song)

@interface SongViewController : UIViewController

@property (nonatomic) RLMArray<Song *><Song> *songs;

- (void)reloadSongs;

- (void)queryItunes;

@end

