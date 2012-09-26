//
//  LabourbagchecklistViewController.h
//  Gurgle
//
//  Created by Dhanasekar Gunabalan on 6/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LabourbagchecklistViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>
{
    IBOutlet UIImageView *bottombanner;
    IBOutlet UITableView *tableview1;
    NSMutableArray *array;
    bool volUnitsSet[2];
    NSMutableArray *_selFlags;
}

@property (strong, nonatomic) IBOutlet UITableView *tableview1;
@property (nonatomic, copy) NSMutableArray *tableData;

- (IBAction)LabourbagchecklistinfoView:(id)sender;

- (IBAction)showBirthplanView:(id)sender;
- (IBAction)ToolsView:(id)sender;
- (IBAction)FunView:(id)sender;
- (IBAction)HelpView:(id)sender;

@end
