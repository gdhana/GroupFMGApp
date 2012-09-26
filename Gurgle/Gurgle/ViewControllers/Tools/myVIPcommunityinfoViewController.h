//
//  myVIPcommunityinfoViewController.h
//  Gurgle
//
//  Created by Dhanasekar Gunabalan on 6/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface myVIPcommunityinfoViewController : UIViewController
{
    IBOutlet UIImageView *bottombanner;
    IBOutlet UIImageView *Topbanner;
    
    IBOutlet UITextView *textview;
}
- (IBAction)myVIPcommunityinfoViewdone:(id)sender;

- (IBAction)showBirthplanView:(id)sender;
- (IBAction)ToolsView:(id)sender;
- (IBAction)FunView:(id)sender;
- (IBAction)HelpView:(id)sender;

@end
