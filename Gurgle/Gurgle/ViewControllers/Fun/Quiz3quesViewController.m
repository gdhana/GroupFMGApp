//
//  Quiz3quesViewController.m
//  Gurgle
//
//  Created by Dhanasekar Gunabalan on 6/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Quiz3quesViewController.h"
#import "Quiz3infoViewController.h"

#import "BirthplanViewController.h"
#import "ToolsViewController.h"
#import "FunViewController.h"
#import "HelpViewController.h"
#import "GurgleAdViewController.h"

@interface Quiz3quesViewController ()

@end

static int countQA1,countQB1,countQC1,count;

@implementation Quiz3quesViewController

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
    Quizs3crollview.hidden = NO;
    Q3scrollview2.hidden = YES;
    [Q3scrollview2 setScrollEnabled:YES];
    Q3As.hidden = YES;

    // Do any additional setup after loading the view from its nib.
    [Quizs3crollview setScrollEnabled:YES];
    [Quizs3crollview setContentSize:CGSizeMake(320, 1650)];
    [Quizs3crollview flashScrollIndicators];
    countQA1 = 0;countQB1 = 0;countQC1 = 0;count = 0;
    
}

- (void)viewDidUnload
{
    bottombanner = nil;
    Quizs3crollview = nil;
    Q1btn1 = nil;
    Q1btn2 = nil;
    Q1btn3 = nil;
    Q2btn1 = nil;
    Q2btn2 = nil;
    Q2btn3 = nil;
    Q3btn1 = nil;
    Q3btn2 = nil;
    Q3btn3 = nil;
    Q4btn1 = nil;
    Q4btn2 = nil;
    Q4btn3 = nil;
    Q5btn1 = nil;
    Q5btn2 = nil;
    Q5btn3 = nil;
    Q6btn1 = nil;
    Q6btn2 = nil;
    Q6btn3 = nil;
    Q7btn1 = nil;
    Q7btn2 = nil;
    Q7btn3 = nil;

    
    Q3scrollview2 = nil;
    Q3As = nil;
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

- (void)QuestionResultValidation
{
    countQA1 = Q1A + Q2A + Q3A + Q4A + Q5A +Q6A + Q7A;
    countQB1 = Q1B + Q2B + Q3B + Q4B + Q5B +Q6B + Q7B;
    countQC1 = Q1C + Q2C + Q3C + Q4C + Q5C +Q6C + Q7C;
    count = countQA1 + countQB1 +countQC1;
    if(count == 7){
        if (countQA1 == 7 || countQA1 == 6 || countQA1 == 5 || countQA1 == 4) {
            Quizs3crollview.hidden = YES;
            Q3scrollview2.hidden = NO;
            //        CGRect rect = CGRectMake(16.0f, 52.0f, 293, 247);
            //        Q1As.frame = rect;
            
            [Q3scrollview2 setContentSize:CGSizeMake(320, 315)];
            ResultTitlelbl.text = [NSString stringWithFormat:@"Mostly As"];
            ResultDesclbl.frame = CGRectMake(16, 131, 288, 164);
            ResultDesclbl.numberOfLines = 8;
            ResultDesclbl.text = [NSString stringWithFormat:@" You are going to be laid back parents.Relaxing is great,because it means you won’t get stressed when things don’t go to plan.But don’t forget that sometimes a little structure and routine can help your newborn understand what kind of behaviour you expect from them."];
            Q3As.image = [UIImage imageNamed:@"Q3As.png"];
            Q3As.hidden = NO;
            countQA1 = 0;
        }
        else if(countQB1 == 7 || countQB1 == 6 || countQB1 == 5 || countQB1 == 4) {
            Quizs3crollview.hidden = YES;
            Q3scrollview2.hidden = NO;
            [Q3scrollview2 setContentSize:CGSizeMake(320, 315)];
            ResultTitlelbl.text = [NSString stringWithFormat:@"Mostly Bs"];
            ResultDesclbl.frame = CGRectMake(16, 131, 288, 164);
            ResultDesclbl.numberOfLines = 8;
        ResultDesclbl.text = [NSString stringWithFormat:@" You have very different attitudes to parenting.You and your partner haven’t decided what your combined parenting style will be yet.Don’t worry: you’ll get there in the end! Try to take the time to sit down and talk about different parenting styles until you find a compromise."];
            Q3As.image = [UIImage imageNamed:@"Q3Bs.png"];
            Q3As.hidden = NO;
            countQB1 = 0;
        }
        else if(countQC1 == 7 || countQC1 == 6 || countQC1 == 5 || countQC1 == 4) {
            Quizs3crollview.hidden = YES;
            Q3scrollview2.hidden = NO;
            [Q3scrollview2 setContentSize:CGSizeMake(320, 355)];
            ResultTitlelbl.text = [NSString stringWithFormat:@"Mostly Cs"];
            ResultDesclbl.frame = CGRectMake(16, 131, 288, 208);
            ResultDesclbl.numberOfLines = 10;
            ResultDesclbl.text = [NSString stringWithFormat:@" You are going to be organised parents.You understand the importance of getting your baby into a routine, and you have approached your pregnancy with meticulous planning.This is brilliant, but try to remember to relax and go with the flow: sometimes newborns don’t fit in with your plans, no matter how well thought out they are."];
            Q3As.image = [UIImage imageNamed:@"Q3Cs.png"];
            Q3As.hidden = NO;
            countQC1 = 0;
        }
        else if(countQA1 == 3 && countQB1 == 3) {
            Quizs3crollview.hidden = YES;
            Q3scrollview2.hidden = NO;
//            [Q3scrollview2 setContentSize:CGSizeMake(320, 480)];
//            CGRect rect = CGRectMake(16.0f, 1.0f, 293, 394);
//            Q3As.frame = rect;
            [Q3scrollview2 setContentSize:CGSizeMake(320, 600)];
            ResultTitlelbl.text = [NSString stringWithFormat:@"Mostly As & Bs"];
            ResultDesclbl.frame = CGRectMake(16, 131, 288, 422);
            ResultDesclbl.numberOfLines = 22;
            ResultDesclbl.text = [NSString stringWithFormat:@"Mostly As:\n You are going to be laid back parents.Relaxing is great,because it means you won’t get stressed when things don’t go to plan.But don’t forget that sometimes a little structure and routine can help your newborn understand what kind of behaviour you expect from them.\n\nMostly Bs:\n You have very different attitudes to parenting.You and your partner haven’t decided what your combined parenting style will be yet.Don’t worry: you’ll get there in the end! Try to take the time to sit down and talk about different parenting styles until you find a compromise."];
            Q3As.image = [UIImage imageNamed:@"Q3As&Bs.png"];
            Q3As.hidden = NO;
            countQA1 = 0;countQB1 = 0;
        }
        else if (countQA1 == 3 && countQB1 == 3 && countQC1 == 1) {
            Quizs3crollview.hidden = YES;
            Q3scrollview2.hidden = NO;
//            [Q3scrollview2 setContentSize:CGSizeMake(320, 480)];
//            CGRect rect = CGRectMake(16.0f, 1.0f, 293, 394);
//            Q3As.frame = rect;
            [Q3scrollview2 setContentSize:CGSizeMake(320, 600)];
            ResultTitlelbl.text = [NSString stringWithFormat:@"Mostly As & Bs"];
            ResultDesclbl.frame = CGRectMake(16, 131, 288, 422);
            ResultDesclbl.numberOfLines = 22;
            ResultDesclbl.text = [NSString stringWithFormat:@"Mostly As:\n You are going to be laid back parents.Relaxing is great,because it means you won’t get stressed when things don’t go to plan.But don’t forget that sometimes a little structure and routine can help your newborn understand what kind of behaviour you expect from them.\n\nMostly Bs:\n You have very different attitudes to parenting.You and your partner haven’t decided what your combined parenting style will be yet.Don’t worry: you’ll get there in the end! Try to take the time to sit down and talk about different parenting styles until you find a compromise."];
            Q3As.image = [UIImage imageNamed:@"Q3As&Bs.png"];
            Q3As.hidden = NO;
            countQA1 = 0;countQB1 = 0;countQC1 = 0;
        }
        else if(countQA1 == 3 && countQC1 == 3) {
            Quizs3crollview.hidden = YES;
            Q3scrollview2.hidden = NO;
            [Q3scrollview2 setContentSize:CGSizeMake(320, 600)];
            ResultTitlelbl.text = [NSString stringWithFormat:@"Mostly As & Cs"];
            ResultDesclbl.frame = CGRectMake(16, 131, 288, 459);
            ResultDesclbl.numberOfLines = 24;
            ResultDesclbl.text = [NSString stringWithFormat:@"Mostly As:\n You are going to be laid back parents.Relaxing is great,because it means you won’t get stressed when things don’t go to plan.But don’t forget that sometimes a little structure and routine can help your newborn understand what kind of behaviour you expect from them.\n\nMostly Cs:\n You are going to be organised parents.You understand the importance of getting your baby into a routine, and you have approached your pregnancy with meticulous planning.This is brilliant, but try to remember to relax and go with the flow: sometimes newborns don’t fit in with your plans, no matter how well thought out they are."];
            //[Q3scrollview2 setContentSize:CGSizeMake(320, 480)];
            Q3As.image = [UIImage imageNamed:@"Q3As&Cs.png"];
            //CGRect rect = CGRectMake(16.0f, 1.0f, 293, 394);
            //Q3As.frame = rect;
            Q3As.hidden = NO;
            countQA1 = 0;countQC1 = 0;
        }
        else if (countQA1 == 3 && countQB1 == 1 && countQC1 == 3) {
            Quizs3crollview.hidden = YES;
            Q3scrollview2.hidden = NO;
            [Q3scrollview2 setContentSize:CGSizeMake(320, 620)];
            ResultTitlelbl.text = [NSString stringWithFormat:@"Mostly As & Cs"];
            ResultDesclbl.frame = CGRectMake(16, 131, 288, 459);
            ResultDesclbl.numberOfLines = 24;
            ResultDesclbl.text = [NSString stringWithFormat:@"Mostly As:\n You are going to be laid back parents.Relaxing is great,because it means you won’t get stressed when things don’t go to plan.But don’t forget that sometimes a little structure and routine can help your newborn understand what kind of behaviour you expect from them.\n\nMostly Cs:\n You are going to be organised parents.You understand the importance of getting your baby into a routine, and you have approached your pregnancy with meticulous planning.This is brilliant, but try to remember to relax and go with the flow: sometimes newborns don’t fit in with your plans, no matter how well thought out they are."];
          //  [Q3scrollview2 setContentSize:CGSizeMake(320, 480)];
            Q3As.image = [UIImage imageNamed:@"Q3As&Cs.png"];
            //CGRect rect = CGRectMake(16.0f, 1.0f, 293, 394);
            //Q3As.frame = rect;
            Q3As.hidden = NO;
            countQA1 = 0;countQB1 = 0;countQC1 = 0;
        }
        else if(countQB1 == 3 && countQC1 == 3) {
            Quizs3crollview.hidden = YES;
            Q3scrollview2.hidden = NO;
            [Q3scrollview2 setContentSize:CGSizeMake(320, 620)];
            ResultTitlelbl.text = [NSString stringWithFormat:@"Mostly Bs & Cs"];
            ResultDesclbl.frame = CGRectMake(16, 131, 288, 463);
            ResultDesclbl.numberOfLines = 24;
            ResultDesclbl.text = [NSString stringWithFormat:@"Mostly Bs:\n You have very different attitudes to parenting.You and your partner haven’t decided what your combined parenting style will be yet.Don’t worry: you’ll get there in the end! Try to take the time to sit down and talk about different parenting styles until you find a compromise.\n\nMostly Cs:\n You are going to be organised parents.You understand the importance of getting your baby into a routine, and you have approached your pregnancy with meticulous planning.This is brilliant, but try to remember to relax and go with the flow: sometimes newborns don’t fit in with your plans, no matter how well thought out they are."];
            // [Q3scrollview2 setContentSize:CGSizeMake(320, 480)];
            Q3As.image = [UIImage imageNamed:@"Q3Bs&Cs.png"];
           // CGRect rect = CGRectMake(16.0f, 1.0f, 293, 394);
           // Q3As.frame = rect;
            Q3As.hidden = NO;
            countQB1 = 0;countQC1 = 0;
        }
        else if (countQA1 == 1 && countQB1 == 3 && countQC1 == 3) {
            Quizs3crollview.hidden = YES;
            Q3scrollview2.hidden = NO;
            [Q3scrollview2 setContentSize:CGSizeMake(320, 620)];
            ResultTitlelbl.text = [NSString stringWithFormat:@"Mostly Bs & Cs"];
            ResultDesclbl.frame = CGRectMake(16, 131, 288, 463);
            ResultDesclbl.numberOfLines = 24;
            ResultDesclbl.text = [NSString stringWithFormat:@"Mostly Bs:\n You have very different attitudes to parenting.You and your partner haven’t decided what your combined parenting style will be yet.Don’t worry: you’ll get there in the end! Try to take the time to sit down and talk about different parenting styles until you find a compromise.\n\nMostly Cs:\n You are going to be organised parents.You understand the importance of getting your baby into a routine, and you have approached your pregnancy with meticulous planning.This is brilliant, but try to remember to relax and go with the flow: sometimes newborns don’t fit in with your plans, no matter how well thought out they are."];
            //  [Q3scrollview2 setContentSize:CGSizeMake(320, 480)];
            Q3As.image = [UIImage imageNamed:@"Q3Bs&Cs.png"];
            //CGRect rect = CGRectMake(16.0f, 1.0f, 293, 394);
            //Q3As.frame = rect;
            Q3As.hidden = NO;
            countQA1 = 0;countQB1 = 0;countQC1 = 0;
        }
        else {
            //NSLog(@"Nothing");
        }
    }
    if (count == 7) {
        
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
        [Q1btn3 setSelected:NO];
        Q1A = 1;Q1B = 0;Q1C = 0;
        //[self QuestionResultValidation];
	} 
}

- (IBAction)Q1btn2:(id)sender {
    if (checkboxSelected1 == 0){
		[Q1btn2 setSelected:YES];
        [Q1btn1 setSelected:NO];
        [Q1btn3 setSelected:NO];
        Q1A = 0;Q1B = 1;Q1C = 0;
        //[self QuestionResultValidation];
	} 
}

- (IBAction)Q1btn3:(id)sender {
    if (checkboxSelected1 == 0){
		[Q1btn3 setSelected:YES];
        [Q1btn1 setSelected:NO];
        [Q1btn2 setSelected:NO];
        Q1A = 0;Q1B = 0;Q1C = 1;
        //[self QuestionResultValidation];
	} 
}

- (IBAction)Q2btn1:(id)sender {
    if (checkboxSelected2 == 0){
		[Q2btn1 setSelected:YES];
        [Q2btn2 setSelected:NO];
        [Q2btn3 setSelected:NO];
        Q2A = 1;Q2B = 0;Q2C = 0;
        //[self QuestionResultValidation];
	} 
}

- (IBAction)Q2btn2:(id)sender {
    if (checkboxSelected2 == 0){
		[Q2btn2 setSelected:YES];
        [Q2btn1 setSelected:NO];
        [Q2btn3 setSelected:NO];
        Q2A = 0;Q2B = 1;Q2C = 0;
        //[self QuestionResultValidation];
	} 
}

- (IBAction)Q2btn3:(id)sender {
    if (checkboxSelected2 == 0){
		[Q2btn3 setSelected:YES];
        [Q2btn1 setSelected:NO];
        [Q2btn2 setSelected:NO];
        Q2A = 0;Q2B = 0;Q2C = 1;
        //[self QuestionResultValidation];
	} 
}

- (IBAction)Q3btn1:(id)sender {
    if (checkboxSelected3 == 0){
		[Q3btn1 setSelected:YES];
        [Q3btn2 setSelected:NO];
        [Q3btn3 setSelected:NO];
        Q3A = 1;Q3B = 0;Q3C = 0;
        //[self QuestionResultValidation];
	} 
}

- (IBAction)Q3btn2:(id)sender {
    if (checkboxSelected3 == 0){
		[Q3btn2 setSelected:YES];
        [Q3btn1 setSelected:NO];
        [Q3btn3 setSelected:NO];
        Q3A = 0;Q3B = 1;Q3C = 0;
        //[self QuestionResultValidation];
	} 
}

- (IBAction)Q3btn3:(id)sender {
    if (checkboxSelected3 == 0){
		[Q3btn3 setSelected:YES];
        [Q3btn1 setSelected:NO];
        [Q3btn2 setSelected:NO];
        Q3A = 0;Q3B = 0;Q3C = 1;
        //[self QuestionResultValidation];
	} 
}

- (IBAction)Q4btn1:(id)sender {
    if (checkboxSelected4 == 0){
		[Q4btn1 setSelected:YES];
        [Q4btn2 setSelected:NO];
        [Q4btn3 setSelected:NO];
        Q4A = 1;Q4B = 0;Q4C = 0;
        //[self QuestionResultValidation];
	} 
}

- (IBAction)Q4btn2:(id)sender {
    if (checkboxSelected4 == 0){
		[Q4btn2 setSelected:YES];
        [Q4btn1 setSelected:NO];
        [Q4btn3 setSelected:NO];
        Q4A = 0;Q4B = 1;Q4C = 0;
        //[self QuestionResultValidation];
	} 
}

- (IBAction)Q4btn3:(id)sender {
    if (checkboxSelected4 == 0){
		[Q4btn3 setSelected:YES];
        [Q4btn1 setSelected:NO];
        [Q4btn2 setSelected:NO];
        Q4A = 0;Q4B = 0;Q4C = 1;
        //[self QuestionResultValidation];
	} 
}

- (IBAction)Q5btn1:(id)sender {
    if (checkboxSelected5 == 0){
		[Q5btn1 setSelected:YES];
        [Q5btn2 setSelected:NO];
        [Q5btn3 setSelected:NO];
        Q5A = 1;Q5B = 0;Q5C = 0;
        //[self QuestionResultValidation];
	} 
}

- (IBAction)Q5btn2:(id)sender {
    if (checkboxSelected5 == 0){
		[Q5btn2 setSelected:YES];
        [Q5btn1 setSelected:NO];
        [Q5btn3 setSelected:NO];
        Q5A = 0;Q5B = 1;Q5C = 0;
        //[self QuestionResultValidation];
	} 
}

- (IBAction)Q5btn3:(id)sender {
    if (checkboxSelected5 == 0){
		[Q5btn3 setSelected:YES];
        [Q5btn1 setSelected:NO];
        [Q5btn2 setSelected:NO];
        Q5A = 0;Q5B = 0;Q5C = 1;
        //[self QuestionResultValidation];
	} 
}

- (IBAction)Q6btn1:(id)sender {
    if (checkboxSelected6 == 0){
		[Q6btn1 setSelected:YES];
        [Q6btn2 setSelected:NO];
        [Q6btn3 setSelected:NO];
        Q6A = 1;Q6B = 0;Q6C = 0;
        //[self QuestionResultValidation];
	} 
}

- (IBAction)Q6btn2:(id)sender {
    if (checkboxSelected6 == 0){
		[Q6btn2 setSelected:YES];
        [Q6btn1 setSelected:NO];
        [Q6btn3 setSelected:NO];
        Q6A = 0;Q6B = 1;Q6C = 0;
        //[self QuestionResultValidation];
	} 
}

- (IBAction)Q6btn3:(id)sender {
    if (checkboxSelected6 == 0){
		[Q6btn3 setSelected:YES];
        [Q6btn1 setSelected:NO];
        [Q6btn2 setSelected:NO];
        Q6A = 0;Q6B = 0;Q6C = 1;
        //[self QuestionResultValidation];
	} 
}

- (IBAction)Q7btn1:(id)sender {
    if (checkboxSelected7 == 0){
		[Q7btn1 setSelected:YES];
        [Q7btn2 setSelected:NO];
        [Q7btn3 setSelected:NO];
        Q7A = 1;Q7B = 0;Q7C = 0;
        //[self QuestionResultValidation];
	} 
}

- (IBAction)Q7btn2:(id)sender {
    if (checkboxSelected7 == 0){
		[Q7btn2 setSelected:YES];
        [Q7btn1 setSelected:NO];
        [Q7btn3 setSelected:NO];
        Q7A = 0;Q7B = 1;Q7C = 0;
        //[self QuestionResultValidation];
	} 
}

- (IBAction)Q7btn3:(id)sender {
    if (checkboxSelected7 == 0){
		[Q7btn3 setSelected:YES];
        [Q7btn1 setSelected:NO];
        [Q7btn2 setSelected:NO];
        Q7A = 0;Q7B = 0;Q7C = 1;
        //[self QuestionResultValidation];
	} 
}

- (IBAction)Quiz3ValidateResults:(id)sender {
    [self QuestionResultValidation];
}



- (IBAction)showQuiz3infoView:(id)sender
{
    Quiz3infoViewController *Quiz3infoView = [[Quiz3infoViewController alloc] initWithNibName:@"Quiz3infoViewController" bundle:nil];
    Quiz3infoView.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentModalViewController:Quiz3infoView animated:YES];
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
