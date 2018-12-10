//
//  SelectSongViewController.m
//  MPMedia
//
//  Created by QQ Shih on 2017/4/14.
//  Copyright © 2017年 QQ Shih. All rights reserved.
//

#import "SelectSongViewController.h"
#import "MediaManager+Song.h"
#import "SongCell.h"

@interface SelectSongViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic) RLMResults<Song *> *songs;
@property (nonatomic) RLMArray<Song *><Song> *selectedSongs;

@end

@implementation SelectSongViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (!self.selectedSongs) {
        self.selectedSongs = [[RLMArray<Song *><Song> alloc] initWithObjectClassName:@"Song"];
    }
    
    [self.tableView registerNib:[UINib nibWithNibName:@"SongCell" bundle:nil] forCellReuseIdentifier: [SongCell cellIdentifier]];
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 50;
    self.tableView.allowsMultipleSelection = YES;
    self.songs = [MediaManager.sharedManager querySongs];
    [self.tableView reloadData];
}

- (IBAction)cancelButtonTouchUpInside:(id)sender {
    [self dismissViewControllerAnimated:true completion:nil];
}

- (IBAction)finishButtonTouchUpInside:(id)sender {
    [self.delegate selectSongView:self didSelectSongs:self.selectedSongs];
    [self dismissViewControllerAnimated:true completion:nil];
}

# pragma mark - UITableViewDelegate & DataSource

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.selectedSongs addObject:self.songs[indexPath.row]];
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSUInteger index = [self.selectedSongs indexOfObject:self.songs[indexPath.row]];
    [self.selectedSongs removeObjectAtIndex:index];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.songs.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SongCell *cell = [self.tableView dequeueReusableCellWithIdentifier:[SongCell cellIdentifier] forIndexPath: indexPath];
    cell.song = self.songs[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleDefault;
    return cell;
}

@end
