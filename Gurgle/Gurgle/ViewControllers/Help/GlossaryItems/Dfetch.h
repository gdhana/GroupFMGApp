//
//  Dfetch.h
//  Gurgle
//
//  Created by Dhanasekar Gunabalan on 7/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Dfetch : NSObject
{
NSString *libraryPlist;
NSArray *libraryContent;
}

@property (nonatomic, readonly) NSString *libraryPlist;
@property (nonatomic, readonly) NSArray *libraryContent;

- (id)initWithLibraryName:(NSString *)libraryName;
- (NSDictionary *)libraryItemAtIndex:(int)index;
- (int)libraryCount;

@end
