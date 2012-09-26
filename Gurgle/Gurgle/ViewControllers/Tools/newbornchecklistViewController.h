//
//  newbornchecklistViewController.h
//  Gurgle
//
//  Created by Dhanasekar Gunabalan on 6/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface newbornchecklistViewController : UIViewController <UITextFieldDelegate>
{
    
    IBOutlet UIImageView *bottombanner;
    IBOutlet UITableView *tableview3;
     NSMutableArray *_selFlags;
}
@property (strong, nonatomic) IBOutlet UITableView *tableview3;
@property (nonatomic, copy) NSMutableArray *tableData;
@property (nonatomic, retain) UIActivityIndicatorView *activityIndicator;

- (IBAction)newbornchecklistinfoView:(id)sender;

- (IBAction)showBirthplanView:(id)sender;
- (IBAction)ToolsView:(id)sender;
- (IBAction)FunView:(id)sender;
- (IBAction)HelpView:(id)sender;

@end
