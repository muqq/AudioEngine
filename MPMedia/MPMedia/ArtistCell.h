//
//  ArtistCell.h
//  MPMedia
//
//  Created by QQ Shih on 2017/4/14.
//  Copyright © 2017年 QQ Shih. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Artist;

@interface ArtistCell : UITableViewCell

@property (nonatomic) Artist *artist;
@property (weak, nonatomic) IBOutlet UIImageView *artistImage;
@property (weak, nonatomic) IBOutlet UILabel *artistName;

+ (NSString *)cellIdentifier;

@end
