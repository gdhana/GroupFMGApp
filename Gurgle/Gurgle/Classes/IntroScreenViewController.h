//
//  IntroScreenViewController.h
//  Gurgle
//
//  Created by Dhanasekar Gunabalan on 6/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IntroScreenViewController : UIViewController
{
    IBOutlet UIImageView *bottombanner;
}
- (IBAction)BirthplanView:(id)sender;
- (IBAction)ToolsView:(id)sender;
- (IBAction)FunView:(id)sender;
- (IBAction)HelpView:(id)sender;
- (IBAction)InfoView:(id)sender;

@end
