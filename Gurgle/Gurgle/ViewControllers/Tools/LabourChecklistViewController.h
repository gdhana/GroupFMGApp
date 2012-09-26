//
//  LabourChecklistViewController.h
//  Gurgle
//
//  Created by Dhanasekar Gunabalan on 5/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LabourChecklistViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) NSMutableArray *names, *populations;
@property (strong, nonatomic) IBOutlet UITableView *mainTable;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *editingToggle;
@property (strong, nonatomic) NSIndexPath *lastIndexPath;

- (IBAction)toggleEdit:(id)sender;

- (IBAction)LabourChecklistdone:(id)sender;

@end
