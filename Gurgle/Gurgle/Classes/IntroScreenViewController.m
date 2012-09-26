//
//  IntroScreenViewController.m
//  Gurgle
//
//  Created by Dhanasekar Gunabalan on 6/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
//448-320 = 128
//645-480 = 165
#import "IntroScreenViewController.h"
#import "BirthplanViewController.h"
#import "ToolsViewController.h"
#import "FunViewController.h"
#import "HelpViewController.h"
#import "InfoViewController.h"
#include "GurgleAdViewController.h"

//gulsoom

@interface IntroScreenViewController ()

@end

@implementation IntroScreenViewController

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
        //[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.huggiesclub.co.uk/products/nappies/newborn"]];
    }
}
- (IBAction)BirthplanView:(id)sender
{
    BirthplanViewController *BirthplanView = [[BirthplanViewController alloc] initWithNibName:@"BirthplanViewController" bundle:nil];
    BirthplanView.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentModalViewController:BirthplanView animated:YES];
    //[self.view addSubview:questionnaire.view];
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
- (IBAction)InfoView:(id)sender
{
    InfoViewController *InfoView = [[InfoViewController alloc] initWithNibName:@"InfoViewController" bundle:nil];
    InfoView.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentModalViewController:InfoView animated:YES];
    
}

@end
