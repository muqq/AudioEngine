//
//  AddPlayListViewController.m
//  MPMedia
//
//  Created by QQ Shih on 2017/4/14.
//  Copyright © 2017年 QQ Shih. All rights reserved.
//

#import "AddPlayListViewController.h"
#import "SelectSongViewController.h"
#import "SongCell.h"
#import "PlayList.h"
#import "MediaManager+Realm.h"
#import "SongViewController.h"

@interface AddPlayListViewController () <SelectSongViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UITextField *playListTextField;
@property (nonatomic) BOOL isDirty;
@property (nonatomic) SongViewController *songViewController;

@end

@implementation AddPlayListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.isDirty = false;
    
    if (self.playlist) {
        self.songViewController.songs = self.playlist.songs;
        [self.songViewController reloadSongs];
        self.playListTextField.text = self.playlist.name;
    } else {
        self.songViewController.songs = (RLMArray<Song *><Song> *)@[];
        self.playlist = [[PlayList alloc] init];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    [super prepareForSegue:segue sender:sender];
    if ([[segue destinationViewController] isKindOfClass:[SelectSongViewController class]]) {
        SelectSongViewController *vc = segue.destinationViewController;
        vc.delegate = self;
    } else if ([[segue destinationViewController] isKindOfClass:[SongViewController class]]) {
        self.songViewController = segue.destinationViewController;
    }
}

#pragma mark - SelectSongViewController

- (void)selectSongView:(SelectSongViewController *)controller didSelectSongs:(RLMArray<Song *><Song> *)songs {
    self.isDirty = true;
    self.songViewController.songs = songs;
    [self.songViewController reloadSongs];
}

#pragma mark - IBAction

- (IBAction)finishButtonTouchUpInside:(id)sender {
    if (self.playListTextField.text.length > 0 && ![self.playListTextField.text isEqualToString:@""]) {
        __weak AddPlayListViewController *weakSelf = self;
        [MediaManager.sharedManager updateObjectWithObject:self.playlist block:^{
            if (_isDirty) {
                weakSelf.playlist.songs = weakSelf.songViewController.songs;
            }
            weakSelf.playlist.name = weakSelf.playListTextField.text;
        }];
        
        [self dismissViewControllerAnimated:true completion:nil];
        [weakSelf.delegate addPlayListViewController:weakSelf didFinishUpdateList:weakSelf.playlist];
    }
}

- (IBAction)cancelButtonTouchUpInside:(id)sender {
    [self dismissViewControllerAnimated:true completion:nil];
}

@end
