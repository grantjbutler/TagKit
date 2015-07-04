//
//  NSString+TAGTaglibSupport.h
//  TagKit
//
//  Created by Grant Butler on 7/4/15.
//  Copyright © 2015 Grant J. Butler. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <TagKit/TagKitDefines.h>

#include "tstring.h"

@interface NSString (TAGTaglibSupport)

+ (nullable instancetype)stringWithTagLibString:(const TagLib::String)string;

@property (nonatomic, readonly) TagLib::String tagLibStringValue;

@end
