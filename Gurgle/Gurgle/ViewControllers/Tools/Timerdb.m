//
//  Timerdb.m
//  Gurgle
//
//  Created by Dhanasekar Gunabalan on 8/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Timerdb.h"
#import "TimerInfo.h"

@implementation Timerdb

static Timerdb *_database;

+ (Timerdb*)database {
    if (_database == nil) {
        _database = [[Timerdb alloc] init];
    }
    return _database;
}

- (id)init {
    if ((self = [super init])) {
        
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES); 
        NSString *documentsDirectory = [paths objectAtIndex:0];
        
        NSString *databasePath = [[NSString alloc]initWithString:[documentsDirectory stringByAppendingPathComponent:@"timings1.db"]];
        
        //NSString *sqLiteDb = [[NSBundle mainBundle] pathForResource:@"timings1" ofType:@"db"];
        
        if (sqlite3_open([databasePath UTF8String], &_database) != SQLITE_OK) {
            NSLog(@"Failed to open database!");
        }
    }
    return self;
}


- (NSArray *)ShowTimerInfos {
    
    NSMutableArray *retval = [[NSMutableArray alloc] init];
    NSString *query = @"SELECT id, starttime, endtime, duration, frequency FROM Contractiontimer ORDER BY id DESC";
    sqlite3_stmt *statement;
    if (sqlite3_prepare_v2(_database, [query UTF8String], -1, &statement, nil) == SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
            int uniqueId = sqlite3_column_int(statement, 0);
            char *starttimeChars = (char *) sqlite3_column_text(statement, 1);
            char *endtimeChars = (char *) sqlite3_column_text(statement, 2);
            char *durationChars = (char *) sqlite3_column_text(statement, 3);
            char *frequencyChars = (char *) sqlite3_column_text(statement, 4);
            NSString *starttime = [[NSString alloc] initWithUTF8String:starttimeChars];
            NSString *endtime = [[NSString alloc] initWithUTF8String:endtimeChars];
            NSString *duration = [[NSString alloc] initWithUTF8String:durationChars];
            NSString *frequency = [[NSString alloc] initWithUTF8String:frequencyChars];
            TimerInfo *timerinfo = [[TimerInfo alloc] initWithTimerUniqueId:uniqueId starttime:starttime endtime:endtime duration:duration frequency:frequency];                        
            [retval addObject:timerinfo];
//            [starttime release];
//            [endtime release];
//            [duration release];
//            [frequency release];
//            [timerinfo release];
        }
        sqlite3_finalize(statement);
    }
    return retval;
    
}

@end
