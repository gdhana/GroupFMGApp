//
//  Weekinfo.h
//  Gurgle
//
//  Created by Dhanasekar Gunabalan on 8/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "sqlite3.h"

@interface Weekinfo : NSObject
{
sqlite3 *_database;
}

+ (Weekinfo*)database;
- (NSArray *)ShowWeekInfos; 
- (NSArray *)ShowWeekDetailInfos; 
-(NSArray *)ShowWeekPlusInfos:(int)weekno;
- (NSArray *)SearchWeek:(int)weekno;
@end
