//
//  HelpinfoViewController.h
//  Gurgle
//
//  Created by Dhanasekar Gunabalan on 6/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HelpinfoViewController : UIViewController
{
    
    IBOutlet UIImageView *bottombanner;
    IBOutlet UIImageView *Topbanner;
}
- (IBAction)Helpinfodone:(id)sender;

- (IBAction)showBirthplanView:(id)sender;
- (IBAction)ToolsView:(id)sender;
- (IBAction)FunView:(id)sender;
- (IBAction)HelpView:(id)sender;


@end
