//
//  ContractionTimerInfoViewController.h
//  Gurgle
//
//  Created by Dhanasekar Gunabalan on 6/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContractionTimerInfoViewController : UIViewController
{
    IBOutlet UIImageView *bottombanner;
    IBOutlet UIImageView *Topbanner;
    
}
- (IBAction)ContractionTimerInfoViewdone:(id)sender;

- (IBAction)showBirthplanView:(id)sender;
- (IBAction)ToolsView:(id)sender;
- (IBAction)FunView:(id)sender;
- (IBAction)HelpView:(id)sender;

@end
