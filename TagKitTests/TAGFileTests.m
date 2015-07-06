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

- (NSURL *)sampleAudioFileURL {
	NSBundle *bundle = [NSBundle bundleForClass:[self class]];
	return [bundle URLForResource:@"TestAudioFile" withExtension:@"mp3"];
}

- (void)testInitWithPathInitializer {
	NSBundle *bundle = [NSBundle bundleForClass:[self class]];
	NSString *path = [bundle pathForResource:@"TestAudioFile" ofType:@"mp3"];
	TAGFile *file = [[TAGFile alloc] initWithPath:path];
	
	XCTAssertNotNil(file);
}

- (void)testInitWithFilePathInitializer {
	TAGFile *file = [[TAGFile alloc] initWithFileURL:[self sampleAudioFileURL]];
	
	XCTAssertNotNil(file);
}

- (void)testInvalidFileInitializer {
	TAGFile *file = [[TAGFile alloc] initWithPath:@"/Doesnt/Exist.mp5"];
	XCTAssertNil(file);
}

- (void)testAlbumGetter {
	TAGFile *file = [[TAGFile alloc] initWithFileURL:[self sampleAudioFileURL]];
	
	XCTAssertNotNil(file);
	XCTAssertEqualObjects(file.album, @"In Reality - Single");
}

- (void)testArtistGetter {
	TAGFile *file = [[TAGFile alloc] initWithFileURL:[self sampleAudioFileURL]];
	
	XCTAssertNotNil(file);
	XCTAssertEqualObjects(file.artist, @"Pierce Fulton");
}

- (void)testCommentGetter {
	TAGFile *file = [[TAGFile alloc] initWithFileURL:[self sampleAudioFileURL]];
	
	XCTAssertNotNil(file);
	XCTAssertEqualObjects(file.comment, @"This is a comment");
}

@end
