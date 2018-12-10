//
//  AddPlayListViewController.h
//  MPMedia
//
//  Created by QQ Shih on 2017/4/14.
//  Copyright © 2017年 QQ Shih. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PlayList;
@class AddPlayListViewController;

@protocol AddPlayListViewControllerDelegate <NSObject>

- (void)addPlayListViewController:(AddPlayListViewController *)controller didFinishUpdateList:(PlayList *)playList;

@end


@interface AddPlayListViewController : UIViewController

@property (nonatomic) PlayList *playlist;
@property (nonatomic) id<AddPlayListViewControllerDelegate> delegate;

@end
