//
//  GlossaryData.m
//  Gurgle
//
//  Created by Dhanasekar Gunabalan on 5/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GlossaryData.h"

@implementation GlossaryData
@synthesize glossarytitle,glossarydescription;

- (id) init
{
    self=[super init];
    
    glossarytitle = @"abc";
    glossarydescription = @"detail";
    
    return self;
    
}

@end
