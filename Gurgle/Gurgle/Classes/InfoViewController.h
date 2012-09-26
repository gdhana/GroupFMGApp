//
//  InfoViewController.h
//  Gurgle
//
//  Created by Dhanasekar Gunabalan on 6/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InfoViewController : UIViewController
{
    IBOutlet UIScrollView *scrollview;
    IBOutlet UITextView *textview;
    IBOutlet UIImageView *bottombanner;
    IBOutlet UIImageView *Topbanner;
    
}

- (IBAction)BirthplanView:(id)sender;
- (IBAction)ToolsView:(id)sender;
- (IBAction)FunView:(id)sender;
- (IBAction)HelpView:(id)sender;
- (IBAction)Back2home:(id)sender;

@end
