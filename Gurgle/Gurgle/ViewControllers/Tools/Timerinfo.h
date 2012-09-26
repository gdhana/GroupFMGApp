//
//  Timerinfo.h
//  Gurgle
//
//  Created by Dhanasekar Gunabalan on 8/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TimerInfo : NSObject {
    
    int _uniqueId;
    NSString *_starttime;
    NSString *_endtime;
    NSString *_duration;
    NSString *_frequency;
}

@property (nonatomic, assign) int uniqueId;
@property (nonatomic, copy) NSString *starttime;
@property (nonatomic, copy) NSString *endtime;
@property (nonatomic, copy) NSString *duration;
@property (nonatomic, copy) NSString *frequency;

- (id)initWithTimerUniqueId:(int)uniqueId starttime:(NSString *)starttime endtime:(NSString *)endtime duration:(NSString *)duration frequency:(NSString *) frequency;


@end