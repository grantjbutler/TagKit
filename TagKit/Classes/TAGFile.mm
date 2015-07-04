//
//  TAGFile.m
//  TagKit
//
//  Created by Grant Butler on 7/4/15.
//  Copyright © 2015 Grant J. Butler. All rights reserved.
//

#import "TAGFile.h"

#include "fileref.h"

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

@end
