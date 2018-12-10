//
//  SelectSongViewController.h
//  MPMedia
//
//  Created by QQ Shih on 2017/4/14.
//  Copyright © 2017年 QQ Shih. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Song.h"

RLM_ARRAY_TYPE(Song)

@class SelectSongViewController;

@protocol SelectSongViewControllerDelegate <NSObject>

- (void)selectSongView:(SelectSongViewController *)controller didSelectSongs:(RLMArray<Song *><Song> *)songs;

@end


@interface SelectSongViewController : UIViewController

@property (nonatomic, weak) id<SelectSongViewControllerDelegate> delegate;

@end

