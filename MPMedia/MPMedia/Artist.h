//
//  Artist.h
//  MPMedia
//
//  Created by QQ Shih on 2017/4/14.
//  Copyright © 2017年 QQ Shih. All rights reserved.
//

#import <Realm/Realm.h>
#import "Song.h"

@interface Artist : RLMObject

@property (nonatomic) NSInteger id;
@property (nonatomic) NSData *imageData;
@property (nonatomic) NSString *name;

- (instancetype)initWithName:(NSString *)name imageData:(NSData *)imageData id:(NSInteger)id;

@end
