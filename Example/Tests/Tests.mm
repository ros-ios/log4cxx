//
//  log4cxxTests.m
//  log4cxxTests
//
//  Created by Furushchev on 02/14/2016.
//  Copyright (c) 2016 Furushchev. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ROSViewController.h"

@interface Tests : XCTestCase

@end

@implementation Tests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample
{
    NSError *err;
    NSString *path = [NSTemporaryDirectory() stringByAppendingPathComponent:@"log.txt"];
    NSFileManager *man = [[NSFileManager alloc] init];
    if ([man fileExistsAtPath:path]) {
        [man removeItemAtPath:path error:&err];
    }
    
    [ROSViewController testLog4cxx];
    sleep(5);

    NSString *log = [NSString stringWithContentsOfFile:path
                                              encoding:NSUTF8StringEncoding
                                                 error:&err];
    if (err) {
        XCTFail(@"failed %@", err);
    } else {
        __block int lines = 0;
        [log enumerateLinesUsingBlock:^(NSString *line, BOOL *stop) {
            NSLog(@"%@", line);
            lines++;
        }];
        XCTAssertEqual(lines, 100);
    }
}

@end

