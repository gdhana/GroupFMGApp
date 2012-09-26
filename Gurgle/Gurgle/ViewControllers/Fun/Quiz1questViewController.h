//
//  Quiz1questViewController.h
//  Gurgle
//
//  Created by Dhanasekar Gunabalan on 6/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Quiz1questViewController : UIViewController
{
    
    IBOutlet UIScrollView *Quizscrollview;
    
    IBOutlet UIScrollView *Q1scrollview2;
    IBOutlet UIImageView *bottombanner;
    IBOutlet UIImageView *Topbanner;
    
    IBOutlet UIImageView *Q1As;
    
    IBOutlet UIButton *Q1btn1;
    IBOutlet UIButton *Q1btn2;
    IBOutlet UIButton *Q1btn3;
    
    IBOutlet UIButton *Q2btn1;
    IBOutlet UIButton *Q2btn2;
    IBOutlet UIButton *Q2btn3;
    
    IBOutlet UIButton *Q3btn1;
    IBOutlet UIButton *Q3btn2;
    IBOutlet UIButton *Q3btn3;
    
    IBOutlet UIButton *Q4btn1;
    IBOutlet UIButton *Q4btn2;
    IBOutlet UIButton *Q4btn3;
    
    IBOutlet UIButton *Q5btn1;
    IBOutlet UIButton *Q5btn2;
    IBOutlet UIButton *Q5btn3;
    
    IBOutlet UIButton *Q6btn1;
    IBOutlet UIButton *Q6btn2;
    IBOutlet UIButton *Q6btn3;
    
    IBOutlet UIButton *Q7btn1;
    IBOutlet UIButton *Q7btn2;
    IBOutlet UIButton *Q7btn3;
    
    IBOutlet UIButton *Q8btn1;
    IBOutlet UIButton *Q8btn2;
    IBOutlet UIButton *Q8btn3;
    
    IBOutlet UITextView *textview;
    
    IBOutlet UILabel *resulttitle_lbl;
    
    BOOL checkboxSelected1,checkboxSelected2,checkboxSelected3,checkboxSelected4,checkboxSelected5,checkboxSelected6,checkboxSelected7,checkboxSelected8; 
    BOOL Q1A,Q1B,Q1C,Q2A,Q2B,Q2C,Q3A,Q3B,Q3C,Q4A,Q4B,Q4C,Q5A,Q5B,Q5C,Q6A,Q6B,Q6C,Q7A,Q7B,Q7C,Q8A,Q8B,Q8C;
}
- (void)QuestionResultValidation;

- (IBAction)Q1btn1:(id)sender;
- (IBAction)Q1btn2:(id)sender;
- (IBAction)Q1btn3:(id)sender;

- (IBAction)Q2btn1:(id)sender;
- (IBAction)Q2btn2:(id)sender;
- (IBAction)Q2btn3:(id)sender;

- (IBAction)Q3btn1:(id)sender;
- (IBAction)Q3btn2:(id)sender;
- (IBAction)Q3btn3:(id)sender;

- (IBAction)Q4btn1:(id)sender;
- (IBAction)Q4btn2:(id)sender;
- (IBAction)Q4btn3:(id)sender;

- (IBAction)Q5btn1:(id)sender;
- (IBAction)Q5btn2:(id)sender;
- (IBAction)Q5btn3:(id)sender;

- (IBAction)Q6btn1:(id)sender;
- (IBAction)Q6btn2:(id)sender;
- (IBAction)Q6btn3:(id)sender;

- (IBAction)Q7btn1:(id)sender;
- (IBAction)Q7btn2:(id)sender;
- (IBAction)Q7btn3:(id)sender;

- (IBAction)Q8btn1:(id)sender;
- (IBAction)Q8btn2:(id)sender;
- (IBAction)Q8btn3:(id)sender;

- (IBAction)Quiz1ValidateResults:(id)sender;


- (IBAction)showQuiz1infoView:(id)sender;

- (IBAction)BirthplanView:(id)sender;
- (IBAction)ToolsView:(id)sender;
- (IBAction)FunView:(id)sender;
- (IBAction)HelpView:(id)sender;

@end
