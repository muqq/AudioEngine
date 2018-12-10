//
//  MainTabBarController.m
//  MPMedia
//
//  Created by QQ Shih on 2017/4/25.
//  Copyright © 2017年 QQ Shih. All rights reserved.
//

#import "MainTabBarController.h"
#import "SongViewController.h"

@interface MainTabBarController ()

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    SongViewController *songViewController = [(UINavigationController *)self.viewControllers.firstObject viewControllers].firstObject;
    [songViewController queryItunes];
}

@end
