//
//  FAQViewController.m
//  Gurgle
//
//  Created by Dhanasekar Gunabalan on 5/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FAQViewController.h"
#import "HelpinfoViewController.h"

#import "BirthplanViewController.h"
#import "ToolsViewController.h"
#import "FunViewController.h"
#import "HelpViewController.h"
#import "GurgleAdViewController.h"

@interface FAQViewController ()

@end

@implementation FAQViewController
@synthesize webView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
//    bottombanner.animationImages = [NSArray arrayWithObjects: 
//                                    [UIImage imageNamed:@"huggies_banner.png"],                              
//                                    [UIImage imageNamed:@"Banner1.jpg"],[UIImage imageNamed:@"Banner2.jpg"],[UIImage imageNamed:@"Banner3.jpg"],[UIImage imageNamed:@"Banner4.jpg"],[UIImage imageNamed:@"Banner5.jpg"], nil];
//    bottombanner.animationDuration = 25.0; // seconds
//    bottombanner.animationRepeatCount = 0; //0 loops for ever/noted
//    [bottombanner startAnimating];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self loadPage];
}

- (void)viewDidUnload
{
    webView = nil;
    [self setWebView:nil];
    bottombanner = nil;
    Topbanner = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

-(void) loadPage {
    NSURL* url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"FAQ" ofType:@"html"]];
    [self.webView loadRequest:[NSURLRequest requestWithURL:url]];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    if ([touch view] == bottombanner){
        GurgleAdViewController *GurgleAdView = [[GurgleAdViewController alloc] initWithNibName:@"GurgleAdViewController" bundle:nil urlString:@"http://www.huggiesclub.co.uk/products/nappies/newborn" title:@"Huggies"];
        GurgleAdView.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        [self presentModalViewController:GurgleAdView animated:NO];
    }
    if ([touch view] == Topbanner){
        GurgleAdViewController *GurgleAdView = [[GurgleAdViewController alloc] initWithNibName:@"GurgleAdViewController" bundle:nil urlString:@"http://www.gurgle.com" title:@"Gurgle"];
        GurgleAdView.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        [self presentModalViewController:GurgleAdView animated:NO];
    }
}
- (IBAction)showHelpinfoView:(id)sender
{
    HelpinfoViewController *HelpinfoView = [[HelpinfoViewController alloc] initWithNibName:@"HelpinfoViewController" bundle:nil];
    HelpinfoView.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentModalViewController:HelpinfoView animated:YES];
}
- (IBAction)FAQViewdone:(id)sender
{
    [self dismissModalViewControllerAnimated:YES];
}
- (IBAction)showBirthplanView:(id)sender
{
    BirthplanViewController *BirthplanView = [[BirthplanViewController alloc] initWithNibName:@"BirthplanViewController" bundle:nil];
    BirthplanView.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentModalViewController:BirthplanView animated:YES];
}

- (IBAction)ToolsView:(id)sender
{
    ToolsViewController *ToolsView = [[ToolsViewController alloc] initWithNibName:@"ToolsViewController" bundle:nil];
    ToolsView.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentModalViewController:ToolsView animated:YES];
}
- (IBAction)FunView:(id)sender
{
    FunViewController *FunView = [[FunViewController alloc] initWithNibName:@"FunViewController" bundle:nil];
    FunView.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentModalViewController:FunView animated:YES];
}
- (IBAction)HelpView:(id)sender
{
    HelpViewController *HelpView = [[HelpViewController alloc] initWithNibName:@"HelpViewController" bundle:nil];
    HelpView.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentModalViewController:HelpView animated:YES];
}

@end
