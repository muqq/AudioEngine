//
//  SongCell.m
//  MPMedia
//
//  Created by QQ Shih on 2017/4/14.
//  Copyright © 2017年 QQ Shih. All rights reserved.
//

#import "SongCell.h"
#import "Artist.h"
#import "QQPlayButton.h"

@interface SongCell ()

@property (nonatomic) Song *_song;

@end

@implementation SongCell

+ (NSString *)cellIdentifier {
    return @"song_cell";
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.playButton.buttonSize = 12.f;
    [self.playButton changeStatus:QQPlayButtonStatusPause animate:NO];
}

- (void)setSong:(Song *)song {
    self._song = song;
    self.songName.text = song.title;
    self.artistName.text = song.artist.name;
    self.songImage.image = [UIImage imageWithData:song.imageData];
}

- (Song *)song {
    return self._song;
}

- (void)setIsPlaying:(BOOL)isPlaying {
    self.playButton.hidden = !isPlaying;
}

@end
