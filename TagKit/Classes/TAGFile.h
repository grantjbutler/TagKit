//
//  TAGFile.h
//  TagKit
//
//  Created by Grant Butler on 7/4/15.
//  Copyright © 2015 Grant J. Butler. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <TagKit/TagKitDefines.h>

NS_ASSUME_NONNULL_BEGIN

@interface TAGFile : NSObject

- (instancetype)init NS_UNAVAILABLE;

- (nullable instancetype)initWithPath:(NSString *)path;
- (nullable instancetype)initWithFileURL:(NSURL *)URL NS_DESIGNATED_INITIALIZER;

@property (nonatomic, copy, nullable) NSString *album;
@property (nonatomic, copy, nullable) NSString *artist;
@property (nonatomic, copy, nullable) NSString *comment;
@property (nonatomic, copy, nullable) NSString *genre;
@property (nonatomic, copy, nullable) NSString *title;

@property (nonatomic, assign) uint track;
@property (nonatomic, assign) uint year;

- (BOOL)save;

@end

NS_ASSUME_NONNULL_END
