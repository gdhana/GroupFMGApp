//
//  P1TextString.m
//  Gurgle
//
//  Created by Dhanasekar Gunabalan on 8/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//


#import "P1TextString.h"

#define kField1Key @"Nametxt"
#define kField2Key @"T2"
#define kField3Key @"T3"
#define kField4Key @"T4"


@implementation P1TextString

@synthesize Nametxt;
@synthesize T2;
@synthesize T3;
@synthesize T4;

#pragma mark NSCoding

-(void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:Nametxt forKey:kField1Key];
    [encoder encodeObject:T2 forKey:kField2Key];
    [encoder encodeObject:T3 forKey:kField3Key];
    [encoder encodeObject:T4 forKey:kField4Key];
    
}

-(id)initWithCoder:(NSCoder *)decoder {
    if (self = [super init]) {
        Nametxt = [decoder decodeObjectForKey:kField1Key];
        T2 = [decoder decodeObjectForKey:kField2Key];
        T3 = [decoder decodeObjectForKey:kField3Key];
        T4 = [decoder decodeObjectForKey:kField4Key];
    }
    
    return self;
}

#pragma mark
#pragma mark NSCopying

-(id)copyWithZone:(NSZone *)zone {
    P1TextString *copy = [[[self class] allocWithZone:zone] init];
    copy.Nametxt = [self.Nametxt copyWithZone:zone];
    copy.T2 = [self.T2 copyWithZone:zone];
    copy.T3 = [self.T3 copyWithZone:zone];
    copy.T4 = [self.T4 copyWithZone:zone];
    return copy;
}

@end
