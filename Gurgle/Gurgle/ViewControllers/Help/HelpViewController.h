//
//  HelpViewController.h
//  Gurgle
//
//  Created by Dhanasekar Gunabalan on 5/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HelpViewController : UIViewController
{
    IBOutlet UIImageView *bottombanner;
    IBOutlet UIImageView *Topbanner;
}
- (IBAction)showHelpinfoView:(id)sender;

- (IBAction)showMainmenuView:(id)sender;
- (IBAction)showBirthplanView:(id)sender;
- (IBAction)ToolsView:(id)sender;
- (IBAction)FunView:(id)sender;

- (IBAction)showGlossaryView:(id)sender;
- (IBAction)showFAQView:(id)sender;

@end
