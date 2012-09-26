//
//  LabourbirthtipsViewController.h
//  Gurgle
//
//  Created by Dhanasekar Gunabalan on 5/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "sqlite3.h"
#import "WeekView.h"

@interface LabourbirthtipsViewController : UIViewController <UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>
{
    IBOutlet UIImageView *bottombanner;
    IBOutlet UIImageView *Topbanner;
   // sqlite3 * db;
    
    IBOutlet UITableView *tableview;
    NSArray *_AllweekInfos;
    NSArray *_weeknumberInfos;
    NSString *databasePath;
    sqlite3 *timingsDatabase;
    IBOutlet UITextField *searchTextField;
    WeekView* wview;
}

@property (strong, nonatomic) IBOutlet UITableView *tableview;
@property (nonatomic, retain) NSArray *AllweekInfos;
@property (nonatomic, retain) NSArray *weeknumberInfos;
@property (nonatomic, retain) IBOutlet UITextField *searchTextField;

- (IBAction)Labourbirthtipsdone:(id)sender;
- (IBAction)showLabourbirthtipsView:(id)sender;

- (IBAction)showBirthplanView:(id)sender;
- (IBAction)ToolsView:(id)sender;
- (IBAction)FunView:(id)sender;
- (IBAction)HelpView:(id)sender;

@end
