//
//  ContractionTimerpauseViewController.h
//  Gurgle
//
//  Created by Dhanasekar Gunabalan on 6/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "sqlite3.h"
#import "MyDelegateHelper.h"

@class FlipTensDigit;

@interface ContractionTimerpauseViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>
{
    
    IBOutlet UIImageView *bottombanner;
    IBOutlet UIImageView *Topbanner;
    
    IBOutlet UIScrollView *scrollview;
    UILabel *stopWatchLabel;
    
    NSTimer *stopWatchTimer; // Store the timer that fires after a certain time
    NSTimer *stopWatchTimer1; // Store the timer that fires after a certain time
    NSDate *startDate,*endDate; // Stores the date of the click on the start button
    
    NSTimeInterval secondsAlreadyRun;
    NSString *databasePath;
    sqlite3 *timingsDatabase;
    IBOutlet UIButton *startbutton;
    IBOutlet UIButton *stopbutton;
    
    NSMutableArray * imagesTop;
    NSMutableArray * imagesBottom;
    
    FlipTensDigit * fliper ;
    FlipTensDigit * fliper1 ;
    BOOL starttimer;
    
    sqlite3 * db;

    IBOutlet UITableView *tableview;
    NSArray *_ShowTimerInfos;
}

@property (nonatomic, retain) IBOutlet UIImageView *Clock_table;


@property (nonatomic, retain) NSArray *ShowTimerInfos;


@property (strong, nonatomic) IBOutlet UITableView *tableview;

//@property(nonatomic,retain) UITableView *ContractionTableView;
@property (nonatomic, retain) IBOutlet UILabel *stopWatchLabel;
@property (nonatomic, retain) IBOutlet UILabel *endstopwatchlabel;
@property (nonatomic, retain) IBOutlet UILabel *durationdifflabel;
@property (nonatomic, retain) IBOutlet UILabel *frequencydifflabel;

- (IBAction)onStartPressed:(id)sender;
- (IBAction)onStopPressed:(id)sender;


- (IBAction)ContractionTimerinfoView:(id)sender;

- (IBAction)showBirthplanView:(id)sender;
- (IBAction)ToolsView:(id)sender;
- (IBAction)FunView:(id)sender;
- (IBAction)HelpView:(id)sender;

@end
