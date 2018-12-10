//
//  MPMediaTests.m
//  MPMediaTests
//
//  Created by QQ Shih on 2017/4/13.
//  Copyright © 2017年 QQ Shih. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "MediaManager+Song.h"
#import "MediaManager.h"
#import "MediaManager+Album.h"
#import "MediaManager+Artist.h"
#import "Artist.h"

@interface MPMediaTests : XCTestCase

@end

@implementation MPMediaTests

- (void)setUp {
    [super setUp];
    [MediaManager.sharedManager syncSongs];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];

}

@end
