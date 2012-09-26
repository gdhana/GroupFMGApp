//
//  Quiz2quesViewController.m
//  Gurgle
//
//  Created by Dhanasekar Gunabalan on 6/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Quiz2quesViewController.h"
#import "Quiz2infoViewController.h"

#import "BirthplanViewController.h"
#import "ToolsViewController.h"
#import "FunViewController.h"
#import "HelpViewController.h"
#import "GurgleAdViewController.h"

@interface Quiz2quesViewController ()

@end
static int countQA1,countQB1;

@implementation Quiz2quesViewController

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
    Quizs2crollview.hidden = NO;
    Q2scrollview2.hidden = YES;
    [Q2scrollview2 setScrollEnabled:YES];
    Q2As.hidden = YES;
    // Do any additional setup after loading the view from its nib.
    [Quizs2crollview setScrollEnabled:YES];
    [Quizs2crollview setContentSize:CGSizeMake(320, 1220)];
    
    [Quizs2crollview flashScrollIndicators];
    countQA1 = 0;countQB1 = 0;count = 0;
}

- (void)viewDidUnload
{
    bottombanner = nil;
    Quizs2crollview = nil;
    Q1btn1 = nil;
    Q1btn2 = nil;
    Q2btn1 = nil;
    Q2btn2 = nil;
    Q3btn1 = nil;
    Q3btn2 = nil;
    Q4btn1 = nil;
    Q4btn2 = nil;
    Q5btn1 = nil;
    Q5btn2 = nil;
    Q6btn1 = nil;
    Q6btn2 = nil;
    Q7btn1 = nil;
    Q7btn2 = nil;
    Q8btn1 = nil;
    Q8btn2 = nil;

    Q2scrollview2 = nil;
    Q2As = nil;
    ResultTitlelbl = nil;
    ResultDesclbl = nil;
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

- (void)Quiz2ResultValidation{
    countQA1 = Q1A + Q2A + Q3A + Q4A + Q5A +Q6A + Q7A + Q8A;
    countQB1 = Q1B + Q2B + Q3B + Q4B + Q5B +Q6B + Q7B + Q8B;
    count = countQA1 + countQB1;
    if (count == 8) {
        if (countQA1 >= 5) {
            Quizs2crollview.hidden = YES;
            Q2scrollview2.hidden = NO;
          //  [Q2scrollview2 setContentSize:CGSizeMake(321, 400)];
           // CGRect rect = CGRectMake(16.0f, 1.0f, 281, 362);
            [Q2scrollview2 setContentSize:CGSizeMake(320, 565)];
            //Q2As.frame = rect;
            ResultTitlelbl.text = [NSString stringWithFormat:@"Mostly As"];
            ResultDesclbl.numberOfLines = 25;
            ResultDesclbl.text = [NSString stringWithFormat:@" You probably are in labour\nCongratulations, the labour you have waited so long for is probably finally happening. First labour can take several hours though, so you may still have to wait a while to meet your baby.\n Most women are told to stay at home during the early part of labour, until their irregular contractions are replaced by more consistent ones, which get stronger, come every five minutes, and last roughly 45-60 seconds.\n Remember though that if you’re unsure whether you’re in labour or not, or are experiencing any unexplained pain you should call your midwife immediately."];
            Q2As.image = [UIImage imageNamed:@"Q2As.png"];
            Q2As.hidden = NO;
            countQA1 = 0;
        }
        else if(countQB1 >= 5) {
            Quizs2crollview.hidden = YES;
            Q2scrollview2.hidden = NO;
           // [Q2scrollview2 setContentSize:CGSizeMake(321, 400)];
            //CGRect rect = CGRectMake(16.0f, 1.0f, 281, 319);
           // Q2As.frame = rect;
            [Q2scrollview2 setContentSize:CGSizeMake(320, 565)];
            ResultTitlelbl.text = [NSString stringWithFormat:@"Mostly Bs"];
            ResultDesclbl.numberOfLines = 25;
            ResultDesclbl.text = [NSString stringWithFormat:@" You probably aren’t in labour\nSadly you aren’t experiencing enough labour symptoms to be in established labour, and may have to wait a little while longer to meet your baby.\n If you are experiencing the milder signs, such as the nesting instinct and Braxton Hicks contractions you'll be able to carry on with your daily life for a while without too much discomfort , so make the most of resting whilst you can.\n Remember that if you’re unsure whether you’re in labour or not, or are experiencing any unexplained pain you should call your midwife immediately."];
            Q2As.image = [UIImage imageNamed:@"Q2Bs.png"];
            Q2As.hidden = NO;
            countQB1 = 0;
        }
        else if(countQA1 == 4 && countQB1 == 4) {
            Quizs2crollview.hidden = YES;
            Q2scrollview2.hidden = NO;
           // [Q2scrollview2 setContentSize:CGSizeMake(321, 700)];
            //CGRect rect = CGRectMake(0.0f, 0.0f, 320, 1000);
            //Q2As.frame = rect;
            [Q2scrollview2 setContentSize:CGSizeMake(320, 1005)];
            ResultTitlelbl.text = [NSString stringWithFormat:@"Mostly As & Bs"];
            ResultDesclbl.frame = CGRectMake(20, 134, 281, 846);
            ResultDesclbl.numberOfLines = 50;
            ResultDesclbl.text = [NSString stringWithFormat:@"Mostly As :\n You probably are in labour\nCongratulations, the labour you have waited so long for is probably finally happening. First labour can take several hours though, so you may still have to wait a while to meet your baby.\n Most women are told to stay at home during the early part of labour, until their irregular contractions are replaced by more consistent ones, which get stronger, come every five minutes, and last roughly 45-60 seconds.\n Remember though that if you’re unsure whether you’re in labour or not, or are experiencing any unexplained pain you should call your midwife immediately.\n\nMostly Bs :\n You probably aren’t in labour\nSadly you aren’t experiencing enough labour symptoms to be in established labour, and may have to wait a little while longer to meet your baby.\n If you are experiencing the milder signs, such as the nesting instinct and Braxton Hicks contractions you'll be able to carry on with your daily life for a while without too much discomfort , so make the most of resting whilst you can.\n Remember that if you’re unsure whether you’re in labour or not, or are experiencing any unexplained pain you should call your midwife immediately."];
            Q2As.image = [UIImage imageNamed:@"Q2As&Bs.png"];
            Q2As.hidden = NO;
            countQB1 = 0;
        }

        else {
            //NSLog(@"Nothing");
        }
    }
    if (count == 8) {
        
        //  NSLog(@"Nothing");
    }
    else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Quiz Alert" message:@"please answer all the questions" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }

}
- (IBAction)Q1btn1:(id)sender {
    if (checkboxSelected1 == 0){
		[Q1btn1 setSelected:YES];
        [Q1btn2 setSelected:NO];
        Q1A = 1;Q1B = 0;
        //[self Quiz2ResultValidation];
        
	} 
}

- (IBAction)Q1btn2:(id)sender {
    if (checkboxSelected1 == 0){
		[Q1btn2 setSelected:YES];
        [Q1btn1 setSelected:NO];
        Q1A = 0;Q1B = 1;
        //[self Quiz2ResultValidation];
	} 
}

- (IBAction)Q2btn1:(id)sender {
    if (checkboxSelected2 == 0){
		[Q2btn1 setSelected:YES];
        [Q2btn2 setSelected:NO];
        Q2A = 1;Q2B = 0;
        //[self Quiz2ResultValidation];
	} 
}

- (IBAction)Q2btn2:(id)sender {
    if (checkboxSelected2 == 0){
		[Q2btn2 setSelected:YES];
        [Q2btn1 setSelected:NO];
        Q2A = 0;Q2B = 1;
        //[self Quiz2ResultValidation];
	} 
}

- (IBAction)Q3btn1:(id)sender {
    if (checkboxSelected3 == 0){
		[Q3btn1 setSelected:YES];
        [Q3btn2 setSelected:NO];
        Q3A = 1;Q3B = 0;
        //[self Quiz2ResultValidation];
	} 
}

- (IBAction)Q3btn2:(id)sender {
    if (checkboxSelected3 == 0){
		[Q3btn2 setSelected:YES];
        [Q3btn1 setSelected:NO];
        Q3A = 0;Q3B = 1;
        //[self Quiz2ResultValidation];
	} 
}

- (IBAction)Q4btn1:(id)sender {
    if (checkboxSelected4 == 0){
		[Q4btn1 setSelected:YES];
        [Q4btn2 setSelected:NO];
        Q4A = 1;Q4B = 0;
        //[self Quiz2ResultValidation];
	} 
}

- (IBAction)Q4btn2:(id)sender {
    if (checkboxSelected4 == 0){
		[Q4btn2 setSelected:YES];
        [Q4btn1 setSelected:NO];
        Q4A = 0;Q4B = 1;
        //[self Quiz2ResultValidation];
	} 
}

- (IBAction)Q5btn1:(id)sender {
    if (checkboxSelected5 == 0){
		[Q5btn1 setSelected:YES];
        [Q5btn2 setSelected:NO];
        Q5A = 1;Q5B = 0;
        //[self Quiz2ResultValidation];
	} 
}

- (IBAction)Q5btn2:(id)sender {
    if (checkboxSelected5 == 0){
		[Q5btn2 setSelected:YES];
        [Q5btn1 setSelected:NO];
        Q5A = 0;Q5B = 1;
        //[self Quiz2ResultValidation];
	} 
}

- (IBAction)Q6btn1:(id)sender {
    if (checkboxSelected6 == 0){
		[Q6btn1 setSelected:YES];
        [Q6btn2 setSelected:NO];
        Q6A = 1;Q6B = 0;
        //[self Quiz2ResultValidation];
	} 
}

- (IBAction)Q6btn2:(id)sender {
    if (checkboxSelected6 == 0){
		[Q6btn2 setSelected:YES];
        [Q6btn1 setSelected:NO];
        Q6A = 0;Q6B = 1;
        //[self Quiz2ResultValidation];
	} 
}

- (IBAction)Q7btn1:(id)sender {
    if (checkboxSelected7 == 0){
		[Q7btn1 setSelected:YES];
        [Q7btn2 setSelected:NO];
        Q7A = 1;Q7B = 0;
        //[self Quiz2ResultValidation];
	} 
}

- (IBAction)Q7btn2:(id)sender {
    if (checkboxSelected7 == 0){
		[Q7btn2 setSelected:YES];
        [Q7btn1 setSelected:NO];
        Q7A = 0;Q7B = 1;
        //[self Quiz2ResultValidation];
	} 
}

- (IBAction)Q8btn1:(id)sender {
    if (checkboxSelected8 == 0){
		[Q8btn1 setSelected:YES];
        [Q8btn2 setSelected:NO];
        Q8A = 1;Q8B = 0;
        //[self Quiz2ResultValidation];
	} 
}

- (IBAction)Q8btn2:(id)sender {
    if (checkboxSelected8 == 0){
		[Q8btn2 setSelected:YES];
        [Q8btn1 setSelected:NO];
        Q8A = 0;Q8B = 1;
        //[self Quiz2ResultValidation];
	} 
}

- (IBAction)Quiz2ValidateResults:(id)sender {
    [self Quiz2ResultValidation];
}



- (IBAction)showQuiz2infoView:(id)sender
{
    Quiz2infoViewController *Quiz2infoView = [[Quiz2infoViewController alloc] initWithNibName:@"Quiz2infoViewController" bundle:nil];
    Quiz2infoView.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentModalViewController:Quiz2infoView animated:YES];
    //[self.view addSubview:questionnaire.view];
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

@end
