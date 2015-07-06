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

#pragma mark - Initializers

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

#pragma mark - Getters

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

- (void)testGenreGetter {
	TAGFile *file = [[TAGFile alloc] initWithFileURL:[self sampleAudioFileURL]];
	
	XCTAssertNotNil(file);
	XCTAssertEqualObjects(file.genre, @"Progressive House");
}

- (void)testTitleGetter {
	TAGFile *file = [[TAGFile alloc] initWithFileURL:[self sampleAudioFileURL]];
	
	XCTAssertNotNil(file);
	XCTAssertEqualObjects(file.title, @"In Reality (Snippet)");
}

- (void)testTrackGetter {
	TAGFile *file = [[TAGFile alloc] initWithFileURL:[self sampleAudioFileURL]];
	
	XCTAssertNotNil(file);
	XCTAssertEqual(file.track, 1);
}

- (void)testYearGetter {
	TAGFile *file = [[TAGFile alloc] initWithFileURL:[self sampleAudioFileURL]];
	
	XCTAssertNotNil(file);
	XCTAssertEqual(file.year, 2015);
}

@end
