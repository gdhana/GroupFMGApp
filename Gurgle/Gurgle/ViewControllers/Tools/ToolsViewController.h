//
//  ToolsViewController.h
//  Gurgle
//
//  Created by Dhanasekar Gunabalan on 5/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ToolsViewController : UIViewController
{
    IBOutlet UIImageView *bottombanner;
    IBOutlet UIImageView *Topbanner;
}
- (IBAction)showToolsinfoView:(id)sender;
- (IBAction)showContractionView:(id)sender;
- (IBAction)showlabourbagchecklistView:(id)sender;
- (IBAction)shownewbornchecklistView:(id)sender;
- (IBAction)showmyVIPcommunityView:(id)sender;

- (IBAction)showMainmenuView:(id)sender;
- (IBAction)showBirthplanView:(id)sender;
- (IBAction)ToolsView:(id)sender;
- (IBAction)FunView:(id)sender;
- (IBAction)HelpView:(id)sender;

@end
