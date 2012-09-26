//
//  myBirthplanViewController.m
//  Gurgle
//
//  Created by Dhanasekar Gunabalan on 6/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "myBirthplanViewController.h"
#import "BirthplanViewController.h"
#import "BirthplaninfoViewController.h"
#import "ToolsViewController.h"
#import "FunViewController.h"
#import "HelpViewController.h"
#import "Part1DetailViewController.h"
#import "Part2DetailViewController.h"
#import "Part3DetailViewController.h"
#import "Part4DetailViewController.h"

#import "GurgleAdViewController.h"

@interface myBirthplanViewController ()

@end

@implementation myBirthplanViewController

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
- (IBAction)myBirthplanViewdone:(id)sender
{
    BirthplanViewController *BirthplanView = [[BirthplanViewController alloc] initWithNibName:@"BirthplanViewController" bundle:nil];
    BirthplanView.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentModalViewController:BirthplanView animated:YES];
}

- (IBAction)showBirthplanInfoView:(id)sender
{
    BirthplaninfoViewController *BirthplaninfoView = [[BirthplaninfoViewController alloc] initWithNibName:@"BirthplaninfoViewController" bundle:nil];
    BirthplaninfoView.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentModalViewController:BirthplaninfoView animated:YES];
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

- (IBAction)showPart1DetailView:(id)sender
{
    Part1DetailViewController *Part1DetailView = [[Part1DetailViewController alloc] initWithNibName:@"Part1DetailViewController" bundle:nil];
    Part1DetailView.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentModalViewController:Part1DetailView animated:YES];
}

- (IBAction)showPart2DetailView:(id)sender
{
    Part2DetailViewController *Part2DetailView = [[Part2DetailViewController alloc] initWithNibName:@"Part2DetailViewController" bundle:nil];
    Part2DetailView.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentModalViewController:Part2DetailView animated:YES];
}
- (IBAction)showPart3DetailView:(id)sender
{
    Part3DetailViewController *Part3DetailView = [[Part3DetailViewController alloc] initWithNibName:@"Part3DetailViewController" bundle:nil];
    Part3DetailView.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentModalViewController:Part3DetailView animated:YES];
}
- (IBAction)showPart4DetailView:(id)sender
{
    Part4DetailViewController *Part4DetailView = [[Part4DetailViewController alloc] initWithNibName:@"Part4DetailViewController" bundle:nil];
    Part4DetailView.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentModalViewController:Part4DetailView animated:YES];
}
@end
