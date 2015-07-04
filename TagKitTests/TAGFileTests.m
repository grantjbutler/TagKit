//
//  TAGFileTests.m
//  TagKit
//
//  Created by Grant Butler on 7/4/15.
//  Copyright © 2015 Grant J. Butler. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <TagKit/TagKit.h>

@interface TAGFileTests : XCTestCase

@end

@implementation TAGFileTests

- (void)testInitWithPathInitializer {
	NSBundle *bundle = [NSBundle bundleForClass:[self class]];
	NSString *path = [bundle pathForResource:@"TestAudioFile" ofType:@"wav"];
	TAGFile *file = [[TAGFile alloc] initWithPath:path];
	
	XCTAssertNotNil(file);
}

- (void)testInitWithFilePathInitializer {
	NSBundle *bundle = [NSBundle bundleForClass:[self class]];
	NSURL *URL = [bundle URLForResource:@"TestAudioFile" withExtension:@"wav"];
	TAGFile *file = [[TAGFile alloc] initWithFileURL:URL];
	
	XCTAssertNotNil(file);
}

- (void)testInvalidFileInitializer {
	TAGFile *file = [[TAGFile alloc] initWithPath:@"/Doesnt/Exist.mp5"];
	XCTAssertNil(file);
}

- (void)testAlbumGetter {
	NSBundle *bundle = [NSBundle bundleForClass:[self class]];
	NSURL *URL = [bundle URLForResource:@"TestAudioFile" withExtension:@"wav"];
	TAGFile *file = [[TAGFile alloc] initWithFileURL:URL];
	
	XCTAssertNotNil(file);
	XCTAssertEqualObjects(file.album, @"In Reality - Single");
}

@end
