//
//  GurgleAdViewController.h
//  Gurgle
//
//  Created by Dhanasekar Gunabalan on 9/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GurgleAdViewController : UIViewController
{
    
    IBOutlet UIWebView *webview;
    NSString *urlString,*title;
    IBOutlet UINavigationItem *bannertitle;
}

- (IBAction)Adviewdone:(id)sender;
- (id)initWithNibName:(NSString *)nibName bundle:(NSBundle *)nibBundle urlString:(NSString *)URLString title:(NSString *)Title;
@end
