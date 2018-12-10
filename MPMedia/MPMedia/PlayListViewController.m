//
//  PlayListViewController.m
//  MPMedia
//
//  Created by QQ Shih on 2017/4/14.
//  Copyright © 2017年 QQ Shih. All rights reserved.
//

#import "PlayListViewController.h"
#import <Realm/Realm.h>
#import "PlayList.h"
#import "PlayListCell.h"
#import "MediaManager+PlayList.h"
#import "AddPlayListViewController.h"
#import "RLMResults+RLMArrayConversion.h"
#import "MediaManager+Realm.h"

@interface PlayListViewController () <UITableViewDelegate, UITableViewDataSource, AddPlayListViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic) RLMArray<PlayList *> *playLists;

@end

@implementation PlayListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerNib:[UINib nibWithNibName:@"PlayListCell" bundle:nil] forCellReuseIdentifier: [PlayListCell cellIdentifier]];
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 50;
    self.playLists = [[MediaManager.sharedManager queryPlayLists] toArray];
    [self.tableView reloadData];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    [super prepareForSegue:segue sender:sender];
    if ([segue.destinationViewController isKindOfClass:[AddPlayListViewController class]]) {
        AddPlayListViewController *vc = segue.destinationViewController;
        vc.playlist = sender;
        vc.delegate = self;
    }
}

- (IBAction)addButtonTouchUpInside:(id)sender {
    [self performSegueWithIdentifier:@"add_playlist_segue" sender:nil];
}

# pragma mark - AddPlayListViewContrllerDelegate

- (void)addPlayListViewController:(AddPlayListViewController *)controller didFinishUpdateList:(PlayList *)playList {
    self.playLists = [[MediaManager.sharedManager queryPlayLists] toArray];
    [self.tableView reloadData];
}

# pragma mark - UITableViewDelegate & DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.playLists.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PlayListCell *cell = [self.tableView dequeueReusableCellWithIdentifier:[PlayListCell cellIdentifier] forIndexPath: indexPath];
    cell.playList = self.playLists[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self performSegueWithIdentifier:@"add_playlist_segue" sender:self.playLists[indexPath.row]];
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [MediaManager.sharedManager deleteObject: self.playLists[indexPath.row]];
        [self.playLists removeObjectAtIndex:indexPath.row];
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}
@end
