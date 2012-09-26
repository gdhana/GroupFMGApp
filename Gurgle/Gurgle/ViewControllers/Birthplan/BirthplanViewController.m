//
//  BirthplanViewController.m
//  Gurgle
//
//  Created by Dhanasekar Gunabalan on 5/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BirthplanViewController.h"
#import "myBirthplanViewController.h"
#import "LabourbirthtipsViewController.h"
#import "BirthplaninfoViewController.h"

#import "MainmenuViewController.h"
#import "ToolsViewController.h"
#import "FunViewController.h"
#import "HelpViewController.h"
#include "GurgleAdViewController.h"

@interface BirthplanViewController ()

@end

@implementation BirthplanViewController

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
- (IBAction)showmyBirthplan:(id)sender
{
    myBirthplanViewController *myBirthplanView = [[myBirthplanViewController alloc] initWithNibName:@"myBirthplanViewController" bundle:nil];
    myBirthplanView.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentModalViewController:myBirthplanView animated:YES];
    //[self.view addSubview:questionnaire.view];
}
- (IBAction)showLabourBirthTips:(id)sender
{
    LabourbirthtipsViewController *Labourbirthtips = [[LabourbirthtipsViewController alloc] initWithNibName:@"LabourbirthtipsViewController" bundle:nil];
    Labourbirthtips.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentModalViewController:Labourbirthtips animated:YES];
    
}
- (IBAction)showToolsView:(id)sender
{
    ToolsViewController *ToolsView = [[ToolsViewController alloc] initWithNibName:@"ToolsViewController" bundle:nil];
    ToolsView.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentModalViewController:ToolsView animated:YES];
}
- (IBAction)showFunView:(id)sender
{
    FunViewController *FunView = [[FunViewController alloc] initWithNibName:@"FunViewController" bundle:nil];
    FunView.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentModalViewController:FunView animated:YES];
}
- (IBAction)showHelpView:(id)sender
{
    HelpViewController *HelpView = [[HelpViewController alloc] initWithNibName:@"HelpViewController" bundle:nil];
    HelpView.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentModalViewController:HelpView animated:YES];
}
- (IBAction)showMainmenuView:(id)sender
{
    MainmenuViewController *MainmenuView = [[MainmenuViewController alloc] initWithNibName:@"MainmenuViewController" bundle:nil];
    MainmenuView.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentModalViewController:MainmenuView animated:YES];
    //[self dismissModalViewControllerAnimated:YES];
}
- (IBAction)showBirthplanInfoView:(id)sender
{
    BirthplaninfoViewController *BirthplaninfoView = [[BirthplaninfoViewController alloc] initWithNibName:@"BirthplaninfoViewController" bundle:nil];
    BirthplaninfoView.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentModalViewController:BirthplaninfoView animated:YES];
}
@end
