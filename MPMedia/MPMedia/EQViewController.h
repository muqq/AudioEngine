//
//  EQViewController.h
//  MPMedia
//
//  Created by QQ Shih on 2017/4/25.
//  Copyright © 2017年 QQ Shih. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@class EQViewController;

@protocol EQViewControllerDelegate <NSObject>

- (void)EQViewController:(EQViewController *)viewController didClickReverb:(AVAudioUnitReverbPreset)preset;

- (void)EQViewController:(EQViewController *)viewController didChangeWetDryMix:(float)value;

@end

@interface EQViewController : UIViewController

@property (nonatomic, weak) id<EQViewControllerDelegate> delegate;

@end
