//
//  TAGFile.h
//  TagKit
//
//  Created by Grant Butler on 7/4/15.
//  Copyright © 2015 Grant J. Butler. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TAGFile : NSObject

- (instancetype)init NS_UNAVAILABLE;

- (nullable instancetype)initWithPath:(NSString *)path;
- (nullable instancetype)initWithFileURL:(NSURL *)URL NS_DESIGNATED_INITIALIZER;

@end

NS_ASSUME_NONNULL_END
