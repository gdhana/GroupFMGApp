//
//  Quiz1questViewController.m
//  Gurgle
//
//  Created by Dhanasekar Gunabalan on 6/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Quiz1questViewController.h"
#import "Quiz1infoViewController.h"

#import "BirthplanViewController.h"
#import "ToolsViewController.h"
#import "FunViewController.h"
#import "HelpViewController.h"
#import "GurgleAdViewController.h"

@interface Quiz1questViewController ()

@end

static int countQA1,countQB1,countQC1,count;

@implementation Quiz1questViewController


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
    Quizscrollview.hidden = NO;
    Q1scrollview2.hidden = YES;
    [Q1scrollview2 setScrollEnabled:YES];
    Q1As.hidden = YES;
    // Do any additional setup after loading the view from its nib.
    [Quizscrollview setScrollEnabled:YES];
    [Quizscrollview setContentSize:CGSizeMake(320, 1680)];
    
//    CGRect frame = Quizscrollview.frame; 
//    frame.size.width = 10; 
//    Quizscrollview.frame = frame;
//    [Quizscrollview flashScrollIndicators];
    countQA1 = 0;countQB1 = 0;countQC1 = 0;count = 0;
}

- (void)QuestionResultValidation
{
    countQA1 = Q1A + Q2A + Q3A + Q4A + Q5A +Q6A + Q7A + Q8A;
    countQB1 = Q1B + Q2B + Q3B + Q4B + Q5B +Q6B + Q7B + Q8B;
    countQC1 = Q1C + Q2C + Q3C + Q4C + Q5C +Q6C + Q7C + Q8C;
    count = countQA1 + countQB1 +countQC1;
    if(count == 8){
    if (countQA1 == 8 || countQA1 == 7 || countQA1 == 6 || countQA1 == 5) {
        Quizscrollview.hidden = YES;
        Q1scrollview2.hidden = NO;
//        CGRect rect = CGRectMake(16.0f, 52.0f, 293, 247);
//        Q1As.frame = rect;
        [textview flashScrollIndicators];
        Q1As.image = [UIImage imageNamed:@"Q1As.png"];
        Q1As.hidden = NO;
        resulttitle_lbl.text = @"Mostly As";
       // textview.text=[NSString stringWithFormat:@\"Hi how are you \n good how are you? \n great, thanks\n\"];
        textview.text = [NSString stringWithFormat:@" You’re a little bit unprepared for the arrival of your new born – but don’t worry! Most parents –to-be feel that way.\n To help you feel a little bit more prepared why not start stocking up on the things you’ll need for your baby, such as nappies, baby clothes, and a car seat? Most hospitals won’t let you leave without one!"];
        countQA1 = 0;
    }
    else if (countQA1 == 4 && countQB1 == 3 && countQC1 == 1) {
        Quizscrollview.hidden = YES;
        Q1scrollview2.hidden = NO;
        [textview flashScrollIndicators];
        Q1As.image = [UIImage imageNamed:@"Q1As.png"];
        Q1As.hidden = NO;
        resulttitle_lbl.text = @"Mostly As";
        textview.text = [NSString stringWithFormat:@" You’re a little bit unprepared for the arrival of your new born – but don’t worry! Most parents –to-be feel that way.\n To help you feel a little bit more prepared why not start stocking up on the things you’ll need for your baby, such as nappies, baby clothes, and a car seat? Most hospitals won’t let you leave without one!"];
        countQA1 = 0;countQB1 = 0;countQC1 = 0;
    }
    else if (countQA1 == 4 && countQB1 == 1 && countQC1 == 3) {
        Quizscrollview.hidden = YES;
        Q1scrollview2.hidden = NO;
        [textview flashScrollIndicators];
        Q1As.image = [UIImage imageNamed:@"Q1As.png"];
        Q1As.hidden = NO;
        resulttitle_lbl.text = @"Mostly As";
        textview.text = [NSString stringWithFormat:@" You’re a little bit unprepared for the arrival of your new born – but don’t worry! Most parents –to-be feel that way.\n To help you feel a little bit more prepared why not start stocking up on the things you’ll need for your baby, such as nappies, baby clothes, and a car seat? Most hospitals won’t let you leave without one!"];
        countQA1 = 0;countQB1 = 0;countQC1 = 0;
    }
    else if(countQB1 == 8 || countQB1 == 7 || countQB1 == 6 || countQB1 == 5) {
        Quizscrollview.hidden = YES;
        Q1scrollview2.hidden = NO;
        Q1As.image = [UIImage imageNamed:@"Q1Bs.png"];
        Q1As.hidden = NO;
        resulttitle_lbl.text = @"Mostly Bs";
        textview.text = [NSString stringWithFormat:@" You are normal parents-to-be: you have some of the key things you need organised for your newborn, but you’ll readily admit you still have some preparation to do.\n Try not to worry too much about the things you haven’t organised yet: take things at your own pace, and remember that it’s just as important to relax in these last few weeks of your pregnancy."];
        countQB1 = 0;
    }
    else if (countQA1 == 3 && countQB1 == 4 && countQC1 == 1) {
        Quizscrollview.hidden = YES;
        Q1scrollview2.hidden = NO;
        Q1As.image = [UIImage imageNamed:@"Q1Bs.png"];
        Q1As.hidden = NO;
        resulttitle_lbl.text = @"Mostly Bs";
        textview.text = [NSString stringWithFormat:@" You are normal parents-to-be: you have some of the key things you need organised for your newborn, but you’ll readily admit you still have some preparation to do.\n Try not to worry too much about the things you haven’t organised yet: take things at your own pace, and remember that it’s just as important to relax in these last few weeks of your pregnancy."];
        countQA1 = 0;countQB1 = 0;countQC1 = 0;
    }
    else if (countQA1 == 1 && countQB1 == 4 && countQC1 == 3) {
        Quizscrollview.hidden = YES;
        Q1scrollview2.hidden = NO;
        Q1As.image = [UIImage imageNamed:@"Q1Bs.png"];
        Q1As.hidden = NO;
        resulttitle_lbl.text = @"Mostly Bs";
        textview.text = [NSString stringWithFormat:@" You are normal parents-to-be: you have some of the key things you need organised for your newborn, but you’ll readily admit you still have some preparation to do.\n Try not to worry too much about the things you haven’t organised yet: take things at your own pace, and remember that it’s just as important to relax in these last few weeks of your pregnancy."];
        countQA1 = 0;countQB1 = 0;countQC1 = 0;
    }
    else if(countQC1 == 8 || countQC1 == 7 || countQC1 == 6 || countQC1 == 5) {
        Quizscrollview.hidden = YES;
        Q1scrollview2.hidden = NO;
        Q1As.image = [UIImage imageNamed:@"Q1Cs.png"];
        Q1As.hidden = NO;
        resulttitle_lbl.text = @"Mostly Cs";
        textview.text = [NSString stringWithFormat:@" You are super-organised parents-to-be! Congratulations on planning ahead, and having everything ready for your new arrival.\n Now that you have everything prepared don’t forget to take the time to relax and enjoy some quality time together. As soon as your new born arrives you’ll be supremely grateful for any rest you can get now!"];
        countQC1 = 0;
    }
    else if (countQA1 == 3 && countQB1 == 1 && countQC1 == 4) {
        Quizscrollview.hidden = YES;
        Q1scrollview2.hidden = NO;
        Q1As.image = [UIImage imageNamed:@"QCCs.png"];
        Q1As.hidden = NO;
        resulttitle_lbl.text = @"Mostly Cs";
        textview.text = [NSString stringWithFormat:@" You are super-organised parents-to-be! Congratulations on planning ahead, and having everything ready for your new arrival.\n Now that you have everything prepared don’t forget to take the time to relax and enjoy some quality time together. As soon as your new born arrives you’ll be supremely grateful for any rest you can get now!"];
        countQA1 = 0;countQB1 = 0;countQC1 = 0;
    }
    else if (countQA1 == 1 && countQB1 == 3 && countQC1 == 4) {
        Quizscrollview.hidden = YES;
        Q1scrollview2.hidden = NO;
        Q1As.image = [UIImage imageNamed:@"Q1Cs.png"];
        Q1As.hidden = NO;
        resulttitle_lbl.text = @"Mostly Cs";
        textview.text = [NSString stringWithFormat:@" You are super-organised parents-to-be! Congratulations on planning ahead, and having everything ready for your new arrival.\n Now that you have everything prepared don’t forget to take the time to relax and enjoy some quality time together. As soon as your new born arrives you’ll be supremely grateful for any rest you can get now!"];
        countQA1 = 0;countQB1 = 0;countQC1 = 0;
    }
    else if(countQA1 == 4 && countQB1 == 4) {
        Quizscrollview.hidden = YES;
        Q1scrollview2.hidden = NO;
       // [Q1scrollview2 setContentSize:CGSizeMake(320, 480)];
       // CGRect rect = CGRectMake(16.0f, 1.0f, 293, 394);
        //Q1As.frame = rect;
        Q1As.image = [UIImage imageNamed:@"Q1As&Bs.png"];
        Q1As.hidden = NO;
        resulttitle_lbl.text = @"Mostly As&Bs";
        textview.text = [NSString stringWithFormat:@"Mostly As:\n You’re a little bit unprepared for the arrival of your new born – but don’t worry! Most parents –to-be feel that way.\n To help you feel a little bit more prepared why not start stocking up on the things you’ll need for your baby, such as nappies, baby clothes, and a car seat? Most hospitals won’t let you leave without one!\n\nMostly Bs:\n You are normal parents-to-be: you have some of the key things you need organised for your newborn, but you’ll readily admit you still have some preparation to do.\n Try not to worry too much about the things you haven’t organised yet: take things at your own pace, and remember that it’s just as important to relax in these last few weeks of your pregnancy."];
        countQA1 = 0;countQB1 = 0;
    }
    else if (countQA1 == 3 && countQB1 == 3 && countQC1 == 2) {
        Quizscrollview.hidden = YES;
        Q1scrollview2.hidden = NO;
       // [Q1scrollview2 setContentSize:CGSizeMake(320, 480)];
        //CGRect rect = CGRectMake(16.0f, 1.0f, 293, 394);
        //Q1As.frame = rect;
        Q1As.image = [UIImage imageNamed:@"Q1As&Bs.png"];
        Q1As.hidden = NO;
        resulttitle_lbl.text = @"Mostly As&Bs";
        textview.text = [NSString stringWithFormat:@"Mostly As:\n You’re a little bit unprepared for the arrival of your new born – but don’t worry! Most parents –to-be feel that way.\n To help you feel a little bit more prepared why not start stocking up on the things you’ll need for your baby, such as nappies, baby clothes, and a car seat? Most hospitals won’t let you leave without one!\n\nMostly Bs:\n You are normal parents-to-be: you have some of the key things you need organised for your newborn, but you’ll readily admit you still have some preparation to do.\n Try not to worry too much about the things you haven’t organised yet: take things at your own pace, and remember that it’s just as important to relax in these last few weeks of your pregnancy."];
        countQA1 = 0;countQB1 = 0;countQC1 = 0;
    }
    else if(countQA1 == 4 && countQC1 == 4) {
        Quizscrollview.hidden = YES;
        Q1scrollview2.hidden = NO;
       // [Q1scrollview2 setContentSize:CGSizeMake(320, 480)];
        Q1As.image = [UIImage imageNamed:@"Q1As&Cs.png"];
       // CGRect rect = CGRectMake(16.0f, 1.0f, 293, 394);
       // Q1As.frame = rect;
        resulttitle_lbl.text = @"Mostly As&Cs";
        Q1As.hidden = NO;
        textview.text = [NSString stringWithFormat:@"Mostly As:\n You’re a little bit unprepared for the arrival of your new born – but don’t worry! Most parents –to-be feel that way.\n To help you feel a little bit more prepared why not start stocking up on the things you’ll need for your baby, such as nappies, baby clothes, and a car seat? Most hospitals won’t let you leave without one!\n\nMostly Cs:\n You are super-organised parents-to-be! Congratulations on planning ahead, and having everything ready for your new arrival.\n Now that you have everything prepared don’t forget to take the time to relax and enjoy some quality time together. As soon as your new born arrives you’ll be supremely grateful for any rest you can get now!"];
        countQA1 = 0;countQC1 = 0;
    }
    else if (countQA1 == 3 && countQB1 == 2 && countQC1 == 3) {
        Quizscrollview.hidden = YES;
        Q1scrollview2.hidden = NO;
    //    [Q1scrollview2 setContentSize:CGSizeMake(320, 480)];
        Q1As.image = [UIImage imageNamed:@"Q1As&Cs.png"];
     //   CGRect rect = CGRectMake(16.0f, 1.0f, 293, 394);
      //  Q1As.frame = rect;
        Q1As.hidden = NO;
        resulttitle_lbl.text = @"Mostly As&Cs";
        textview.text = [NSString stringWithFormat:@"Mostly As:\n You’re a little bit unprepared for the arrival of your new born – but don’t worry! Most parents –to-be feel that way.\n To help you feel a little bit more prepared why not start stocking up on the things you’ll need for your baby, such as nappies, baby clothes, and a car seat? Most hospitals won’t let you leave without one!\n\nMostly Cs:\n You are super-organised parents-to-be! Congratulations on planning ahead, and having everything ready for your new arrival.\n Now that you have everything prepared don’t forget to take the time to relax and enjoy some quality time together. As soon as your new born arrives you’ll be supremely grateful for any rest you can get now!"];
        countQA1 = 0;countQB1 = 0;countQC1 = 0;
    }
    else if(countQB1 == 4 && countQC1 == 4) {
        Quizscrollview.hidden = YES;
        Q1scrollview2.hidden = NO;
     //   [Q1scrollview2 setContentSize:CGSizeMake(320, 480)];
        Q1As.image = [UIImage imageNamed:@"Q1Bs&Cs.png"];
      //  CGRect rect = CGRectMake(16.0f, 1.0f, 293, 394);
      //  Q1As.frame = rect;
        Q1As.hidden = NO;
        resulttitle_lbl.text = @"Mostly Bs&Cs";
        textview.text = [NSString stringWithFormat:@"Mostly Bs:\n You are normal parents-to-be: you have some of the key things you need organised for your newborn, but you’ll readily admit you still have some preparation to do.\n Try not to worry too much about the things you haven’t organised yet: take things at your own pace, and remember that it’s just as important to relax in these last few weeks of your pregnancy.\n\nMostly Cs:\n You are super-organised parents-to-be! Congratulations on planning ahead, and having everything ready for your new arrival.\n Now that you have everything prepared don’t forget to take the time to relax and enjoy some quality time together. As soon as your new born arrives you’ll be supremely grateful for any rest you can get now!"];
        countQB1 = 0;countQC1 = 0;
    }
    else if (countQA1 == 2 && countQB1 == 3 && countQC1 == 3) {
        Quizscrollview.hidden = YES;
        Q1scrollview2.hidden = NO;
    //    [Q1scrollview2 setContentSize:CGSizeMake(320, 480)];
        Q1As.image = [UIImage imageNamed:@"Q1Bs&Cs.png"];
    //    CGRect rect = CGRectMake(16.0f, 1.0f, 293, 394);
      //  Q1As.frame = rect;
        Q1As.hidden = NO;
        resulttitle_lbl.text = @"Mostly Bs&Cs";
        textview.text = [NSString stringWithFormat:@"Mostly Bs:\n You are normal parents-to-be: you have some of the key things you need organised for your newborn, but you’ll readily admit you still have some preparation to do.\n Try not to worry too much about the things you haven’t organised yet: take things at your own pace, and remember that it’s just as important to relax in these last few weeks of your pregnancy.\n\nMostly Cs:\n You are super-organised parents-to-be! Congratulations on planning ahead, and having everything ready for your new arrival.\n Now that you have everything prepared don’t forget to take the time to relax and enjoy some quality time together. As soon as your new born arrives you’ll be supremely grateful for any rest you can get now!"];
        countQA1 = 0;countQB1 = 0;countQC1 = 0;
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
- (void)viewDidUnload
{
    bottombanner = nil;
    Quizscrollview = nil;
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
    Q8btn1 = nil;
    Q8btn2 = nil;
    Q8btn3 = nil;
    Q1As = nil;
    Q1scrollview2 = nil;
    resulttitle_lbl = nil;
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

- (IBAction)Q8btn1:(id)sender {
    if (checkboxSelected8 == 0){
		[Q8btn1 setSelected:YES];
        [Q8btn2 setSelected:NO];
        [Q8btn3 setSelected:NO];
        Q8A = 1;Q8B = 0;Q8C = 0;
        //[self QuestionResultValidation];
	} 
}

- (IBAction)Q8btn2:(id)sender {
    if (checkboxSelected8 == 0){
		[Q8btn2 setSelected:YES];
        [Q8btn1 setSelected:NO];
        [Q8btn3 setSelected:NO];
        Q8A = 0;Q8B = 1;Q8C = 0;
        //[self QuestionResultValidation];
	} 
}

- (IBAction)Q8btn3:(id)sender {
    if (checkboxSelected8 == 0){
		[Q8btn3 setSelected:YES];
        [Q8btn1 setSelected:NO];
        [Q8btn2 setSelected:NO];
        Q8A = 0;Q8B = 0;Q8C = 1;
        //[self QuestionResultValidation];
	} 
}

- (IBAction)Quiz1ValidateResults:(id)sender {

    [self QuestionResultValidation];
}


- (IBAction)showQuiz1infoView:(id)sender
{
    Quiz1infoViewController *Quiz1infoView = [[Quiz1infoViewController alloc] initWithNibName:@"Quiz1infoViewController" bundle:nil];
    Quiz1infoView.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentModalViewController:Quiz1infoView animated:YES];
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
