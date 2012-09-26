//
//  Quiz2quesViewController.h
//  Gurgle
//
//  Created by Dhanasekar Gunabalan on 6/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Quiz2quesViewController : UIViewController
{
    IBOutlet UIImageView *bottombanner;
    IBOutlet UIImageView *Topbanner;
    
    IBOutlet UIImageView *Q2As;
    
    IBOutlet UIScrollView *Quizs2crollview;
    IBOutlet UIScrollView *Q2scrollview2;
    
    IBOutlet UILabel *ResultTitlelbl;
    IBOutlet UILabel *ResultDesclbl;
    
    IBOutlet UIButton *Q1btn1;
    IBOutlet UIButton *Q1btn2;
    
    IBOutlet UIButton *Q2btn1;
    IBOutlet UIButton *Q2btn2;
    
    IBOutlet UIButton *Q3btn1;
    IBOutlet UIButton *Q3btn2;
    
    IBOutlet UIButton *Q4btn1;
    IBOutlet UIButton *Q4btn2;
    
    IBOutlet UIButton *Q5btn1;
    IBOutlet UIButton *Q5btn2;
    
    IBOutlet UIButton *Q6btn1;
    IBOutlet UIButton *Q6btn2;
    
    IBOutlet UIButton *Q7btn1;
    IBOutlet UIButton *Q7btn2;
    
    IBOutlet UIButton *Q8btn1;
    IBOutlet UIButton *Q8btn2;
    
    
    
    BOOL checkboxSelected1,checkboxSelected2,checkboxSelected3,checkboxSelected4,checkboxSelected5,checkboxSelected6,checkboxSelected7,checkboxSelected8;
    BOOL Q1A,Q1B,Q2A,Q2B,Q3A,Q3B,Q4A,Q4B,Q5A,Q5B,Q6A,Q6B,Q7A,Q7B,Q8A,Q8B,count;
}

- (void)Quiz2ResultValidation;

- (IBAction)Q1btn1:(id)sender;
- (IBAction)Q1btn2:(id)sender;

- (IBAction)Q2btn1:(id)sender;
- (IBAction)Q2btn2:(id)sender;

- (IBAction)Q3btn1:(id)sender;
- (IBAction)Q3btn2:(id)sender;

- (IBAction)Q4btn1:(id)sender;
- (IBAction)Q4btn2:(id)sender;

- (IBAction)Q5btn1:(id)sender;
- (IBAction)Q5btn2:(id)sender;

- (IBAction)Q6btn1:(id)sender;
- (IBAction)Q6btn2:(id)sender;

- (IBAction)Q7btn1:(id)sender;
- (IBAction)Q7btn2:(id)sender;

- (IBAction)Q8btn1:(id)sender;
- (IBAction)Q8btn2:(id)sender;

- (IBAction)Quiz2ValidateResults:(id)sender;


- (IBAction)showQuiz2infoView:(id)sender;

- (IBAction)BirthplanView:(id)sender;
- (IBAction)ToolsView:(id)sender;
- (IBAction)FunView:(id)sender;
- (IBAction)HelpView:(id)sender;


@end
