//
//  NSString+TAGTaglibSupport.m
//  TagKit
//
//  Created by Grant Butler on 7/4/15.
//  Copyright © 2015 Grant J. Butler. All rights reserved.
//

#import "NSString+TAGTaglibSupport.h"

@implementation NSString (TAGTaglibSupport)

+ (NSStringEncoding)stringEncodingForTagLibString:(const TagLib::String)string {
	if (string.isLatin1()) {
		return NSISOLatin1StringEncoding;
	}
	else if (string.isAscii()) {
		return NSASCIIStringEncoding;
	}
	else {
		return NSUTF8StringEncoding;
	}
}

+ (nullable instancetype)stringWithTagLibString:(const TagLib::String)string {
	NSStringEncoding encoding = [self stringEncodingForTagLibString:string];
	return [NSString stringWithCString:string.to8Bit(true).c_str() encoding:encoding];
}

- (TagLib::String)tagLibStringValue {
	return TagLib::String(self.UTF8String, TagLib::String::UTF8);
}

@end
