//
//  Weekinfo.m
//  Gurgle
//
//  Created by Dhanasekar Gunabalan on 8/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//


//CREATE TABLE IF NOT EXISTS Labourbirthtips (id INTEGER PRIMARY KEY AUTOINCREMENT, weekno INTEGER, weekplus INTEGER,weekdesc TEXT,updatedDate DATETIME);
//CREATE TRIGGER UPDATE_Labourbirthtips BEFORE UPDATE ON Labourbirthtips BEGIN UPDATE Labourbirthtips SET updatedDate = datetime('now', 'localtime') WHERE rowid = new.rowid; END;

//CREATE TRIGGER INSERT_Labourbirthtips AFTER INSERT ON Labourbirthtips BEGIN UPDATE Labourbirthtips SET updatedDate = datetime('now', 'localtime') WHERE rowid = new.rowid; END;
//INSERT INTO Labourbirthtips (weekno, weekplus, weekdesc, updatedDate) VALUES (\"%@\", \"%@\", \"%@\", \"%@\", \"%@\")
//INSERT INTO Labourbirthtips (weekno, weekplus, weekdesc, updatedDate) VALUES ("22","1","Have you chosen your birth partner? Now is the time to let them know, so they can prepare for your labour too.",datetime('now','localtime'));

#import "Weekinfo.h"
#import "WeekDetails.h"

@implementation Weekinfo

static Weekinfo *_database;

+ (Weekinfo*)database {
    if (_database == nil) {
        _database = [[Weekinfo alloc] init];
    }
    return _database;
}

- (id)init {
    if ((self = [super init])) {
        NSString *sqLiteDb = [[NSBundle mainBundle] pathForResource:@"GurgleDB" ofType:@"sqlite3"];
        
        if (sqlite3_open([sqLiteDb UTF8String], &_database) != SQLITE_OK) {
            NSLog(@"Failed to open database!");
        }
    }
    return self;
}

- (NSArray *)ShowWeekInfos {
    
    NSMutableArray *retval = [[NSMutableArray alloc] init];
   // NSString *query = @"SELECT id, weekno, weekplus, weekdesc FROM Labourbirthtips ORDER BY id ASC";
    NSString *query = @"SELECT id, weekno, weekplus, weekdesc FROM Labourbirthtips WHERE weekplus = 0  ORDER BY id ASC";
    //NSString *query = @"SELECT id, weekno, weekplus, weekdesc FROM Labourbirthtips WHERE weekno = 22  ORDER BY id ASC";
    sqlite3_stmt *statement;
    if (sqlite3_prepare_v2(_database, [query UTF8String], -1, &statement, nil) == SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
            int uniqueId = sqlite3_column_int(statement, 0);
            int weeknumber = sqlite3_column_int(statement, 1);
            int weekplus = sqlite3_column_int(statement, 2);
            char *weekdescchar = (char *) sqlite3_column_text(statement, 3);
            NSString *weekdesc = [[NSString alloc] initWithUTF8String:weekdescchar];
            //NSLog(@"%d",weekplus);
            WeekDetails *info = [[WeekDetails alloc] initWithWeeksUniqueId:uniqueId weekno:weeknumber weekplus:weekplus weekdesc:weekdesc];                        
            [retval addObject:info];
        }
        sqlite3_finalize(statement);
    }
    return retval;
    
}

- (NSArray *)ShowWeekDetailInfos {
    
    NSMutableArray *retval = [[NSMutableArray alloc] init];
   // NSString *query = @"SELECT id, weekno, weekplus, weekdesc FROM Labourbirthtips WHERE weekno = 22  ORDER BY id ASC";
    
     NSString *query = [NSString stringWithFormat:@"SELECT id, weekno, weekplus, weekdesc FROM Labourbirthtips WHERE weekplus = 22 ORDER BY id ASC"];
    //NSLog(@"%@",query);
    sqlite3_stmt *statement;
    if (sqlite3_prepare_v2(_database, [query UTF8String], -1, &statement, nil) == SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
            int uniqueId = sqlite3_column_int(statement, 0);
            int weeknumber = sqlite3_column_int(statement, 1);
            int weekplus = sqlite3_column_int(statement, 2);
            char *weekdescchar = (char *) sqlite3_column_text(statement, 3);
            NSString *weekdesc = [[NSString alloc] initWithUTF8String:weekdescchar];
          //  NSLog(@"%d",weekplus);
            WeekDetails *info = [[WeekDetails alloc] initWithWeeksUniqueId:uniqueId weekno:weeknumber weekplus:weekplus weekdesc:weekdesc];                        
            [retval addObject:info];
        }
        sqlite3_finalize(statement);
    }
    return retval;
    
}

- (NSArray *)ShowWeekPlusInfos:(int)weekno{
    
    NSMutableArray *retval = [[NSMutableArray alloc] init];
    
    NSString *query = [NSString stringWithFormat:@"SELECT id, weekno, weekplus, weekdesc FROM Labourbirthtips WHERE weekno = %d",weekno];
   // NSLog(@"%@",query);
    sqlite3_stmt *statement;
    if (sqlite3_prepare_v2(_database, [query UTF8String], -1, &statement, nil) == SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
            int uniqueId = sqlite3_column_int(statement, 0);
            int weeknumber = sqlite3_column_int(statement, 1);
            int weekplus = sqlite3_column_int(statement, 2);
            char *weekdescchar = (char *) sqlite3_column_text(statement, 3);
            NSString *weekdesc = [[NSString alloc] initWithUTF8String:weekdescchar];
            //NSLog(@"%d",weekplus);
            WeekDetails *info = [[WeekDetails alloc] initWithWeeksUniqueId:uniqueId weekno:weeknumber weekplus:weekplus weekdesc:weekdesc];                        
            [retval addObject:info];
        }
        sqlite3_finalize(statement);
    }
    return retval;
    
}

- (NSArray *)SearchWeek:(int)weekno{
    
    NSMutableArray *retval = [[NSMutableArray alloc] init];
    
    NSString *query = [NSString stringWithFormat:@"SELECT id, weekno, weekplus, weekdesc FROM Labourbirthtips WHERE weekno = %d AND weekplus = 0",weekno];
   // NSLog(@"%@",query);
    sqlite3_stmt *statement;
    if (sqlite3_prepare_v2(_database, [query UTF8String], -1, &statement, nil) == SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
            int uniqueId = sqlite3_column_int(statement, 0);
            int weeknumber = sqlite3_column_int(statement, 1);
            int weekplus = sqlite3_column_int(statement, 2);
            char *weekdescchar = (char *) sqlite3_column_text(statement, 3);
            NSString *weekdesc = [[NSString alloc] initWithUTF8String:weekdescchar];
         //   NSLog(@"%d",weekplus);
            WeekDetails *info = [[WeekDetails alloc] initWithWeeksUniqueId:uniqueId weekno:weeknumber weekplus:weekplus weekdesc:weekdesc];                        
            [retval addObject:info];
        }
        sqlite3_finalize(statement);
    }
    return retval;
    
}

@end
