//
//  PlayListCell.m
//  MPMedia
//
//  Created by QQ Shih on 2017/4/14.
//  Copyright © 2017年 QQ Shih. All rights reserved.
//

#import "PlayListCell.h"

@implementation PlayListCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setPlayList:(PlayList *)playList {
    self.playListName.text = playList.name;
}

+ (NSString *)cellIdentifier {
    return @"playlist_cell";
}

@end
