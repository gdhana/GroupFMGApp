//
//  GurgleItemsViewController.h
//  Gurgle
//
//  Created by Dhanasekar Gunabalan on 7/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Dfetch.h"

@interface GurgleItemsViewController : UIViewController  <UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate>
{
     IBOutlet UIImageView *bottombanner;
    Dfetch *dao;
    IBOutlet UITableView *tableview;
    NSMutableArray *labels;
    NSMutableArray *values;
}

@property (retain, nonatomic) IBOutlet UITableView *tableview;

- (IBAction)showHelpinfoView:(id)sender;
- (IBAction)GlossaryViewdone:(id)sender;

- (IBAction)showBirthplanView:(id)sender;
- (IBAction)ToolsView:(id)sender;
- (IBAction)FunView:(id)sender;
- (IBAction)HelpView:(id)sender;
@end
