//
//  ArtistViewController.m
//  MPMedia
//
//  Created by QQ Shih on 2017/4/14.
//  Copyright © 2017年 QQ Shih. All rights reserved.
//

#import "ArtistViewController.h"
#import "Artist.h"
#import "ArtistCell.h"
#import "MediaManager+Artist.h"

@interface ArtistViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic) RLMResults<Artist *> *artists;

@end

@implementation ArtistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerNib:[UINib nibWithNibName:@"ArtistCell" bundle:nil] forCellReuseIdentifier: [ArtistCell cellIdentifier]];
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 50;
    self.artists = [MediaManager.sharedManager queryArtists];
    [self.tableView reloadData];
}

# pragma mark - UITableViewDelegate & DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.artists.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ArtistCell *cell = [self.tableView dequeueReusableCellWithIdentifier:[ArtistCell cellIdentifier] forIndexPath: indexPath];
    cell.artist = self.artists[indexPath.row];
    return cell;
}

@end
