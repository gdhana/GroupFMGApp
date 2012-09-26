//
//  Part2DetailViewController.h
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

@interface Part2DetailViewController : UIViewController <UITextFieldDelegate, UITextViewDelegate, SKPSMTPMessageDelegate,  MFMailComposeViewControllerDelegate>
{
    

    IBOutlet UIImageView *bottombanner;
    IBOutlet UIImageView *Topbanner;
    
    IBOutlet UIScrollView *scrollview2;
    IBOutlet UIButton *Button1;
    IBOutlet UIButton *Button2;
    IBOutlet UIButton *Button3;
    IBOutlet UIButton *Button4;
    IBOutlet UIButton *Button5;
    IBOutlet UIButton *Button6;
    IBOutlet UIButton *Button7;
    IBOutlet UIButton *Button8;
    IBOutlet UIButton *Button9;
    IBOutlet UIButton *Button10;
    IBOutlet UIButton *Button11;
    IBOutlet UIButton *Button12;
    IBOutlet UIButton *Button13;
    IBOutlet UIButton *Button14;
    IBOutlet UIButton *Button15;
  //  IBOutlet UIButton *Button16;
    IBOutlet UIButton *Button17;
    IBOutlet UIButton *Button18;
    IBOutlet UIButton *Button19;
    IBOutlet UIButton *Button20;
    IBOutlet UIButton *Button21;
    IBOutlet UIButton *Button22;
    IBOutlet UIButton *Button23;
    IBOutlet UIButton *Button24;
    IBOutlet UIButton *Button25;
    IBOutlet UIButton *Button26;
    IBOutlet UIButton *Button27;
    IBOutlet UIButton *Button28;
    IBOutlet UIButton *Button29;
    IBOutlet UIButton *Button30;
    IBOutlet UIButton *Button31;
    IBOutlet UIButton *Button32;
    IBOutlet UIButton *Button33;
    IBOutlet UIButton *Button34;
    IBOutlet UIButton *Button35;
    IBOutlet UIButton *Button36;
    IBOutlet UIButton *Button37;
    IBOutlet UIButton *Button38;
    IBOutlet UIButton *Button39;
    IBOutlet UIButton *Button40;
    IBOutlet UIButton *Button41;
    IBOutlet UIButton *Button42;
    IBOutlet UIButton *Button43;

    IBOutlet UIActivityIndicatorView *Spinner;
    
    BOOL checkboxSelected1,checkboxSelected2,checkboxSelected3,checkboxSelected4,checkboxSelected5,checkboxSelected6,checkboxSelected7,checkboxSelected8,checkboxSelected9;
    BOOL checkboxSelected10,checkboxSelected11,checkboxSelected12,checkboxSelected13,checkboxSelected14,checkboxSelected15,checkboxSelected17,checkboxSelected18,checkboxSelected19,checkboxSelected20;
    BOOL checkboxSelected21,checkboxSelected22,checkboxSelected23,checkboxSelected24,checkboxSelected25,checkboxSelected26,checkboxSelected27,checkboxSelected28,checkboxSelected29;
    BOOL checkboxSelected30,checkboxSelected31,checkboxSelected32,checkboxSelected33,checkboxSelected34,checkboxSelected35,checkboxSelected36,checkboxSelected37,checkboxSelected38,checkboxSelected39,checkboxSelected40;
    BOOL checkboxSelected41,checkboxSelected42,checkboxSelected43;
    
    IBOutlet UIToolbar *keyboardToolbar;
	UISegmentedControl *nextPreviousControl;
    BOOL keyboardToolbarShouldHide;
    
    IBOutlet UITextField *T1;
    IBOutlet UITextField *T2;
    IBOutlet UITextField *T3;
    IBOutlet UITextField *T4;
    IBOutlet UITextField *T5;
    
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
@property (strong, nonatomic) IBOutlet UITextField *T5;

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
- (IBAction)Button10:(id)sender;
- (IBAction)Button11:(id)sender;
- (IBAction)Button12:(id)sender;
- (IBAction)Button13:(id)sender;
- (IBAction)Button14:(id)sender;
- (IBAction)Button15:(id)sender;
//- (IBAction)Button16:(id)sender;
- (IBAction)Button17:(id)sender;
- (IBAction)Button18:(id)sender;
- (IBAction)Button19:(id)sender;
- (IBAction)Button20:(id)sender;
- (IBAction)Button21:(id)sender;
- (IBAction)Button22:(id)sender;
- (IBAction)Button23:(id)sender;
- (IBAction)Button24:(id)sender;
- (IBAction)Button25:(id)sender;
- (IBAction)Button26:(id)sender;
- (IBAction)Button27:(id)sender;
- (IBAction)Button28:(id)sender;
- (IBAction)Button29:(id)sender;
- (IBAction)Button30:(id)sender;
- (IBAction)Button31:(id)sender;
- (IBAction)Button32:(id)sender;
- (IBAction)Button33:(id)sender;
- (IBAction)Button34:(id)sender;
- (IBAction)Button35:(id)sender;
- (IBAction)Button36:(id)sender;
- (IBAction)Button37:(id)sender;
- (IBAction)Button38:(id)sender;
- (IBAction)Button39:(id)sender;
- (IBAction)Button40:(id)sender;
- (IBAction)Button41:(id)sender;
- (IBAction)Button42:(id)sender;
- (IBAction)Button43:(id)sender;

- (IBAction)showBirthplanInfoView:(id)sender;
- (IBAction)showmyBirthplan:(id)sender;
- (IBAction)showPart1DetailView:(id)sender;
- (IBAction)showPart3DetailView:(id)sender;
- (IBAction)showPart4DetailView:(id)sender;

- (IBAction)showBirthplanView:(id)sender;
- (IBAction)ToolsView:(id)sender;
- (IBAction)FunView:(id)sender;
- (IBAction)HelpView:(id)sender;

- (IBAction)buttonSavePressed:(id)sender;
- (void)messageSent:(SKPSMTPMessage *)SMTPmessage;
- (void)messageFailed:(SKPSMTPMessage *)SMTPmessage error:(NSError *)error;

@end
