//
//  myBirthplanViewController.h
//  Gurgle
//
//  Created by Dhanasekar Gunabalan on 6/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface myBirthplanViewController : UIViewController
{
    IBOutlet UIImageView *bottombanner;
    IBOutlet UIImageView *Topbanner;
    
}
- (IBAction)myBirthplanViewdone:(id)sender;
- (IBAction)showBirthplanInfoView:(id)sender;

- (IBAction)ToolsView:(id)sender;
- (IBAction)FunView:(id)sender;
- (IBAction)HelpView:(id)sender;
- (IBAction)showPart1DetailView:(id)sender;
- (IBAction)showPart2DetailView:(id)sender;
- (IBAction)showPart3DetailView:(id)sender;
- (IBAction)showPart4DetailView:(id)sender;

@end
