//
//  MutableDeepCopy.h
//  Gurgle
//
//  Created by Dhanasekar Gunabalan on 6/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (MutableDeepCopy)

- (NSMutableDictionary *)mutableDeepCopy;


@end
