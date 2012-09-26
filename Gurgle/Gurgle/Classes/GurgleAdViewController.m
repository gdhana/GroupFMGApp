//
//  GurgleAdViewController.m
//  Gurgle
//
//  Created by Dhanasekar Gunabalan on 9/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GurgleAdViewController.h"

@interface GurgleAdViewController ()

@end
NSString *url,*navtitle;
@implementation GurgleAdViewController

- (id)initWithNibName:(NSString *)nibName bundle:(NSBundle *)nibBundle urlString:(NSString *)URLString title:(NSString *)Title
{
    //self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self = [super initWithNibName:nibName bundle:nibBundle]) {
       // urlString = [URLString copy];
       url = URLString;
        navtitle = Title;
         //[webview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:URLString]]];
    }
    if (self) {
        // Custom initialization
       
    }
    return self;
}

- (void)viewDidLoad
{
    bannertitle.title = navtitle;
    [webview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url]]];
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    webview = nil;
    bannertitle = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)Adviewdone:(id)sender {
    
    [self dismissModalViewControllerAnimated:YES];
}
@end
