//
//  PlayListCell.h
//  MPMedia
//
//  Created by QQ Shih on 2017/4/14.
//  Copyright © 2017年 QQ Shih. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlayList.h"
@interface PlayListCell : UITableViewCell

@property (nonatomic) PlayList *playList;
@property (weak, nonatomic) IBOutlet UILabel *playListName;

+ (NSString *)cellIdentifier;

@end
