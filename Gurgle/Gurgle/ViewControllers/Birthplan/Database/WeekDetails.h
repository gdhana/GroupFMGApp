//
//  WeekDetails.h
//  Gurgle
//
//  Created by Dhanasekar Gunabalan on 8/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeekDetails : NSObject
{
    int _uniqueId;
    int _weekno;
    int _weekplus;
    NSString *_weekdesc;
    NSDate *_updatedDate;
}

@property (nonatomic, assign) int uniqueId;
@property (nonatomic, assign) int weekno;
@property (nonatomic, assign) int weekplus;
@property (nonatomic, copy) NSString *weekdesc;
@property (nonatomic, retain) NSDate *updatedDate;

- (id)initWithWeeksUniqueId:(int)uniqueId weekno:(int)weekno weekplus:(int)weekplus weekdesc:(NSString *)weekdesc;


@end
