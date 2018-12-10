//
//  QQPlayButton.h
//
//  Created by muqq on 2015/6/17.
//  Copyright (c) 2017年 QQ. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    QQPlayButtonStatusPlay,
    QQPlayButtonStatusPause
} QQPlayButtonStatus;

@interface QQPlayButton : UIButton

@property (nonatomic) QQPlayButtonStatus buttonStatus;
@property (nonatomic) CGFloat buttonSize;

- (void)changeStatus:(QQPlayButtonStatus)hlPlayButtonStatus animate:(BOOL)hasAnimate;

@end
