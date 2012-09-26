//
//  ContractionTimerpauseViewController.m
//  Gurgle
//
//  Created by Dhanasekar Gunabalan on 6/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ContractionTimerpauseViewController.h"
#import "ContractionTimerInfoViewController.h"

#import "BirthplanViewController.h"
#import "ToolsViewController.h"
#import "FunViewController.h"
#import "HelpViewController.h"
#import "GurgleAdViewController.h"

#import "FlipTensDigit.h"

#import "Timerdb.h"
#import "TimerInfo.h"
#import "TimerDisplayCell.h"

@interface ContractionTimerpauseViewController ()

@end

@implementation ContractionTimerpauseViewController

@synthesize tableview;
//@synthesize ContractionTableView;

@synthesize stopWatchLabel;
@synthesize endstopwatchlabel;
@synthesize durationdifflabel;
@synthesize frequencydifflabel;
@synthesize Clock_table;
@synthesize ShowTimerInfos = _ShowTimerInfos;

static int i  =01;
static int j  =01;
NSString *tempnowstart,*tempprevstart;
NSDate *tempdate;
int hours,minutes,seconds;
int hourstest,minutestest,secondstest;

NSString *LastStartfromDB;

BOOL startdigitaltimer,resettimer;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
//    bottombanner.animationImages = [NSArray arrayWithObjects: 
//                                    [UIImage imageNamed:@"huggies_banner.png"],                              
//                                    [UIImage imageNamed:@"Banner1.jpg"],[UIImage imageNamed:@"Banner2.jpg"],[UIImage imageNamed:@"Banner3.jpg"],[UIImage imageNamed:@"Banner4.jpg"],[UIImage imageNamed:@"Banner5.jpg"], nil];
//    bottombanner.animationDuration = 25.0; // seconds
//    bottombanner.animationRepeatCount = 0; //0 loops for ever/noted
//    [bottombanner startAnimating];
    
    [scrollview setScrollEnabled:YES];
    [scrollview setContentSize:CGSizeMake(283, 380)];
    
    [self createDatabase];
    self.ShowTimerInfos = [Timerdb database].ShowTimerInfos;
    
    NSArray *ShowTimerInfos = [Timerdb database].ShowTimerInfos;
  //  NSLog(@"TimerInfos: %i",_ShowTimerInfos.count);
    if(_ShowTimerInfos.count == 0)
    {
        tableview.hidden = YES;
        Clock_table.hidden = NO;
        durationdifflabel.hidden = NO;
        frequencydifflabel.hidden = NO;
        stopWatchLabel.hidden =NO;
        endstopwatchlabel.hidden =NO;
    }
    else {
        tableview.hidden = NO;
        Clock_table.hidden = YES;
        durationdifflabel.hidden = YES;
        frequencydifflabel.hidden = YES;
        stopWatchLabel.hidden =YES;
        endstopwatchlabel.hidden =YES;
    }
    for (TimerInfo *timerinfo in ShowTimerInfos) {
       // NSLog(@"%d: %@, %@, %@, %@", timerinfo.uniqueId, timerinfo.starttime, timerinfo.endtime, timerinfo.duration, timerinfo.frequency);
    }
    fliper =[[FlipTensDigit alloc]
             initWithFrame:CGRectMake(180, 95, 100,100)];
            // initWithFrame:CGRectMake(157, 17, 100,100)];
   // [self->scrollview addSubview:fliper];
    [self.view addSubview:fliper];
    
    fliper1 =[[FlipTensDigit alloc]
               initWithFrame:CGRectMake(48, 95, 100,100)];
            // initWithFrame:CGRectMake(25, 17, 100,100)];
    //[self->scrollview addSubview:fliper1];
    [self.view addSubview:fliper1];
    startdigitaltimer = 1;
    [tableview reloadData];
//    ContractionTableView = [[UITableView alloc] initWithFrame:CGRectMake(21,270, 276, 159)];
//    ContractionTableView.delegate =self;
//    ContractionTableView.dataSource=self;
//    [self.view addSubview:ContractionTableView];  
    
    //[NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(UpdateClock:) userInfo:nil repeats:YES];
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [self setStopWatchLabel:nil];
    [self setEndstopwatchlabel:nil];
    bottombanner = nil;
    scrollview = nil;
    [self setDurationdifflabel:nil];
    [self setFrequencydifflabel:nil];
    [self setTableview:nil];
    tableview = nil;
    self.ShowTimerInfos = nil;
    [self setClock_table:nil];
    Topbanner = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    if ([touch view] == bottombanner){
        GurgleAdViewController *GurgleAdView = [[GurgleAdViewController alloc] initWithNibName:@"GurgleAdViewController" bundle:nil urlString:@"http://www.huggiesclub.co.uk/products/nappies/newborn" title:@"Huggies"];
        GurgleAdView.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        [self presentModalViewController:GurgleAdView animated:NO];
    }
    if ([touch view] == Topbanner){
        GurgleAdViewController *GurgleAdView = [[GurgleAdViewController alloc] initWithNibName:@"GurgleAdViewController" bundle:nil urlString:@"http://www.gurgle.com" title:@"Gurgle"];
        GurgleAdView.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        [self presentModalViewController:GurgleAdView animated:NO];
    }
}

-(void)UpdateClock:(NSTimer*)sender
{   
    endDate=[NSDate date];
   // endstopwatchlabel.text = [NSString stringWithFormat:@"%@",[self getStartDateFormatted]];
    [self getStartDateFormatted];
   // NSTimeInterval secondsElapsed = [endDate timeIntervalSinceDate:startDate];

    
    NSTimeInterval secondsElapsed = [endDate timeIntervalSinceDate:startDate];
     hourstest = secondsElapsed / 3600;
     minutestest = (secondsElapsed - (hourstest * 3600)) / 60;
     secondstest = (int)secondsElapsed%60;
    if(starttimer){
        if(secondstest==60) secondstest=0;
        //if(startdigitaltimer == 0){[fliper1 FlipToNumber:j];}
        [fliper FlipToNumber:secondstest];
        if(secondstest==59){
            [fliper1 FlipToNumber:minutestest+1];
            //minutestest++;
        }    
        i++;
    }
    
    //NSLog(@"%@",[NSString stringWithFormat:@"%.02d : %.02d : %.02d",hours,minutes,seconds]);
   // NSString *str = [NSString stringWithFormat:@"%02d:%02d:%02d",hourstest,minutestest,secondstest]; //[NSString stringWithFormat:@"%02d:%02d:%02d", h, m, s]; 
    secondstest = secondstest +1;
    if(secondstest == 60) {
        secondstest = 00;
        minutestest = minutestest + 1;
    }
   // NSLog(@"String testing : %@",str);
    
    }

#pragma mark - SQLite

-(void)createDatabase
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES); 
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    databasePath = [[NSString alloc]initWithString:[documentsDirectory stringByAppendingPathComponent:@"timings1.db"]];
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:databasePath] == FALSE)
    {
        if (sqlite3_open([databasePath UTF8String], &timingsDatabase) == SQLITE_OK)
        {
           // const char *sqlStatement = "CREATE TABLE IF NOT EXISTS Contractiontimer (ID INTEGER PRIMARY KEY AUTOINCREMENT, STARTTIME TEXT, ENDTIME TEXT,DURATION TEXT,FREQUENCY TEXT ,LastDate DATETIME)";
            const char *sqlStatement = "CREATE TABLE IF NOT EXISTS Contractiontimer (id INTEGER PRIMARY KEY AUTOINCREMENT, starttime TEXT, endtime TEXT,duration TEXT,frequency TEXT,LastDate DATETIME)";
            
            char *error;
            sqlite3_exec(timingsDatabase, sqlStatement, NULL, NULL, &error);
            
            const char *sqlStatement2 = "CREATE TRIGGER UPDATE_Contractiontimer BEFORE UPDATE ON Contractiontimer BEGIN UPDATE Contractiontimer SET LastDate = datetime('now', 'localtime') WHERE rowid = new.rowid; END";
            
            const char *sqlStatement3 = "CREATE TRIGGER INSERT_Contractiontimer AFTER INSERT ON Contractiontimer BEGIN UPDATE Contractiontimer SET LastDate = datetime('now', 'localtime') WHERE rowid = new.rowid; END";
            sqlite3_exec(timingsDatabase, sqlStatement2, NULL, NULL, &error);
            sqlite3_exec(timingsDatabase, sqlStatement3, NULL, NULL, &error);
            
            sqlite3_close(timingsDatabase);
        }
    }
}

-(void)storeTiming
{
    if (sqlite3_open([databasePath UTF8String], &timingsDatabase) == SQLITE_OK)
    {
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"HH:mm:ss"];
        
        //NSString *insertStatement = [NSString stringWithFormat:@"INSERT INTO Contractiontimer (STARTTIME, ENDTIME, DURATION, FREQUENCY, LastDate) VALUES (\"%@\", \"%@\", \"%@\", \"%@\", \"%@\")", [dateFormatter stringFromDate:startDate], endstopwatchlabel.text, durationdifflabel.text,frequencydifflabel.text,startDate];
   //     NSString *queryStatement = [NSString stringWithFormat:@"SELECT starttime FROM Contractiontimer"];
        
    //    NSLog(@" Start Date : %@ while DB insert : %@",startDate,[dateFormatter stringFromDate:startDate]);
        
        NSString *insertStatement = [NSString stringWithFormat:@"INSERT INTO Contractiontimer (starttime, endtime, duration, frequency, LastDate) VALUES (\"%@\", \"%@\", \"%@\", \"%@\", \"%@\")", [dateFormatter stringFromDate:startDate], endstopwatchlabel.text, durationdifflabel.text,frequencydifflabel.text,startDate];
        
        char *error;
        sqlite3_exec(timingsDatabase, [insertStatement UTF8String], NULL, NULL, &error);
        sqlite3_close(timingsDatabase);
        
    }
}

-(void)getTimings
{
        
    if (sqlite3_open([databasePath UTF8String], &timingsDatabase) == SQLITE_OK)
    {      
        NSString *queryStatement = [NSString stringWithFormat:@"SELECT starttime, endtime ,duration ,frequency ,LastDate FROM Contractiontimer"];
        
        sqlite3_stmt *statement;
        if (sqlite3_prepare_v2(timingsDatabase, [queryStatement UTF8String], -1, &statement, NULL) == SQLITE_OK)
        {
            while (sqlite3_step(statement) == SQLITE_ROW) {
            //NSLog(@"STARTTIME: %s ENDTIME: %s DURATION: %s FREQUENCY: %s LastDate: %s", sqlite3_column_text(statement, 0), sqlite3_column_text(statement, 1), sqlite3_column_text(statement, 2), sqlite3_column_text(statement, 3), sqlite3_column_text(statement, 4));
            //    NSString *LastStartTimeDB= [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 0)];
           //     NSString *LastdateDB = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 4)];
              /*  NSLog(@"Lastdate DB: %@",LastdateDB);
                NSLog(@"LastStartTime DB : %@",LastStartTimeDB);
                
                NSDateFormatter *sampleFormat = [[NSDateFormatter alloc]init];
                [sampleFormat setDateFormat:@"HH:mm:ss"];

                
                NSLog(@" Start Date : %@ while DB insert : %@",LastStartTimeDB,[sampleFormat dateFromString:LastStartTimeDB]);

                
                // Convert string to date object
                NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
                [dateFormat setDateFormat:@"HH:mm:ss"];
               // NSDate *date = [dateFormat dateFromString:LastStartTimeDB];                  
//                // Convert date object to desired output format
//               // [dateFormat setDateFormat:@"HH:mm:ss"];
//                LastStartTimeDB = [dateFormat stringFromDate:date]; 
//                
//                NSLog(@"date1 : %@",date);
//                NSLog(@"Startdate : %@",startDate);
                
              //  NSString *LastStartTimeDB = @"12:36:59";
                
                NSDate *date1 = [dateFormat dateFromString:LastStartTimeDB];
                
                NSCalendar *calendar = [NSCalendar currentCalendar];
                NSDateComponents *comps = [calendar components:NSYearCalendarUnit |
                                              NSMonthCalendarUnit |
                                              NSDayCalendarUnit |
                                               NSHourCalendarUnit |
                                              NSMinuteCalendarUnit
                                              fromDate:[NSDate date]];
               NSDateComponents *timeComps = [calendar components:NSHourCalendarUnit |
                                                  NSMinuteCalendarUnit
                                                 fromDate:date1];
               
                [comps setHour:[timeComps hour]];
                [comps setMinute:[timeComps minute]];
               
                NSDate *datetime = [calendar dateFromComponents:comps];
                
                
                // format the date
                NSDateFormatter *dateFormat1 = [[NSDateFormatter alloc]init];
                [dateFormat1 setDateFormat:@"HH:mm:ss"];
                NSString *dateString1 = [dateFormat1 stringFromDate:datetime];
                NSLog(@"LastDatestring1 : %@",dateString1);
                NSLog(@"LastDatetime : %@",datetime);
                
                NSString *dateString2 = [dateFormat1 stringFromDate:startDate];
                NSLog(@"NowDatestring1 : %@",dateString2);
                NSLog(@"NowDatetime : %@",startDate);
                
                NSTimeInterval secondsElapsed = [startDate timeIntervalSinceDate:datetime];
                
                NSInteger hours = secondsElapsed / 3600;
                NSInteger minutes = (secondsElapsed - (hours * 3600)) / 60;
                NSInteger seconds = (int)secondsElapsed%60;
                
                NSLog(@"%@",[NSString stringWithFormat:@"%.02d : %.02d : %.02d",hours,minutes,seconds]);
                NSString *str = [NSString stringWithFormat:@"%02d:%02d:%02d",hours,minutes,seconds]; //[NSString stringWithFormat:@"%02d:%02d:%02d", h, m, s]; 
                frequencydifflabel.text = [NSString stringWithFormat:@"%.02d : %.02d : %.02d",hours,minutes,seconds];*/
            }
            sqlite3_finalize(statement);
            sqlite3_close(timingsDatabase);
        }
    }
}

-(void)getFrequency
{
    if(_ShowTimerInfos.count == 0) {
    }
    else{
    LastStartfromDB = nil;
    if (sqlite3_open([databasePath UTF8String], &timingsDatabase) == SQLITE_OK)
    {      
        NSString *getFrequencyquery = [NSString stringWithFormat:@"SELECT MAX(LastDate),starttime FROM Contractiontimer"];
        
        sqlite3_stmt *statement;
        if (sqlite3_prepare_v2(timingsDatabase, [getFrequencyquery UTF8String], -1, &statement, NULL) == SQLITE_OK)
        {
            while (sqlite3_step(statement) == SQLITE_ROW) {
                //NSLog(@"LastDate: %s FREQUENCY: %s", sqlite3_column_text(statement, 0), sqlite3_column_text(statement, 1));
              //  NSString *LastDateDB= [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 0)];
                NSString *starttimedb = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 1)];
                
                LastStartfromDB = starttimedb;
                
             //  NSLog(@"LastDate DB: %@",LastDateDB);
             //   NSLog(@"starttime DB : %@",starttimedb);
            }
            sqlite3_finalize(statement);
            sqlite3_close(timingsDatabase);
        }
    }
    }
}
            
- (NSString*) getStartDateFormatted {
    
    // create the startDate date object
    NSDate *StartDate = [NSDate date];

    // format the date
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc]init];
    [dateFormat setDateFormat:@"HH:mm:ss"];
    NSString *dateString = [dateFormat stringFromDate:StartDate];
    endstopwatchlabel.text = @"00:00:00";
    durationdifflabel.text = @"00:00:00";
    //frequencydifflabel.text = @"00:00:00";
    tempprevstart = dateString;
    //NSLog(@"First Start Time : %@",StartDate);
  //  NSLog(@"tempprevstart : %@",tempprevstart);
    return dateString;
}

- (NSString*) getStartDateFormatted1 {
    
    // create the startDate date object
    NSDate *StartDate = [NSDate date];
    
    // format the date
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc]init];
    [dateFormat setDateFormat:@"HH:mm:ss"];
    NSString *dateString = [dateFormat stringFromDate:StartDate];
    tempnowstart = dateString;
    // NSLog(@"First Start Time : %@",dateString);
    // NSLog(@"tempnowstart : %@",tempnowstart);
    tempdate = StartDate;
   // NSLog(@"tempnowstart : %@",tempdate);
    return dateString;
}

- (IBAction)onStartPressed:(id)sender {
   /* if(_ShowTimerInfos.count == 0){
    }
    else
        [fliper1 FlipToNumber:0];*/
    /*
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
    [dateFormatter setDateFormat:@"EEE, d MMM yyyy HH:mm:ss zzz"];
    NSString *dateString = @"Wed, 08 Aug 2012 15:19:00 EDT";
    NSDate *eventDate = [dateFormatter dateFromString:dateString];
    NSString *dateString1 = [dateFormatter stringFromDate:eventDate];

    
    NSDate *testDate = [NSDate date];
    
    NSString *testString = [dateFormatter stringFromDate:testDate];
    
    NSLog(@" testDate : %@ , testSting : %@",testDate,testString);
    
    NSDate *Datefrom = [dateFormatter dateFromString:testString];
    
    NSLog(@" Datefrom : %@",Datefrom);

    
    NSLog(@"Test date : %@",dateString1);*/
    
   /* difference = 6277
    hours = 6277 / (60x60) = 1
    minutes = (6277 - (60*60*hours)) / 60 = 44
    seconds = 6277 - 60*(60*hours+minutes) = 37
    */
  
    
    /* NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"HH:mm:ss"];
    NSDate *date1 = [df dateFromString:@"18:35:49"];
    NSDate *date2 = [df dateFromString:@"18:37:39"];
    
  //  NSDate *date1 = [df dateFromString:@"14:10"];
  //  NSDate *date2 = [df dateFromString:@"18:09"];
    NSTimeInterval interval = [date2 timeIntervalSinceDate:date1];
    int hours = (int)interval / 3600;             // integer division to get the hours part
    int minutes = (interval - (hours*3600)) / 60; // interval minus hours part (in seconds) divided by 60 yields minutes
    int s = ((NSUInteger) interval) % 60; 
    NSString *timeDiff = [NSString stringWithFormat:@"%d:%02d:%2d", hours, minutes,s];

    NSLog(@"Timediff : %@",timeDiff);  */
    
    if(startdigitaltimer)
         startDate = [[NSDate alloc] init]; // equivalent to [[NSDate date] retain];
    
    startDate=[NSDate date];
    stopWatchLabel.text = [NSString stringWithFormat:@"%@",[self getStartDateFormatted]];
    
   // NSTimeInterval ti = [startDate timeIntervalSinceDate:startDate];
    
//    int h = (ti / 3600);
//    int m = ((NSUInteger)(ti / 60)) % 60;
//    int s = ((NSUInteger) ti) % 60; 
    //NSString *str1 = [NSString stringWithFormat:@"%02d:%02d:%02d", hours,minutes,seconds];
  //  NSLog(@"String :%@",str1);

    stopbutton.hidden = NO;
    startbutton.hidden = YES;
    starttimer =YES;
    if(starttimer){
//        if(i==1){
//            [fliper1 FlipToNumber:0];
//            j=1;
//        }  
        if (resettimer == YES) {
            [fliper1 FlipToNumber:0];[fliper FlipToNumber:0];
        }
    stopWatchTimer1 = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(UpdateClock:) userInfo:nil repeats:YES];
        resettimer = NO;
    }
    [self getTimings];
}

- (IBAction)onStopPressed:(id)sender {
   
    resettimer = YES;
    startdigitaltimer = 0;
    [stopWatchTimer invalidate];
     stopWatchTimer = nil;
    
    [stopWatchTimer1 invalidate];
    stopWatchTimer1 = nil;
    
    endDate=[NSDate date];
    endstopwatchlabel.text = [NSString stringWithFormat:@"%@",[self getStartDateFormatted]];
    
    NSTimeInterval secondsElapsed = [endDate timeIntervalSinceDate:startDate];
     hours = secondsElapsed / 3600;
     minutes = (secondsElapsed - (hours * 3600)) / 60;
     seconds = (int)secondsElapsed%60;
    seconds = seconds +1;
    if(seconds == 60) {
        seconds = 00;
        minutes = minutes + 1;
    }
    //NSLog(@"%@",[NSString stringWithFormat:@"%.02d : %.02d : %.02d",hours,minutes,seconds]);
    NSString *str = [NSString stringWithFormat:@"%02d:%02d:%02d",hours,minutes,seconds]; //[NSString stringWithFormat:@"%02d:%02d:%02d", h, m, s]; 
  [fliper FlipToNumber:seconds];
    //  i=seconds;
    //   j=minutes;
    
   // [fliper1 FlipToNumber:j];
    //[fliper FlipToNumber:i];
    // NSLog(@"Mins : %d,Seconds: %d,I Value :%d,J value : %d",minutes,seconds,i,j);
    
    durationdifflabel.text = str;
   
    
    [self getFrequency];
    
    if(LastStartfromDB == nil)
    {
        frequencydifflabel.text = @"00:00:00";

    }
    else 
    {
      //  NSLog(@"LastStartfromDB : %@",LastStartfromDB);
        
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
        [dateFormat setDateFormat:@"HH:mm:ss"];

//        NSDate *date1 = [dateFormat dateFromString:LastStartfromDB];
//        
//        NSCalendar *calendar = [NSCalendar currentCalendar];
//        NSDateComponents *comps = [calendar components:NSYearCalendarUnit |
//                                   NSMonthCalendarUnit |
//                                   NSDayCalendarUnit |
//                                   NSHourCalendarUnit |
//                                   NSMinuteCalendarUnit
//                                              fromDate:[NSDate date]];
//        NSDateComponents *timeComps = [calendar components:NSHourCalendarUnit |
//                                       NSMinuteCalendarUnit
//                                                  fromDate:date1];
//        
//        [comps setHour:[timeComps hour]];
//        [comps setMinute:[timeComps minute]];
//        
//        NSDate *datetime = [calendar dateFromComponents:comps];
//        
//        NSLog(@"startDate : %@ & datetime : %@",startDate,datetime);
//        
//        NSString *dateString2 = [dateFormat stringFromDate:datetime];
//        NSLog(@"TestForstring timer in datetime : %@",dateString2);
//        
//        NSString *dateString1 = [dateFormat stringFromDate:startDate];
//        NSLog(@"startDate timer in datetime : %@",dateString1);
//
//        
//        NSTimeInterval secondsElapsed = [startDate timeIntervalSinceDate:datetime];
//        NSInteger hours = secondsElapsed / 3600;
//        NSInteger minutes = (secondsElapsed - (hours * 3600)) / 60;
//        NSInteger seconds = (int)secondsElapsed%60;
//        
//        NSLog(@"%@",[NSString stringWithFormat:@"%.02d : %.02d : %.02d",hours,minutes,seconds]);
//        NSString *str = [NSString stringWithFormat:@"%02d:%02d:%02d",hours,minutes,seconds]; //[NSString stringWithFormat:@"%02d:%02d:%02d", h, m, s]; 
//        //frequencydifflabel.text = str;
        
        NSDateFormatter *df = [[NSDateFormatter alloc] init];
        [df setDateFormat:@"HH:mm:ss"];
       
        NSDate *date11 = [df dateFromString:[dateFormat stringFromDate:startDate]];
        NSDate *date2 = [df dateFromString:LastStartfromDB];
        NSTimeInterval interval = [date11 timeIntervalSinceDate:date2];
        int hours1 = (int)interval / 3600;             // integer division to get the hours part
        int minutes1 = (interval - (hours1*3600)) / 60; // interval minus hours part (in seconds) divided by 60 yields minutes
        int s = ((NSUInteger) interval) % 60; 
        NSString *timeDiff = [NSString stringWithFormat:@"%02d:%02d:%02d", hours1, minutes1,s];
        
       // NSLog(@"Timediff : %@",timeDiff);

        frequencydifflabel.text = timeDiff;
    }

    
    [self storeTiming];
    [self getTimings];
    stopbutton.hidden = YES;
    startbutton.hidden = NO;
    starttimer = NO;
    i=0;
    j=0;
    minutestest = 0;
    secondstest = 0;
   // j=0;
   // NSLog(@"I VALUE:%d ,j value : %d",i,j);
    self.ShowTimerInfos = [Timerdb database].ShowTimerInfos;
    if(_ShowTimerInfos.count == 0)
    {
        tableview.hidden = YES;
        Clock_table.hidden = NO;
        durationdifflabel.hidden = NO;
        frequencydifflabel.hidden = NO;
        stopWatchLabel.hidden =NO;
        endstopwatchlabel.hidden =NO;
    }
    else {
        tableview.hidden = NO;
        Clock_table.hidden = YES;
        durationdifflabel.hidden = YES;
        frequencydifflabel.hidden = YES;
        stopWatchLabel.hidden =YES;
        endstopwatchlabel.hidden =YES;
    }

    [tableview reloadData];
}


#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // return [_failedBankInfos count];
    return [_ShowTimerInfos count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
//    if (cell == nil) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
//    }
//    
//    // Set up the cell...
//    // FailedBankInfo *info = [_failedBankInfos objectAtIndex:indexPath.row];
//    TimerInfo *timerinfo = [_ShowTimerInfos objectAtIndex:indexPath.row];
//    
//    cell.textLabel.text = timerinfo.starttime;
//    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@, %@", timerinfo.endtime, timerinfo.duration, timerinfo.frequency];
//	
//    return cell;
    
    TimerDisplayCell *cell =  (TimerDisplayCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell==nil) 
    {
        cell=[[TimerDisplayCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
    }
    cell.accessoryType=UITableViewCellAccessoryNone;
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
   
    TimerInfo *timerinfo = [_ShowTimerInfos objectAtIndex:indexPath.row];
    
    cell.startLabel.text = timerinfo.starttime; 
    cell.endLabel.text = timerinfo.endtime;
    cell.durationLabel.text = timerinfo.duration;
    cell.frequencyLabel.text = timerinfo.frequency;
    
    return cell;

}

//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    if (self.details == nil) {
//        self.details = [[[FailedBanksDetailViewController alloc] initWithNibName:@"FailedBanksDetailViewController" bundle:nil] autorelease];        
//    }
//    FailedBankInfo *info = [_failedBankInfos objectAtIndex:indexPath.row];
//    _details.uniqueId = info.uniqueId;
//    [self.navigationController pushViewController:_details animated:YES];
//}

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */


/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:YES];
 }   
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }   
 }
 */


/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */


/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */


- (IBAction)ContractionTimerinfoView:(id)sender
{
    ContractionTimerInfoViewController *ContractionTimerInfoView = [[ContractionTimerInfoViewController alloc] initWithNibName:@"ContractionTimerInfoViewController" bundle:nil];
    ContractionTimerInfoView.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentModalViewController:ContractionTimerInfoView animated:YES];
}

- (IBAction)showBirthplanView:(id)sender
{
    BirthplanViewController *BirthplanView = [[BirthplanViewController alloc] initWithNibName:@"BirthplanViewController" bundle:nil];
    BirthplanView.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentModalViewController:BirthplanView animated:YES];
}

- (IBAction)ToolsView:(id)sender
{
    ToolsViewController *ToolsView = [[ToolsViewController alloc] initWithNibName:@"ToolsViewController" bundle:nil];
    ToolsView.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentModalViewController:ToolsView animated:YES];
}
- (IBAction)FunView:(id)sender
{
    FunViewController *FunView = [[FunViewController alloc] initWithNibName:@"FunViewController" bundle:nil];
    FunView.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentModalViewController:FunView animated:YES];
}
- (IBAction)HelpView:(id)sender
{
    HelpViewController *HelpView = [[HelpViewController alloc] initWithNibName:@"HelpViewController" bundle:nil];
    HelpView.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentModalViewController:HelpView animated:YES];
}

@end
