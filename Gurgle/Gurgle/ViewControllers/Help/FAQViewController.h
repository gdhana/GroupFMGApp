//
//  FAQViewController.h
//  Gurgle
//
//  Created by Dhanasekar Gunabalan on 5/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FAQViewController : UIViewController
{
    UIWebView *webView;
    IBOutlet UIImageView *bottombanner;
    IBOutlet UIImageView *Topbanner;
}

@property (nonatomic, retain) IBOutlet UIWebView *webView;

-(void) loadPage;

- (IBAction)showHelpinfoView:(id)sender;
- (IBAction)FAQViewdone:(id)sender;

- (IBAction)showBirthplanView:(id)sender;
- (IBAction)ToolsView:(id)sender;
- (IBAction)FunView:(id)sender;
- (IBAction)HelpView:(id)sender;

@end
