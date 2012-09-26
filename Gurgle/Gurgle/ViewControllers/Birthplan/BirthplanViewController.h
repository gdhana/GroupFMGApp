//
//  BirthplanViewController.h
//  Gurgle
//
//  Created by Dhanasekar Gunabalan on 5/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BirthplanViewController : UIViewController
{
    IBOutlet UIImageView *bottombanner;
    IBOutlet UIImageView *Topbanner;
}

- (IBAction)showmyBirthplan:(id)sender;
- (IBAction)showLabourBirthTips:(id)sender;

- (IBAction)showToolsView:(id)sender;
- (IBAction)showFunView:(id)sender;
- (IBAction)showHelpView:(id)sender;
- (IBAction)showMainmenuView:(id)sender;
- (IBAction)showBirthplanInfoView:(id)sender;

@end
