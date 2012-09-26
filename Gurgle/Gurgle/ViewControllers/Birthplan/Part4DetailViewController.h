//
//  Part4DetailViewController.h
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

@interface Part4DetailViewController : UIViewController <UITextFieldDelegate, UITextViewDelegate, SKPSMTPMessageDelegate, MFMailComposeViewControllerDelegate>
{
    IBOutlet UIImageView *bottombanner;
    IBOutlet UIImageView *Topbanner;
    
    IBOutlet UIScrollView *scrollview4;
    
    IBOutlet UIToolbar *keyboardToolbar;
	UISegmentedControl *nextPreviousControl;
    
    IBOutlet UITextField *T1;
    IBOutlet UITextField *T2;
    IBOutlet UITextField *T3;
    IBOutlet UITextField *T4;
    IBOutlet UITextField *T6;
    
    BOOL keyboardToolbarShouldHide;
    
    IBOutlet UIButton *Button1;
    IBOutlet UIButton *Button2;
    IBOutlet UIButton *Button3;
    IBOutlet UIButton *Button4;
    IBOutlet UIButton *Button5;
    IBOutlet UIButton *Button6;
    IBOutlet UIButton *Button7;
    IBOutlet UIButton *Button8;
    
    IBOutlet UIActivityIndicatorView *Spinner;
    
    BOOL checkboxSelected1,checkboxSelected2,checkboxSelected3,checkboxSelected4,checkboxSelected5,checkboxSelected6,checkboxSelected7,checkboxSelected8;
    
    NSMutableArray	*Fields;
    NSMutableArray	*Clickbuttons;
    
    SKPSMTPState HighestState;
}

@property (nonatomic, retain) UISegmentedControl *nextPreviousControl;
@property (nonatomic, retain) UIToolbar *keyboardToolbar;

@property (strong, nonatomic) IBOutlet UITextField *T1;
@property (strong, nonatomic) IBOutlet UITextField *T2;
@property (strong, nonatomic) IBOutlet UITextField *T3;
@property (strong, nonatomic) IBOutlet UITextField *T4;
@property (strong, nonatomic) IBOutlet UITextField *T6;

@property (nonatomic, retain)	NSMutableArray	*Fields;
@property (nonatomic, retain)	NSMutableArray	*Clickbuttons;

- (IBAction)nextPrevious:(id)sender;
- (IBAction)dismissKeyboard:(id)sender;
- (IBAction)editingChanged:(id)sender;

- (IBAction)Button1:(id)sender;
- (IBAction)Button2:(id)sender;
- (IBAction)Button3:(id)sender;
- (IBAction)Button4:(id)sender;
- (IBAction)Button5:(id)sender;
- (IBAction)Button6:(id)sender;
- (IBAction)Button7:(id)sender;
- (IBAction)Button8:(id)sender;


- (IBAction)showBirthplanInfoView:(id)sender;
- (IBAction)showmyBirthplan:(id)sender;
- (IBAction)showPart1DetailView:(id)sender;
- (IBAction)showPart2DetailView:(id)sender;
- (IBAction)showPart3DetailView:(id)sender;

- (IBAction)showBirthplanView:(id)sender;
- (IBAction)ToolsView:(id)sender;
- (IBAction)FunView:(id)sender;
- (IBAction)HelpView:(id)sender;

- (IBAction)buttonSavePressed:(id)sender;
- (void)messageSent:(SKPSMTPMessage *)SMTPmessage;
- (void)messageFailed:(SKPSMTPMessage *)SMTPmessage error:(NSError *)error;

@end
