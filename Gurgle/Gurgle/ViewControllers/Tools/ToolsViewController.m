//
//  ToolsViewController.m
//  Gurgle
//
//  Created by Dhanasekar Gunabalan on 5/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ToolsViewController.h"
#import "ToolsinfoViewController.h"
#import "ContractionTimerpauseViewController.h"
#import "LabourbagchecklistViewController.h"
#import "newbornchecklistViewController.h"
#import "myVIPcommunityViewController.h"

#import "MainmenuViewController.h"
#import "BirthplanViewController.h"
#import "ToolsViewController.h"
#import "FunViewController.h"
#import "HelpViewController.h"
#import "GurgleAdViewController.h"

#import "LabourbagcheckViewController.h"
#import "newborncheckViewController.h"

@interface ToolsViewController ()

@end

@implementation ToolsViewController

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
}

- (void)viewDidUnload
{
    bottombanner = nil;
    Topbanner = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
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
- (IBAction)showToolsinfoView:(id)sender
{
    ToolsinfoViewController *ToolsinfoView = [[ToolsinfoViewController alloc] initWithNibName:@"ToolsinfoViewController" bundle:nil];
    ToolsinfoView.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentModalViewController:ToolsinfoView animated:YES];
}
- (IBAction)showMainmenuView:(id)sender
{
    MainmenuViewController *MainmenuView = [[MainmenuViewController alloc] initWithNibName:@"MainmenuViewController" bundle:nil];
    MainmenuView.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentModalViewController:MainmenuView animated:YES];
    //[self dismissModalViewControllerAnimated:YES];
}

- (IBAction)showContractionView:(id)sender
{
    ContractionTimerpauseViewController *ContractionTimerView = [[ContractionTimerpauseViewController alloc] initWithNibName:@"ContractionTimerpauseViewController" bundle:nil];
    ContractionTimerView.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentModalViewController:ContractionTimerView animated:YES];
}
- (IBAction)showlabourbagchecklistView:(id)sender
{
    LabourbagcheckViewController *Labourbagcheck = [[LabourbagcheckViewController alloc] initWithNibName:@"LabourbagcheckViewController" bundle:nil];
    Labourbagcheck.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentModalViewController:Labourbagcheck animated:YES];
    
//    LabourbagchecklistViewController *LabourbagchecklistView = [[LabourbagchecklistViewController alloc] initWithNibName:@"LabourbagchecklistViewController" bundle:nil];
//    LabourbagchecklistView.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
//    [self presentModalViewController:LabourbagchecklistView animated:YES];
}
- (IBAction)shownewbornchecklistView:(id)sender{
    newborncheckViewController *newbornchecklistView = [[newborncheckViewController alloc] initWithNibName:@"newborncheckViewController" bundle:nil];
    newbornchecklistView.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentModalViewController:newbornchecklistView animated:YES];
//    newbornchecklistViewController *newbornchecklistView = [[newbornchecklistViewController alloc] initWithNibName:@"newbornchecklistViewController" bundle:nil];
//    newbornchecklistView.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
//    [self presentModalViewController:newbornchecklistView animated:YES];
}
- (IBAction)showmyVIPcommunityView:(id)sender
{
    myVIPcommunityViewController *myVIPcommunityView = [[myVIPcommunityViewController alloc] initWithNibName:@"myVIPcommunityViewController" bundle:nil];
    myVIPcommunityView.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentModalViewController:myVIPcommunityView animated:YES];
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
