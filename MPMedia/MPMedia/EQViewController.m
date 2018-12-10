//
//  EQViewController.m
//  MPMedia
//
//  Created by QQ Shih on 2017/4/25.
//  Copyright © 2017年 QQ Shih. All rights reserved.
//

#import "EQViewController.h"

@interface EQViewController ()

@end

@implementation EQViewController

- (IBAction)effectButtonTouchUpInside:(UIButton *)sender {
    [self.delegate EQViewController:self didClickReverb:sender.tag - 1000];
}

- (IBAction)wetDryValueChanged:(UISlider *)sender {
    [self.delegate EQViewController:self didChangeWetDryMix:sender.value];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

@end
