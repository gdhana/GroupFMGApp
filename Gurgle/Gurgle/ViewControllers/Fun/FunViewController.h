//
//  FunViewController.h
//  Gurgle
//
//  Created by Dhanasekar Gunabalan on 5/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FunViewController : UIViewController
{
    IBOutlet UIImageView *bottombanner;
    IBOutlet UIImageView *Topbanner;
    
}
- (IBAction)showFuninfoView:(id)sender;
- (IBAction)showQuiz1quesView:(id)sender;
- (IBAction)showQuiz2quesView:(id)sender;
- (IBAction)showQuiz3quesView:(id)sender;
- (IBAction)showQuiz4quesView:(id)sender;

- (IBAction)showMainmenuView:(id)sender;
- (IBAction)showBirthplanView:(id)sender;
- (IBAction)ToolsView:(id)sender;
- (IBAction)HelpView:(id)sender;

@end
