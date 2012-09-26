//
//  Glossary.m
//  testapp
//
//  Created by Madhumathi Karthikeyan on 01/08/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Glossary.h"

@implementation Glossary
@synthesize word,definition;
-(id) init{
    
    self = [super init];
    if (self) {
        word = nil;
        definition = nil;
    }       
    
    return self;

}
@end
