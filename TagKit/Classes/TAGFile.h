//
//  TAGFile.h
//  TagKit
//
//  Created by Grant Butler on 7/4/15.
//  Copyright © 2015 Grant J. Butler. All rights reserved.
//

@import Foundation;

@interface TAGFile : NSObject

- (instancetype)init NS_UNAVAILABLE;

- (instancetype)initWithPath:(NSString *)path;
- (instancetype)initWithFileURL:(NSURL *)URL NS_DESIGNATED_INITIALIZER;

@end
