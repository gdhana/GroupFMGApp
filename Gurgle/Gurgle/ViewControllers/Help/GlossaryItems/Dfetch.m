//
//  Dfetch.m
//  Gurgle
//
//  Created by Dhanasekar Gunabalan on 7/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Dfetch.h"

@implementation Dfetch

@synthesize libraryContent, libraryPlist;


- (id)initWithLibraryName:(NSString *)libraryName {
    if (self = [super init]) {
        libraryPlist = libraryName;
        libraryContent = [[NSArray alloc] initWithContentsOfFile:[[NSBundle mainBundle] 
                                                                  pathForResource:libraryPlist ofType:@"plist"]];
    }
    return self;
}


- (NSDictionary *)libraryItemAtIndex:(int)index {
    return (libraryContent != nil && [libraryContent count] > 0 && index < [libraryContent count]) 
	? [libraryContent objectAtIndex:index]
	: nil;
}

- (int)libraryCount {
    return (libraryContent != nil) ? [libraryContent count] : 0;
}

//- (void) dealloc {
//    if (libraryContent) [libraryContent release];
//    [super dealloc];
//}


@end
