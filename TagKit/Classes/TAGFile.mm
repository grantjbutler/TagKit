//
//  TAGFile.m
//  TagKit
//
//  Created by Grant Butler on 7/4/15.
//  Copyright © 2015 Grant J. Butler. All rights reserved.
//

#import "TAGFile.h"
#import "NSString+TAGTaglibSupport.h"

#include "fileref.h"
#include "tstring.h"

@interface TAGFile ()

@property (nonatomic, assign) TagLib::FileRef *fileRef;

@end

@implementation TAGFile

- (instancetype)init {
	[NSException raise:NSInternalInconsistencyException format:@"-init is not available on TAGFile. Call -initWithPath: or -initWithFileURL: instead."];
	return nil;
}

- (nullable instancetype)initWithPath:(NSString *)path {
	NSURL *fileURL = [NSURL fileURLWithPath:path];
	return [self initWithFileURL:fileURL];
}

- (nullable instancetype)initWithFileURL:(NSURL *)URL {
	self = [super init];
	if (self) {
		_fileRef = new TagLib::FileRef(URL.path.fileSystemRepresentation);
		if (!_fileRef || _fileRef->isNull()) {
			return nil;
		}
	}
	return self;
}

- (void)dealloc {
	delete self.fileRef;
}

#pragma mark  - Accessors

- (NSString * __nullable)album {
	TagLib::String albumTagLibString = self.fileRef->tag()->album();
	return [NSString stringWithTagLibString:albumTagLibString];
}

- (void)setAlbum:(NSString * __nullable)album {
	TagLib::String albumTagLibString = TagLib::String::null;
	if (album) {
		albumTagLibString = album.tagLibStringValue;
	}
	self.fileRef->tag()->setAlbum(albumTagLibString);
}

- (NSString * __nullable)artist {
	TagLib::String albumTagLibString = self.fileRef->tag()->artist();
	return [NSString stringWithTagLibString:albumTagLibString];
}

- (void)setArtist:(NSString * __nullable)artist {
	TagLib::String artistTagLibString = TagLib::String::null;
	if (artist) {
		artistTagLibString = artist.tagLibStringValue;
	}
	self.fileRef->tag()->setArtist(artistTagLibString);
}

- (NSString * __nullable)comment {
	TagLib::String commentTagLibString = self.fileRef->tag()->comment();
	return [NSString stringWithTagLibString:commentTagLibString];
}

- (void)setComment:(NSString * __nullable)comment {
	TagLib::String commentTagLibString = TagLib::String::null;
	if (comment) {
		commentTagLibString = comment.tagLibStringValue;
	}
	self.fileRef->tag()->setComment(commentTagLibString);
}

- (NSString * __nullable)genre {
	TagLib::String genreTagLibString = self.fileRef->tag()->genre();
	return [NSString stringWithTagLibString:genreTagLibString];
}

- (void)setGenre:(NSString * __nullable)genre {
	TagLib::String genreTagLibString = TagLib::String::null;
	if (genre) {
		genreTagLibString = genre.tagLibStringValue;
	}
	self.fileRef->tag()->setGenre(genreTagLibString);
}

@end
