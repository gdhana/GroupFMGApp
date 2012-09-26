//
//  WeekDetails.m
//  Gurgle
//
//  Created by Dhanasekar Gunabalan on 8/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "WeekDetails.h"

@implementation WeekDetails

@synthesize uniqueId = _uniqueId;
@synthesize weekno = _weekno;
@synthesize weekplus = _weekplus;
@synthesize weekdesc = _weekdesc;
@synthesize updatedDate = _updatedDate;

- (id)initWithWeeksUniqueId:(int)uniqueId weekno:(int)weekno weekplus:(int)weekplus weekdesc:(NSString *)weekdesc
{
     if ((self = [super init])) {
         
         self.uniqueId = uniqueId;
         self.weekno = weekno;
         self.weekplus = weekplus;
         self.weekdesc = weekdesc;
         //self.updatedDate = updatedDate;
     }
    
    return self;
}
@end
