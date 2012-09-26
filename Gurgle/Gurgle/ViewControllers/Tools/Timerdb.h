//
//  Timerdb.h
//  Gurgle
//
//  Created by Dhanasekar Gunabalan on 8/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "sqlite3.h"

@interface Timerdb : NSObject
{
    sqlite3 *_database;
}

+ (Timerdb*)database;
- (NSArray *)ShowTimerInfos; 
@end
