//
//  Part1DetailViewController.h
//  Gurgle
//
//  Created by Dhanasekar Gunabalan on 6/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <CFNetwork/CFNetwork.h>
#import "SKPSMTPMessage.h"
#import "NSData+Base64Additions.h"
#import <MessageUI/MessageUI.h>

@interface Part1DetailViewController : UIViewController <UITextFieldDelegate, UITextViewDelegate, SKPSMTPMessageDelegate , MFMailComposeViewControllerDelegate> 
{
    
    IBOutlet UIActivityIndicatorView *Spinner;
    IBOutlet UIImageView *bottombanner;
    IBOutlet UIImageView *Topbanner;
    
    IBOutlet UIScrollView *scrollview;
    
    IBOutlet UIToolbar *keyboardToolbar;
	UISegmentedControl *nextPreviousControl;
    
    IBOutlet UITextField *NameTxt;
    IBOutlet UITextField *T2;
    IBOutlet UITextField *T3;
    IBOutlet UITextField *T4;
    IBOutlet UITextField *T5;
    IBOutlet UITextField *T6;
    IBOutlet UITextField *T7;
    IBOutlet UITextField *T8;
    IBOutlet UITextField *T9;
    IBOutlet UITextField *T10;
    IBOutlet UITextField *T11;
    IBOutlet UITextField *T12;
    IBOutlet UITextField *T13;
    IBOutlet UITextField *T14;
    
    IBOutlet UITextField *T15;
    IBOutlet UITextField *T16;
    
    IBOutlet UISegmentedControl *segment1;
    
//    IBOutlet UIButton *Button4;
//    IBOutlet UIButton *Button3;
//    IBOutlet UIButton *Button2;
//    IBOutlet UIButton *Button1;
//    BOOL checkboxSelected;
    BOOL keyboardToolbarShouldHide;
    NSMutableArray	*Fields;
    SKPSMTPState HighestState;
}

- (IBAction)segmentAction:(id)sender;

@property (retain, nonatomic) IBOutlet UITextField *NameTxt;
@property (retain, nonatomic) IBOutlet UITextField *T2;
@property (retain, nonatomic) IBOutlet UITextField *T3;
@property (retain, nonatomic) IBOutlet UITextField *T4;
@property (retain, nonatomic) IBOutlet UITextField *T5;
@property (retain, nonatomic) IBOutlet UITextField *T6;
@property (retain, nonatomic) IBOutlet UITextField *T7;
@property (retain, nonatomic) IBOutlet UITextField *T8;
@property (retain, nonatomic) IBOutlet UITextField *T9;
@property (retain, nonatomic) IBOutlet UITextField *T10;
@property (retain, nonatomic) IBOutlet UITextField *T11;
@property (retain, nonatomic) IBOutlet UITextField *T12;
@property (retain, nonatomic) IBOutlet UITextField *T13;
@property (retain, nonatomic) IBOutlet UITextField *T14;
@property (retain, nonatomic) IBOutlet UITextField *T15;
@property (retain, nonatomic) IBOutlet UITextField *T16;

@property (nonatomic, retain)	NSMutableArray	*Fields;

@property (nonatomic, retain) UISegmentedControl *nextPreviousControl;
@property (nonatomic, retain) UIToolbar *keyboardToolbar;


//-(NSString *)dataFilePath;
//-(void)applicationWillResignActive:(NSNotification *)notification;
//-(BOOL)textFieldShouldReturn:(UITextField *)textField;

//- (IBAction)Button1:(id)sender;
//- (IBAction)Button2:(id)sender;
//- (IBAction)Button3:(id)sender;
//- (IBAction)Button4:(id)sender;
- (IBAction)buttonSavePressed:(id)sender;


- (IBAction)nextPrevious:(id)sender;
- (IBAction)dismissKeyboard:(id)sender;
- (IBAction)editingChanged:(id)sender;

- (IBAction)Part1DetailViewdone:(id)sender;
- (IBAction)showBirthplanInfoView:(id)sender;
- (IBAction)showBirthplanView:(id)sender;
- (IBAction)ToolsView:(id)sender;
- (IBAction)FunView:(id)sender;
- (IBAction)HelpView:(id)sender;
- (IBAction)showPart2DetailView:(id)sender;
- (IBAction)showPart3DetailView:(id)sender;
- (IBAction)showPart4DetailView:(id)sender;

- (void)messageSent:(SKPSMTPMessage *)SMTPmessage;
- (void)messageFailed:(SKPSMTPMessage *)SMTPmessage error:(NSError *)error;

@end
