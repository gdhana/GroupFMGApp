//
//  FunViewController.m
//  Gurgle
//
//  Created by Dhanasekar Gunabalan on 5/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FunViewController.h"
#import "FuninfoViewController.h"
#import "Quiz1questViewController.h"
#import "Quiz2quesViewController.h"
#import "Quiz3quesViewController.h"
#import "Quiz4questViewController.h"

#import "MainmenuViewController.h"
#import "BirthplanViewController.h"
#import "ToolsViewController.h"
#import "FunViewController.h"
#import "HelpViewController.h"
#import "GurgleAdViewController.h"


@interface FunViewController ()

@end

@implementation FunViewController

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
- (IBAction)showQuiz1quesView:(id)sender
{
    Quiz1questViewController *Quiz1questView = [[Quiz1questViewController alloc] initWithNibName:@"Quiz1questViewController" bundle:nil];
    Quiz1questView.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentModalViewController:Quiz1questView animated:YES];
}
- (IBAction)showQuiz2quesView:(id)sender
{
    Quiz2quesViewController *Quiz2quesView = [[Quiz2quesViewController alloc] initWithNibName:@"Quiz2quesViewController" bundle:nil];
    Quiz2quesView.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentModalViewController:Quiz2quesView animated:YES];
}
- (IBAction)showQuiz3quesView:(id)sender
{
    Quiz3quesViewController *Quiz3quesView = [[Quiz3quesViewController alloc] initWithNibName:@"Quiz3quesViewController" bundle:nil];
    Quiz3quesView.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentModalViewController:Quiz3quesView animated:YES];
}
- (IBAction)showQuiz4quesView:(id)sender
{
    Quiz4questViewController *Quiz4questView = [[Quiz4questViewController alloc] initWithNibName:@"Quiz4questViewController" bundle:nil];
    Quiz4questView.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentModalViewController:Quiz4questView animated:YES];
}

- (IBAction)showFuninfoView:(id)sender
{
    FuninfoViewController *FuninfoView = [[FuninfoViewController alloc] initWithNibName:@"FuninfoViewController" bundle:nil];
    FuninfoView.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentModalViewController:FuninfoView animated:YES];
}

- (IBAction)showMainmenuView:(id)sender
{
    MainmenuViewController *MainmenuView = [[MainmenuViewController alloc] initWithNibName:@"MainmenuViewController" bundle:nil];
    MainmenuView.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentModalViewController:MainmenuView animated:YES];
    //[self dismissModalViewControllerAnimated:YES];
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
- (IBAction)HelpView:(id)sender
{
    HelpViewController *HelpView = [[HelpViewController alloc] initWithNibName:@"HelpViewController" bundle:nil];
    HelpView.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentModalViewController:HelpView animated:YES];
}

@end
