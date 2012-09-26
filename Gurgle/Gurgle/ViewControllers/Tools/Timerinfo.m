//
//  Timerinfo.m
//  Gurgle
//
//  Created by Dhanasekar Gunabalan on 8/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TimerInfo.h"

@implementation TimerInfo

@synthesize uniqueId = _uniqueId;
@synthesize starttime = _starttime;
@synthesize endtime = _endtime;
@synthesize duration = _duration;
@synthesize frequency = _frequency;

- (id)initWithTimerUniqueId:(int)uniqueId starttime:(NSString *)starttime endtime:(NSString *)endtime duration:(NSString *)duration frequency:(NSString *) frequency {
    if ((self = [super init])) {
        self.uniqueId = uniqueId;
        self.starttime = starttime;
        self.endtime = endtime;
        self.duration = duration;
        self.frequency = frequency;
    }
    return self;
}


@end
