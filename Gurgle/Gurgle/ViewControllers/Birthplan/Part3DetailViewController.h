//
//  Part3DetailViewController.h
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

@interface Part3DetailViewController : UIViewController <UITextFieldDelegate, UITextViewDelegate, SKPSMTPMessageDelegate, MFMailComposeViewControllerDelegate>
{
    
    IBOutlet UIScrollView *scrollview3;
    
    IBOutlet UIImageView *bottombanner;
    IBOutlet UIImageView *Topbanner;
    
    IBOutlet UIButton *Button1;
    IBOutlet UIButton *Button2;
    IBOutlet UIButton *Button3;
    IBOutlet UIButton *Button4;
    IBOutlet UIButton *Button5;
    IBOutlet UIButton *Button6;
    IBOutlet UIButton *Button7;
    IBOutlet UIButton *Button8;
    IBOutlet UIButton *Button9;
    IBOutlet UIButton *Button91;
    IBOutlet UIButton *Button10;
    IBOutlet UIButton *Button11;
    IBOutlet UIButton *Button12;
    IBOutlet UIButton *Button13;
    IBOutlet UIButton *Button14;
    IBOutlet UIButton *Button15;
    IBOutlet UIButton *Button16;
    IBOutlet UIButton *Button17;
    IBOutlet UIButton *Button18;
    IBOutlet UIButton *Button19;
    IBOutlet UIButton *Button20;
    IBOutlet UIButton *Button21;
    IBOutlet UIButton *Button22;
    IBOutlet UIButton *Button23;
    IBOutlet UIButton *Button24;
   // IBOutlet UIButton *Button25;
    
    IBOutlet UIActivityIndicatorView *Spinner;
    IBOutlet UITextField *T1;
    IBOutlet UITextField *T2;
    IBOutlet UIToolbar *keyboardToolbar;
	UISegmentedControl *nextPreviousControl;
    BOOL keyboardToolbarShouldHide;
    
    BOOL checkboxSelected1,checkboxSelected2,checkboxSelected3,checkboxSelected4,checkboxSelected5,checkboxSelected6,checkboxSelected7,checkboxSelected8,checkboxSelected9,checkboxSelected91;
    BOOL checkboxSelected10,checkboxSelected11,checkboxSelected12,checkboxSelected13,checkboxSelected14,checkboxSelected15,checkboxSelected16,checkboxSelected17,checkboxSelected18,checkboxSelected19,checkboxSelected20;
    BOOL checkboxSelected21,checkboxSelected22,checkboxSelected23,checkboxSelected24;

    
    NSMutableArray	*Fields;
    NSMutableArray	*Clickbuttons;
    
    SKPSMTPState HighestState;
}
@property (nonatomic, retain) UISegmentedControl *nextPreviousControl;
@property (nonatomic, retain) UIToolbar *keyboardToolbar;

@property (strong, nonatomic) IBOutlet UITextField *T1;
@property (strong, nonatomic) IBOutlet UITextField *T2;

@property (nonatomic, retain)	NSMutableArray	*Fields;
@property (nonatomic, retain)	NSMutableArray	*Clickbuttons;

- (IBAction)Button1:(id)sender;
- (IBAction)Button2:(id)sender;
- (IBAction)Button3:(id)sender;
- (IBAction)Button4:(id)sender;
- (IBAction)Button5:(id)sender;
- (IBAction)Button6:(id)sender;
- (IBAction)Button7:(id)sender;
- (IBAction)Button8:(id)sender;
- (IBAction)Button9:(id)sender;
- (IBAction)Button91:(id)sender;
- (IBAction)Button10:(id)sender;
- (IBAction)Button11:(id)sender;
- (IBAction)Button12:(id)sender;
- (IBAction)Button13:(id)sender;
- (IBAction)Button14:(id)sender;
- (IBAction)Button15:(id)sender;
- (IBAction)Button16:(id)sender;
- (IBAction)Button17:(id)sender;
- (IBAction)Button18:(id)sender;
- (IBAction)Button19:(id)sender;
- (IBAction)Button20:(id)sender;
- (IBAction)Button21:(id)sender;
- (IBAction)Button22:(id)sender;
- (IBAction)Button23:(id)sender;
- (IBAction)Button24:(id)sender;
//- (IBAction)Button25:(id)sender;

- (IBAction)showBirthplanInfoView:(id)sender;
- (IBAction)showmyBirthplan:(id)sender;
- (IBAction)showPart1DetailView:(id)sender;
- (IBAction)showPart2DetailView:(id)sender;
- (IBAction)showPart4DetailView:(id)sender;

- (IBAction)showBirthplanView:(id)sender;
- (IBAction)ToolsView:(id)sender;
- (IBAction)FunView:(id)sender;
- (IBAction)HelpView:(id)sender;

- (IBAction)buttonSavePressed:(id)sender;
- (void)messageSent:(SKPSMTPMessage *)SMTPmessage;
- (void)messageFailed:(SKPSMTPMessage *)SMTPmessage error:(NSError *)error;

@end
