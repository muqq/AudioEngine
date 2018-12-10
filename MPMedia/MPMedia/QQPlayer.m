//
//  QQPlayer.m
//  MPMedia
//
//  Created by QQ Shih on 2017/4/24.
//  Copyright © 2017年 QQ Shih. All rights reserved.
//

#import "QQPlayer.h"
#import <AVFoundation/AVFoundation.h>

@interface QQPlayer ()

@property (nonatomic) NSURL *url;
@property (nonatomic) AVAudioPlayerNode *player;
@property (nonatomic) AVAudioEngine *engine;
@property (nonatomic) AVAudioFile *file;
@property (nonatomic) AVAudioUnitReverb *reverbNode;

@end

@implementation QQPlayer

- (instancetype)initWithURL:(NSURL *)url {
    if (self = [super init]) {
        self.url = url;
        self.engine = [[AVAudioEngine alloc] init];
        self.player = [[AVAudioPlayerNode alloc] init];
        self.file = [[AVAudioFile alloc] initForReading:url error:nil];
        
        self.reverbNode = [[AVAudioUnitReverb alloc] init];
        self.reverbNode.wetDryMix = 50;
        [self.engine attachNode:self.reverbNode];
        
        [self.engine attachNode:self.player];
        
        
        
        [self.engine connect:self.player to:self.reverbNode format:self.file.processingFormat];
        
        [self.engine connect:self.reverbNode to:self.engine.outputNode fromBus:0 toBus:1 format:self.file.processingFormat];
        
        [self.engine prepare];
        [self.engine startAndReturnError:nil];
        
        [self.player scheduleFile:self.file atTime:nil completionHandler:nil];
        [self.player play];
    }
    return self;
}

- (void)changeWetDryMix:(float)value {
    self.reverbNode.wetDryMix = value * 100;
}

- (void)changeReverb:(AVAudioUnitReverbPreset)preset {
    [self.reverbNode loadFactoryPreset:preset];
}

- (void)play {
    [self.player play];
}

- (void)stop {
    [self.player stop];
}

- (void)pause {
    [self.player pause];
}

- (BOOL)isPlaying {
    return self.player.isPlaying;
}

@end
