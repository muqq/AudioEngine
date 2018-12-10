//
//  ViewController.m
//  MPMedia
//
//  Created by QQ Shih on 2017/4/13.
//  Copyright © 2017年 QQ Shih. All rights reserved.
//

#import "SongViewController.h"
#import "MediaManager+Song.h"
#import "SongCell.h"
#import "QQPlayer.h"
#import "QQPlayButton.h"
#import "RLMResults+RLMArrayConversion.h"
#import "EQViewController.h"

@interface SongViewController () <UITableViewDelegate, UITableViewDataSource, EQViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic) QQPlayer *player;
@property (nonatomic) Song *currentPlayingSong;

@end

@implementation SongViewController

- (void)reloadSongs {
    [self.tableView reloadData];
}

- (void)queryItunes {
    __weak SongViewController *weakSelf = self;
    [MediaManager.sharedManager checkAuth:^(MPMediaLibraryAuthorizationStatus status) {
        if (status == MPMediaLibraryAuthorizationStatusAuthorized) {
            dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                [MediaManager.sharedManager syncSongs];
                dispatch_async(dispatch_get_main_queue(), ^{
                    weakSelf.songs = (RLMArray<Song *><Song> *)[[MediaManager.sharedManager querySongs] toArray];
                    [weakSelf.tableView reloadData];
                });
            });
        }
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"SongCell" bundle:nil] forCellReuseIdentifier: [SongCell cellIdentifier]];
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 50;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    [super prepareForSegue:segue sender:sender];
    if ([segue.destinationViewController isKindOfClass:[EQViewController class]]) {
        ((EQViewController *)segue.destinationViewController).delegate = self;
    }
}

#pragma mark - EQViewControllerDelegate

- (void)EQViewController:(EQViewController *)viewController didClickReverb:(AVAudioUnitReverbPreset)preset {
    [self.player changeReverb:preset];
}

- (void)EQViewController:(EQViewController *)viewController didChangeWetDryMix:(float)value {
    [self.player changeWetDryMix:value];
}

# pragma mark - UITableViewDelegate & DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.songs.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SongCell *cell = [self.tableView dequeueReusableCellWithIdentifier:[SongCell cellIdentifier] forIndexPath: indexPath];
    cell.song = self.songs[indexPath.row];
    cell.isPlaying = [self.currentPlayingSong isEqual:cell.song];
    return cell;
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    SongCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    [cell.playButton setHidden:YES];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    SongCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (![cell.song isEqual:self.currentPlayingSong]) {
        [self.player stop];
        Song *song = self.songs[indexPath.row];
        self.player = [[QQPlayer alloc] initWithURL:[NSURL URLWithString:song.assetURL]];
        self.currentPlayingSong = song;
        [cell.playButton setHidden:NO];
        [cell.playButton changeStatus:QQPlayButtonStatusPause animate:NO];
    } else {
        if (self.player.isPlaying) {
            [self.player pause];
            [cell.playButton changeStatus:QQPlayButtonStatusPlay animate:YES];
        } else {
            [self.player play];
            [cell.playButton changeStatus:QQPlayButtonStatusPause animate:YES];
        }
    }
}

@end
