//
//  ArtistCell.m
//  MPMedia
//
//  Created by QQ Shih on 2017/4/14.
//  Copyright © 2017年 QQ Shih. All rights reserved.
//

#import "ArtistCell.h"
#import "Artist.h"

@implementation ArtistCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setArtist:(Artist *)artist {
    self.artistName.text = artist.name;
    self.artistImage.image = [UIImage imageWithData:artist.imageData];
}

+ (NSString *)cellIdentifier {
    return @"artist_cell";
}

@end
