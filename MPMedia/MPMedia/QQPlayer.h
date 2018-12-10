//
//  QQPlayer.h
//  MPMedia
//
//  Created by QQ Shih on 2017/4/24.
//  Copyright © 2017年 QQ Shih. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface QQPlayer : NSObject

@property (nonatomic, readonly) BOOL isPlaying;

- (instancetype)initWithURL:(NSURL *)url;

- (void)play;

- (void)stop;

- (void)pause;

- (void)changeReverb:(AVAudioUnitReverbPreset)preset;

- (void)changeWetDryMix:(float)value;

@end
