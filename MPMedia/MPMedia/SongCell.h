//
//  SongCell.h
//  MPMedia
//
//  Created by QQ Shih on 2017/4/14.
//  Copyright © 2017年 QQ Shih. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Song.h"

@class QQPlayButton;

@interface SongCell : UITableViewCell

@property (nonatomic) Song *song;

@property (weak, nonatomic) IBOutlet UIImageView *songImage;
@property (weak, nonatomic) IBOutlet UILabel *songName;
@property (weak, nonatomic) IBOutlet UILabel *artistName;
@property (weak, nonatomic) IBOutlet QQPlayButton *playButton;
@property (nonatomic) BOOL isPlaying;

+ (NSString *)cellIdentifier;

@end
