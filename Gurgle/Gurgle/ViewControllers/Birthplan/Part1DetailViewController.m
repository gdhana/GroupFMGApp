//
//  Part1DetailViewController.m
//  Gurgle
//
//  Created by Dhanasekar Gunabalan on 6/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Part1DetailViewController.h"
#import "myBirthplanViewController.h"
#import "BirthplaninfoViewController.h"
#import "BirthplanViewController.h"
#import "ToolsViewController.h"
#import "FunViewController.h"
#import "HelpViewController.h"
#import "Part2DetailViewController.h"
#import "Part3DetailViewController.h"
#import "Part4DetailViewController.h"

#import "firstResponder.h"

#import "GurgleAdViewController.h"
BOOL action1;
//#import "LabelFont.h"

#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface Part1DetailViewController ()

@end

@implementation Part1DetailViewController


@synthesize nextPreviousControl;
@synthesize keyboardToolbar;
@synthesize Fields;


@synthesize NameTxt;
@synthesize T2;
@synthesize T3;
@synthesize T4;
@synthesize T5;
@synthesize T6;
@synthesize T7;
@synthesize T8;
@synthesize T9;
@synthesize T10;
@synthesize T11;
@synthesize T12;
@synthesize T13;
@synthesize T14;
@synthesize T15;
@synthesize T16;



//- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
//{
//    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
//    if (self) {
//        // Custom initialization
//    }
//    return self;
//}


- (void)viewDidLoad
{
//    bottombanner.animationImages = [NSArray arrayWithObjects: 
//                                    [UIImage imageNamed:@"huggies_banner.png"],                              
//                                    [UIImage imageNamed:@"Banner1.jpg"],[UIImage imageNamed:@"Banner2.jpg"],[UIImage imageNamed:@"Banner3.jpg"],[UIImage imageNamed:@"Banner4.jpg"],[UIImage imageNamed:@"Banner5.jpg"], nil];
//    bottombanner.animationDuration = 25.0; // seconds
//    bottombanner.animationRepeatCount = 0; //0 loops for ever/noted
//    [bottombanner startAnimating];
    
    [segment1 setFrame:CGRectMake(189,490,90,28)];
    
    //NameTxt.text = @"";
    //Make the name textfield to be the first responder.
	[NameTxt becomeFirstResponder];
     NameTxt.clearButtonMode = UITextFieldViewModeUnlessEditing;

    [scrollview setScrollEnabled:YES];
    [scrollview setContentSize:CGSizeMake(298, 1195)];
//    scrollview2.hidden = YES;
    
    // Do any additional setup after loading the view from its nib.
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];	
    [super viewDidLoad];
    
    // Data.plist code
	// get paths from root direcory
	NSArray *paths = NSSearchPathForDirectoriesInDomains (NSDocumentDirectory, NSUserDomainMask, YES);
	// get documents path
	NSString *documentsPath = [paths objectAtIndex:0];
	// get the path to our Data/plist file
	NSString *plistPath = [documentsPath stringByAppendingPathComponent:@"P1TextData.plist"];
	
	// check to see if Data.plist exists in documents
	if (![[NSFileManager defaultManager] fileExistsAtPath:plistPath]) 
	{
		// if not in documents, get property list from main bundle
		plistPath = [[NSBundle mainBundle] pathForResource:@"P1TextData" ofType:@"plist"];
	}
	
	// read property list into memory as an NSData object
	NSData *plistXML = [[NSFileManager defaultManager] contentsAtPath:plistPath];
	NSString *errorDesc = nil;
	NSPropertyListFormat format;
	// convert static property liost into dictionary object
	NSDictionary *temp = (NSDictionary *)[NSPropertyListSerialization propertyListFromData:plistXML mutabilityOption:kCFPropertyListMutableContainers format:&format errorDescription:&errorDesc];
	if (!temp) 
	{
		NSLog(@"Error reading P2TextData plist: %@, format: %d", errorDesc, format);
	}
   	// assign values
	//self.personName = [temp objectForKey:@"Name"];
	self.Fields = [NSMutableArray arrayWithArray:[temp objectForKey:@"Fields"]];
   // NSLog(@"%@",temp);
	// display values
	//nameEntered.text = personName;
	NameTxt.text = [Fields objectAtIndex:0];
	T2.text = [Fields objectAtIndex:1];
	T3.text = [Fields objectAtIndex:2];
    T4.text = [Fields objectAtIndex:3];
    T5.text = [Fields objectAtIndex:4];
    T6.text = [Fields objectAtIndex:5];
    T7.text = [Fields objectAtIndex:6];
    NSString *intString = [NSString stringWithFormat:@"%d", segment1.selectedSegmentIndex];
    intString = [Fields objectAtIndex:7];
  //  T8.text = [Fields objectAtIndex:7];
    T9.text = [Fields objectAtIndex:8];
    T10.text = [Fields objectAtIndex:9];
    T11.text = [Fields objectAtIndex:10];
    T12.text = [Fields objectAtIndex:11];
    T13.text = [Fields objectAtIndex:12];
    T14.text = [Fields objectAtIndex:13];
    T15.text = [Fields objectAtIndex:14];
    T16.text = [Fields objectAtIndex:15];
    int i;
    i = [intString intValue];
    segment1.selectedSegmentIndex = i;
    
}


//- (void)buttonClicked:(NSNotification *)note
//{
//	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"You clicked the keyboard button!" message:@"Hey!  You clicked the button on top of the keyboard." delegate:self cancelButtonTitle:@"Yep" otherButtonTitles:nil];
//	[alert show];
//	//[alert release];
//}

- (void)viewDidUnload
{
    NameTxt = nil;
    T2 = nil;
    T3 = nil;
    T4 = nil;
    T5 = nil;
    T6 = nil;
    T7 = nil;
    T8 = nil;
    T9 = nil;
    T10 = nil;
    T11 = nil;
    T12 = nil;
    T13 = nil;
    T14 = nil;
    T15 = nil;
    T16 = nil;
    [self setNameTxt:nil];
    [self setT2:nil];
    [self setT3:nil];
    [self setT4:nil];
    [self setT5:nil];
    [self setT6:nil];
    [self setT7:nil];
    [self setT8:nil];
    [self setT9:nil];
    [self setT10:nil];
    [self setT11:nil];
    [self setT12:nil];
    [self setT13:nil];
    [self setT14:nil];
    [self setT15:nil];
    [self setT16:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    keyboardToolbar = nil;
    nextPreviousControl = nil;
    
    
    Spinner = nil;
    
    Topbanner = nil;
    segment1 = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)dismissKeyboard:(id)sender
{
	[[self.view findFirstResponder] resignFirstResponder];
}
- (IBAction)buttonSavePressed:(id)sender
{
    [[self.view findFirstResponder] resignFirstResponder];
    // make sure all fields are have something in them
    if ((NameTxt.text.length  > 0) && (T2.text.length > 0)  && (T3.text.length > 0)&& (T4.text.length > 0)  && (T5.text.length > 0)&& (T6.text.length > 0)  && (T7.text.length > 0)&& (T9.text.length > 0)&& (T10.text.length > 0)&& (T11.text.length > 0)  && (T12.text.length > 0)&& (T13.text.length > 0)  && (T14.text.length > 0)&&   (T15.text.length > 0)&& (T16.text.length > 0)) {
        UIAlertView *alert1 = [[UIAlertView alloc] initWithTitle:@"Alert Completed" message:@"Your birth plan is completed Cancel to edit or Continue." delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Continue", nil];
        alert1.tag=1;
        [alert1 show];
    }
    else {
        UIAlertView *alert2 = [[UIAlertView alloc] initWithTitle:@"Alert InComplete" message:@"Your birth plan is incomplete Cancel to edit or Continue." delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Continue", nil];
        alert2.tag=2;
        [alert2 show];
    }
    self.view.userInteractionEnabled = NO;
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    if(alertView.tag == 1){
    if (buttonIndex == 0) {
        self.view.userInteractionEnabled = YES;
        [[self.view findFirstResponder] resignFirstResponder];
        [NameTxt becomeFirstResponder];
    }
    if (buttonIndex == 1) {
       // self.view.userInteractionEnabled = NO;
        [self Emailsend];
    }
    }
    if(alertView.tag == 2){
        if (buttonIndex == 0) {
            self.view.userInteractionEnabled = YES;
            [[self.view findFirstResponder] resignFirstResponder];
            [NameTxt becomeFirstResponder];
        }
        if (buttonIndex == 1) {
           // self.view.userInteractionEnabled = NO;
            [self Emailsend];
        }
    }
    if(alertView.tag == 3){
        if (buttonIndex == 0) {
            myBirthplanViewController *myBirthplanView = [[myBirthplanViewController alloc] initWithNibName:@"myBirthplanViewController" bundle:nil];
            myBirthplanView.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
            [self presentModalViewController:myBirthplanView animated:YES];    
        }
    }
    if(alertView.tag == 4){
        if (buttonIndex == 0) {
            myBirthplanViewController *myBirthplanView = [[myBirthplanViewController alloc] initWithNibName:@"myBirthplanViewController" bundle:nil];
            myBirthplanView.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
            [self presentModalViewController:myBirthplanView animated:YES];    
        }
    }
}

-(void) Cleardata
{
//    NameTxt.text = @"";
//    T2.text = @"";
//    T3.text = @"";
//    T4.text = @"";
//    T5.text = @"";
//    T6.text = @"";
//    T7.text = @"";
//    T8.text = @"";
//    T9.text = @"";
//    T10.text = @"";
//    T11.text = @"";
//    T12.text = @"";
//    T13.text = @"";
//    T14.text = @"";
//    T15.text = @"";
//    T16.text = @"";
   // NSLog(@"working");
    // get paths from root direcory
    NSArray *paths = NSSearchPathForDirectoriesInDomains (NSDocumentDirectory, NSUserDomainMask, YES);
    // get documents path
    NSString *documentsPath = [paths objectAtIndex:0];
    // get the path to our Data/plist file
    NSString *plistPath = [documentsPath stringByAppendingPathComponent:@"P1TextData.plist"];
    
    // set the variables to the values in the text fields
    
    self.Fields = [[NSMutableArray alloc] initWithCapacity:16];
    
    
    NSString *intString = [NSString stringWithFormat:@"%d", segment1.selectedSegmentIndex];
    self.Fields = [[NSMutableArray alloc] initWithCapacity:16];
    [Fields addObject:NameTxt.text];
    [Fields addObject:T2.text];
    [Fields addObject:T3.text];
    [Fields addObject:T4.text];
    [Fields addObject:T5.text];
    [Fields addObject:T6.text];
    [Fields addObject:T7.text];
    [Fields addObject:intString];
    [Fields addObject:T9.text];
    [Fields addObject:T10.text];
    [Fields addObject:T11.text];
    [Fields addObject:T12.text];
    [Fields addObject:T13.text];
    [Fields addObject:T14.text];
    [Fields addObject:T15.text];
    [Fields addObject:T16.text];
    NSLog(@"Clear Initstring : %@",intString);
    // create dictionary with values in UITextFields
    NSDictionary *plistDict = [NSDictionary dictionaryWithObjects: [NSArray arrayWithObjects: Fields, nil] forKeys:[NSArray arrayWithObjects: @"Fields", nil]];
    
    NSString *error = nil;
    // create NSData from dictionary
    NSData *plistData = [NSPropertyListSerialization dataFromPropertyList:plistDict format:NSPropertyListXMLFormat_v1_0 errorDescription:&error];
    
    // check is plistData exists
    if(plistData) 
    {
        // write plistData to our Data.plist file
        [plistData writeToFile:plistPath atomically:YES];
    }
    else 
    {
        NSLog(@"Error in P2TextData saveData: %@", error);
        // [error release];
    }
    
    //        myBirthplanViewController *myBirthplanView = [[myBirthplanViewController alloc] initWithNibName:@"myBirthplanViewController" bundle:nil];
    //        myBirthplanView.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    //        [self presentModalViewController:myBirthplanView animated:YES];
    //  [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.examplesite1.com"]];
}

- (void) Emailsend 
{
    NSString *t8string = @"";
    if (action1 == 1) {
        t8string = [NSString stringWithFormat:@"%d", segment1.selectedSegmentIndex];
    if (segment1.selectedSegmentIndex == 1) {
        t8string = @"YES";
    }else {
        t8string = @"NO";
    }
    }
    
  //  NSLog(@"T8String : %@",t8string);
    NSString *t1 = NameTxt.text; NSString *t2 = T2.text;NSString *t3 = T3.text;NSString *t4 = T4.text;NSString *t5 = T5.text;NSString *t6 = T6.text;NSString *t7 = T7.text;
    NSString *t8 = t8string;NSString *t9 = T9.text;NSString *t10 = T10.text;NSString *t11 = T11.text;NSString *t12 = T12.text;NSString *t13 = T13.text;NSString *t14 = T14.text;
    NSString *t15 = T15.text;NSString *t16 = T16.text;
    
    NSString *emailBody2 =[NSString stringWithFormat:@"<html><head><title>My birth plan part1</title></head><body><table width='600' cellpadding='5' cellspacing='0' border='1'><tr><td><table width'600' cellpadding='0' cellspacing='0' border='0'><tr><td width='600'><table width='600' cellpadding='5' cellspacing='0' border='0'><tr><td width='300' height='24' style='font-weight:bold;font-size:18px;color:#FF00FF;'>My birth plan part1</td></tr><tr><td width='300' style='font-weight:bold; display:inline;font-size:12px;'>Your name: %@</td></tr><tr><td width='300' style='font-weight:bold; display:inline;font-size:12px;'>What you like to be called: %@</td></tr><td width='300' style='font-weight:bold; display:inline;font-size:12px;'>Birth Partner&rsquo;s name: %@</td></tr><tr><td width='300' style='font-weight:bold; display:inline;font-size:12px;'>Your relationship to birth partner: %@</td></tr><tr><td width='300' style='font-weight:bold; display:inline;font-size:12px;'>Will baby&rsquo;s father will be present at the birth: %@</td></tr><tr><td width='300' style='font-weight:bold; display:inline;font-size:12px;'>Due date: %@</td></tr><tr><td width='300' style='font-weight:bold; display:inline;font-size:12px;'>Assigned midwife Other birth&ndash;support (doula, other family): %@</td></tr><tr><td width='300' style='font-weight:bold; display:inline;font-size:12px;'>Doctors name: %@</td></tr><tr><td width='300' style='font-weight:bold; display:inline;font-size:12px;'>Is this your first child? - %@</td></tr><tr><td width='300' style='font-weight:bold; display:inline;font-size:12px;'>Any previous labours or complications? - %@</td><tr><td width='300' style='font-weight:bold; display:inline;font-size:12px;'>Anyone you DON&rsquo;T want in the room who the midwives can politely turn away: %@</td></tr><tr><td width='300' height='24' style='font-weight:bold;font-size:14px;color:#FF00FF;'>Where do you want to give birth?</td></tr><tr><td width='300' style='font-weight:bold; display:inline;font-size:12px;'>Hospital - name of hospital: %@</td></tr><tr><td width='300' style='font-weight:bold; display:inline;font-size:12px;'>Labour ward telephone number: %@</td></tr><tr><td width='300' style='font-weight:bold; display:inline;font-size:12px;'>Birth Centre - name of birth centre: %@</td></tr><tr><td width='300' style='font-weight:bold; display:inline;font-size:12px;'>At home: %@</td></tr><tr><td width='300' style='font-weight:bold; display:inline;font-size:12px;'>Not sure yet: %@</td></tr></table></td></tr></table></body></html>",t1,t2,t3,t4,t5,t6,t7,t9,t8,t10,t11,t12,t13,t14,t15,t16];
    
    
    //create email
    MFMailComposeViewController *mail = [[MFMailComposeViewController alloc] init];
    
    mail.mailComposeDelegate = self;
    NSData *UIImageJPEGRepresentation(UIImage *image, CGFloat compressionQuality);

    if ([MFMailComposeViewController canSendMail]) {
        
        //Setting up the Subject, recipients, and message body.
        
       // [mail setToRecipients:[NSArray arrayWithObjects:@"dhanasekar.gunabalan@groupfmg.com",nil]];
        
        [mail setSubject:@"My birth plan part1"];
       // [mail addAttachmentData:UIImageJPEGRepresentation(imageView.image,0.5) mimeType:@"image/png" fileName:@"gurgle.png"];
        [mail setMessageBody:emailBody2 isHTML:YES];
        
        //Present the mail view controller
        
        [self presentModalViewController:mail animated:YES];
        self.view.userInteractionEnabled = YES;
    }
}

- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error

{
//    [self dismissModalViewControllerAnimated:YES];
//    
//    if (result == MFMailComposeResultFailed) {
//        
//    UIAlertView *alert1 = [[UIAlertView alloc] initWithTitle:@"Message Failed!" message:@"Your email has failed to send" delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];
//        
//        [alert1 show];
//        
//    }
//    else {
//        [self Cleardata];
//        myBirthplanViewController *myBirthplanView = [[myBirthplanViewController alloc] initWithNibName:@"myBirthplanViewController" bundle:nil];
//        myBirthplanView.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
//        [self presentModalViewController:myBirthplanView animated:YES];
//    }
    
    int a;
    // Notifies users about errors associated with the interface
    switch (result)
    {
        case MFMailComposeResultCancelled:
            NSLog(@"Result: canceled");
            [self dismissModalViewControllerAnimated:YES];
            self.view.userInteractionEnabled = YES;
            break;
        case MFMailComposeResultSaved:
        {
            NSLog(@"Result: saved");
            UIAlertView *alert3 = [[UIAlertView alloc] initWithTitle:@"Result" message:@"Mail Saved Successfully" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert3 show];
            alert3.tag = 3;
            [self dismissModalViewControllerAnimated:YES];
            self.view.userInteractionEnabled = YES;
            [self Cleardata];
            a =1;
        }
            break;
        case MFMailComposeResultSent:
        {
            NSLog(@"Result: sent");
            UIAlertView *alert4 = [[UIAlertView alloc] initWithTitle:@"Result" message:@"Mail Sent Successfully" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert4 show];
            alert4.tag = 4;
            [self dismissModalViewControllerAnimated:YES];
            self.view.userInteractionEnabled = YES;
            [self Cleardata];
            a=2;
            
        }
            break;
        case MFMailComposeResultFailed:{
            NSLog(@"Result: Failed");
            UIAlertView *alert5 = [[UIAlertView alloc] initWithTitle:@"Message Failed!" message:@"Your email has failed to send" delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];
            [alert5 show];
            alert5.tag = 5;
            [self dismissModalViewControllerAnimated:YES];
            self.view.userInteractionEnabled = YES;
            }
            break;
        default:
            NSLog(@"Result: not sent");
            UIAlertView *alert6 = [[UIAlertView alloc] initWithTitle:@"Error!" message:@"Your email has not send" delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];
            [alert6 show];
            alert6.tag = 6;
            [self dismissModalViewControllerAnimated:YES];
            self.view.userInteractionEnabled = YES;
            break;
    }

    if (a==1) {
        myBirthplanViewController *myBirthplanView = [[myBirthplanViewController alloc] initWithNibName:@"myBirthplanViewController" bundle:nil];
        myBirthplanView.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        [self presentModalViewController:myBirthplanView animated:YES];
    }
    else if (a==2)
    {
        myBirthplanViewController *myBirthplanView = [[myBirthplanViewController alloc] initWithNibName:@"myBirthplanViewController" bundle:nil];
        myBirthplanView.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        [self presentModalViewController:myBirthplanView animated:YES];
    }
    else
    {
        
    }
}

#pragma mark SKPSMTPMessage Delegate Methods
- (void)messageState:(SKPSMTPState)messageState;
{
   // NSLog(@"HighestState:%d", HighestState);
    if (messageState > HighestState)
        HighestState = messageState;
}
- (void)messageSent:(SKPSMTPMessage *)SMTPmessage
{
   // [SMTPmessage release];
    
    Spinner.hidden = YES;
    [Spinner stopAnimating];
  //  ProgressBar.hidden = YES;
    [self Cleardata];
    self.view.userInteractionEnabled = YES;
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Success" message:@"Sent!"
                                                   delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alert show];    
    
    myBirthplanViewController *myBirthplanView = [[myBirthplanViewController alloc] initWithNibName:@"myBirthplanViewController" bundle:nil];
    myBirthplanView.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentModalViewController:myBirthplanView animated:YES];
    //[alert release];
    // DEBUGLOG(@"delegate - message sent");
    
}
- (void)messageFailed:(SKPSMTPMessage *)SMTPmessage error:(NSError *)error
{
   // [SMTPmessage release];
    
    Spinner.hidden = YES;
    [Spinner stopAnimating];
   // ProgressBar.hidden = YES;
    //[self Cleardata];
    self.view.userInteractionEnabled = YES;
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:[error localizedDescription]
                                                   delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alert show];    
    myBirthplanViewController *myBirthplanView = [[myBirthplanViewController alloc] initWithNibName:@"myBirthplanViewController" bundle:nil];
    myBirthplanView.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentModalViewController:myBirthplanView animated:YES];
   // [alert release];
    //  DEBUGLOG(@"delegate - error(%d): %@", [error code], [error localizedDescription]);
}


- (IBAction)nextPrevious:(id)sender
{
	UIView *responder = [self.view findFirstResponder];		
	
	switch([(UISegmentedControl *)sender selectedSegmentIndex]) {
		case 0:
			// previous
			if (responder == NameTxt) {
				[T16 becomeFirstResponder];
			} else if (responder == T2) {
				[NameTxt becomeFirstResponder];
			} else if (responder == T3) {
				[T2 becomeFirstResponder];
			}else if (responder == T4) {
				[T3 becomeFirstResponder];
			}else if (responder == T5) {
				[T4 becomeFirstResponder];
			}else if (responder == T6) {
				[T5 becomeFirstResponder];
			}else if (responder == T7) {
				[T6 becomeFirstResponder];
			}else if (responder == T8) {
				[T7 becomeFirstResponder];
			}else if (responder == T9) {
				[T8 becomeFirstResponder];
			}else if (responder == T10) {
				[T9 becomeFirstResponder];
			}else if (responder == T11) {
				[T10 becomeFirstResponder];
			}else if (responder == T12) {
				[T11 becomeFirstResponder];
			}else if (responder == T13) {
				[T12 becomeFirstResponder];
			}else if (responder == T14) {
				[T13 becomeFirstResponder];
			}else if (responder == T15) {
				[T14 becomeFirstResponder];
			}else if (responder == T16) {
				[T15 becomeFirstResponder];
			}	
			break;
		case 1:
			// next
			if (responder == NameTxt) {
				[T2 becomeFirstResponder];
			} else if (responder == T2) {
				[T3 becomeFirstResponder];
			} else if (responder == T3) {
				[T4 becomeFirstResponder];
			}
			else if (responder == T4) {
				[T5 becomeFirstResponder];
			}
            else if (responder == T5) {
				[T6 becomeFirstResponder];
			}
            else if (responder == T6) {
				[T7 becomeFirstResponder];
			}
            else if (responder == T7) {
				[T8 becomeFirstResponder];
			}
            else if (responder == T8) {
				[T9 becomeFirstResponder];
			}else if (responder == T9) {
				[T10 becomeFirstResponder];
			}
            else if (responder == T10) {
				[T11 becomeFirstResponder];
			}
            else if (responder == T11) {
				[T12 becomeFirstResponder];
			}
            else if (responder == T12) {
				[T13 becomeFirstResponder];
			}
            else if (responder == T13) {
				[T14 becomeFirstResponder];
			}
            else if (responder == T14) {
				[T15 becomeFirstResponder];
			}else if (responder == T15) {
				[T16 becomeFirstResponder];
			}else if (responder == T16) {
				[NameTxt becomeFirstResponder];
			}
			break;		
	}	
    
}

- (IBAction)editingChanged:(id)sender
{
	
}

#pragma mark -
#pragma mark UITextFieldDelegate

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    if (T6) {
    UIDatePicker *datePicker = [[UIDatePicker alloc] init];
    datePicker.datePickerMode = UIDatePickerModeDate;
    [datePicker addTarget:self action:@selector(dateValueChanged:) forControlEvents:UIControlEventValueChanged];
    
    //datePicker.tag = indexPath.row;
    T6.inputView = datePicker;
    }
	keyboardToolbarShouldHide = NO;
    CGPoint pt;
    CGRect rc = [textField bounds];
    rc = [textField convertRect:rc toView:scrollview];
    pt = rc.origin;
    pt.x = 0;
    pt.y -= 1;
    [scrollview setContentOffset:pt animated:YES];
	//DebugLog(@"textFieldShouldBeginEditing: %@",textField);
	return YES;
}
-(IBAction)dateValueChanged:(id)sender
{
    UIDatePicker *picker = (UIDatePicker *)sender;
    NSDate *dateSelected1 = [picker date];
    NSDate *dateSelected2 = [picker date];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd-MM-yyyy"];
    self.T6.text = [dateFormatter stringFromDate:dateSelected1];
    self.T6.text = [dateFormatter stringFromDate:dateSelected2];
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
	//DebugLog(@"textFieldShouldEndEditing: %@",textField);
    keyboardToolbarShouldHide = YES;
    CGPoint pt;
    CGRect rc = [textField bounds];
    rc = [textField convertRect:rc toView:scrollview];
    pt = rc.origin;
    pt.x = 0;
    pt.y -= 2;
    [scrollview setContentOffset:pt animated:YES];
	return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    //[[NSUserDefaults standardDefaults] setObject:textField.text forKey:@"name_post"];
    
    if (textField == NameTxt) {
        [T2 becomeFirstResponder];
    } else if (textField == T2) {
        [T3 becomeFirstResponder];
    } else if (textField == T3) {
        [T4 becomeFirstResponder];
    }
    else if (textField == T4) {
        [T5 becomeFirstResponder];
    }
    else if (textField == T5) {
        [T6 becomeFirstResponder];
    }
    else if (textField == T6) {
        [T7 becomeFirstResponder];
    }
    else if (textField == T7) {
        [T8 becomeFirstResponder];
    }
    else if (textField == T8) {
        [T9 becomeFirstResponder];
    }else if (textField == T9) {
        [T10 becomeFirstResponder];
    }
    else if (textField == T10) {
        [T11 becomeFirstResponder];
    }
    else if (textField == T11) {
        [T12 becomeFirstResponder];
    }
    else if (textField == T12) {
        [T13 becomeFirstResponder];
    }
    else if (textField == T13) {
        [T14 becomeFirstResponder];
    }
    else if (textField == T14) {
        [T15 becomeFirstResponder];
    }else if (textField == T15) {
        [T16 becomeFirstResponder];
    }else if (textField == T16) {
        [NameTxt becomeFirstResponder];
    }
	return NO;
//    [textField resignFirstResponder];
//	return YES;
}

#pragma mark -
#pragma mark UIWindow Keyboard Notifications

- (void)keyboardWillShow:(NSNotification *)notification
{	
//	CGPoint beginCentre = [[[notification userInfo] valueForKey:UIKeyboardCenterBeginUserInfoKey] CGPointValue];
//	CGPoint endCentre = [[[notification userInfo] valueForKey:UIKeyboardCenterEndUserInfoKey] CGPointValue];
//	CGRect keyboardBounds = [[[notification userInfo] valueForKey:UIKeyboardBoundsUserInfoKey] CGRectValue];
    CGPoint beginCentre = [[[notification userInfo] valueForKey:@"UIKeyboardCenterBeginUserInfoKey"] CGPointValue];
    CGPoint endCentre = [[[notification userInfo] valueForKey:@"UIKeyboardCenterEndUserInfoKey"] CGPointValue];
    CGRect keyboardBounds = [[[notification userInfo] valueForKey:@"UIKeyboardBoundsUserInfoKey"] CGRectValue];

	UIViewAnimationCurve animationCurve	= [[[notification userInfo] valueForKey:UIKeyboardAnimationCurveUserInfoKey] intValue];
	NSTimeInterval animationDuration = [[[notification userInfo] valueForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];		
	
	if (nil == keyboardToolbar) {
		
		if(nil == keyboardToolbar) {
			keyboardToolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0,0,self.view.bounds.size.width,44)];
			keyboardToolbar.barStyle = UIBarStyleBlackTranslucent;
			keyboardToolbar.tintColor = [UIColor darkGrayColor];
			
			UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(dismissKeyboard:)];
            UIBarButtonItem *savebtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(buttonSavePressed:)];
            savebtn.tintColor = UIColorFromRGB(0xC84131);
			UIBarButtonItem *flex = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
			
			UISegmentedControl *control = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObjects:
																					 NSLocalizedString(@"Previous",@"Previous form field"),
																					 NSLocalizedString(@"Next",@"Next form field"),																				  
																					 nil]];
			control.segmentedControlStyle = UISegmentedControlStyleBar;
			control.tintColor = [UIColor darkGrayColor];
			control.momentary = YES;
			[control addTarget:self action:@selector(nextPrevious:) forControlEvents:UIControlEventValueChanged];			
			
			UIBarButtonItem *controlItem = [[UIBarButtonItem alloc] initWithCustomView:control];
			
			self.nextPreviousControl = control;
			
			
			//NSArray *items = [[NSArray alloc] initWithObjects:controlItem, flex, savebtn,barButtonItem, nil];
            NSArray *items = [[NSArray alloc] initWithObjects:controlItem, flex,barButtonItem, nil];
			[keyboardToolbar setItems:items];
			//[control release];
			//[barButtonItem release];
			//[flex release];
			//[items release];			
			
			keyboardToolbar.frame = CGRectMake(beginCentre.x - (keyboardBounds.size.width/2), 
											   beginCentre.y - (keyboardBounds.size.height/2) - keyboardToolbar.frame.size.height, 
											   keyboardToolbar.frame.size.width, 
											   keyboardToolbar.frame.size.height);				
			
			[self.view addSubview:keyboardToolbar];		
		}		
	}		
	
	[UIView beginAnimations:@"RS_showKeyboardAnimation" context:nil];	
	[UIView setAnimationCurve:animationCurve];
	[UIView setAnimationDuration:animationDuration];
	
	keyboardToolbar.alpha = 1.0;	
	keyboardToolbar.frame = CGRectMake(endCentre.x - (keyboardBounds.size.width/2), 
									   endCentre.y - (keyboardBounds.size.height/2) - keyboardToolbar.frame.size.height - self.view.frame.origin.y, 
									   keyboardToolbar.frame.size.width, 
									   keyboardToolbar.frame.size.height);
	
	[UIView commitAnimations];		
	
	keyboardToolbarShouldHide = YES;
}

- (void)keyboardWillHide:(NSNotification *)notification
{
	if (nil == keyboardToolbar || !keyboardToolbarShouldHide) {
		return;
	}	
	
	//	CGPoint beginCentre = [[[notification userInfo] valueForKey:UIKeyboardCenterBeginUserInfoKey] CGPointValue];
//	CGPoint endCentre = [[[notification userInfo] valueForKey:UIKeyboardCenterEndUserInfoKey] CGPointValue];
//	CGRect keyboardBounds = [[[notification userInfo] valueForKey:UIKeyboardBoundsUserInfoKey] CGRectValue];    
    CGPoint endCentre = [[[notification userInfo] valueForKey:@"UIKeyboardCenterEndUserInfoKey"] CGPointValue];
    CGRect keyboardBounds = [[[notification userInfo] valueForKey:@"UIKeyboardBoundsUserInfoKey"] CGRectValue];

	UIViewAnimationCurve animationCurve	= [[[notification userInfo] valueForKey:UIKeyboardAnimationCurveUserInfoKey] intValue];
	NSTimeInterval animationDuration = [[[notification userInfo] valueForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];	
	
	[UIView beginAnimations:@"RS_hideKeyboardAnimation" context:nil];	
	[UIView setAnimationCurve:animationCurve];
	[UIView setAnimationDuration:animationDuration];
	
	
	keyboardToolbar.alpha = 0.0;
	keyboardToolbar.frame = CGRectMake(endCentre.x - (keyboardBounds.size.width/2), 
									   endCentre.y - (keyboardBounds.size.height/2) - keyboardToolbar.frame.size.height,
									   keyboardToolbar.frame.size.width, 
									   keyboardToolbar.frame.size.height);
	
	[UIView commitAnimations];
    //keyboardToolbar.hidden = 1;
}


//- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
//	
//	[theTextField resignFirstResponder];
//	return YES;
//}

-(void) touchesBegan :(NSSet *) touches withEvent:(UIEvent *)event
{
	[[self.view findFirstResponder] resignFirstResponder];
	[super touchesBegan:touches withEvent:event ];
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

- (IBAction)Part1DetailViewdone:(id)sender
{
    // get paths from root direcory
    NSArray *paths = NSSearchPathForDirectoriesInDomains (NSDocumentDirectory, NSUserDomainMask, YES);
    // get documents path
    NSString *documentsPath = [paths objectAtIndex:0];
    // get the path to our Data/plist file
    NSString *plistPath = [documentsPath stringByAppendingPathComponent:@"P1TextData.plist"];
    
    // set the variables to the values in the text fields
    //  self.personName = nameEntered.text;
    NSString *intString = [NSString stringWithFormat:@"%d", segment1.selectedSegmentIndex];
    self.Fields = [[NSMutableArray alloc] initWithCapacity:16];
    [Fields addObject:NameTxt.text];
    [Fields addObject:T2.text];
    [Fields addObject:T3.text];
    [Fields addObject:T4.text];
    [Fields addObject:T5.text];
    [Fields addObject:T6.text];
    [Fields addObject:T7.text];
    [Fields addObject:intString];
    [Fields addObject:T9.text];
    [Fields addObject:T10.text];
    [Fields addObject:T11.text];
    [Fields addObject:T12.text];
    [Fields addObject:T13.text];
    [Fields addObject:T14.text];
    [Fields addObject:T15.text];
    [Fields addObject:T16.text];
    NSLog(@"Done Initstring : %@",intString);
    // create dictionary with values in UITextFields
    NSDictionary *plistDict = [NSDictionary dictionaryWithObjects: [NSArray arrayWithObjects: Fields, nil] forKeys:[NSArray arrayWithObjects: @"Fields", nil]];
    
    NSString *error = nil;
    // create NSData from dictionary
    NSData *plistData = [NSPropertyListSerialization dataFromPropertyList:plistDict format:NSPropertyListXMLFormat_v1_0 errorDescription:&error];
    
    // check is plistData exists
    if(plistData) 
    {
        // write plistData to our Data.plist file
        [plistData writeToFile:plistPath atomically:YES];
    }
    else 
    {
        NSLog(@"Error in saveData: %@", error);
        // [error release];
    }
    myBirthplanViewController *myBirthplanView = [[myBirthplanViewController alloc] initWithNibName:@"myBirthplanViewController" bundle:nil];
    myBirthplanView.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentModalViewController:myBirthplanView animated:YES];
}

- (IBAction)showBirthplanInfoView:(id)sender
{
    [self Cleardata];
    BirthplaninfoViewController *BirthplaninfoView = [[BirthplaninfoViewController alloc] initWithNibName:@"BirthplaninfoViewController" bundle:nil];
    BirthplaninfoView.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentModalViewController:BirthplaninfoView animated:YES];
}

- (IBAction)showBirthplanView:(id)sender
{
    [self Cleardata];
    BirthplanViewController *BirthplanView = [[BirthplanViewController alloc] initWithNibName:@"BirthplanViewController" bundle:nil];
    BirthplanView.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentModalViewController:BirthplanView animated:YES];
}

- (IBAction)ToolsView:(id)sender
{
    [self Cleardata];
    ToolsViewController *ToolsView = [[ToolsViewController alloc] initWithNibName:@"ToolsViewController" bundle:nil];
    ToolsView.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentModalViewController:ToolsView animated:YES];
}
- (IBAction)FunView:(id)sender
{
   [self Cleardata];
    FunViewController *FunView = [[FunViewController alloc] initWithNibName:@"FunViewController" bundle:nil];
    FunView.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentModalViewController:FunView animated:YES];
}
- (IBAction)HelpView:(id)sender
{
    [self Cleardata];
    HelpViewController *HelpView = [[HelpViewController alloc] initWithNibName:@"HelpViewController" bundle:nil];
    HelpView.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentModalViewController:HelpView animated:YES];
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
//    scrollview.hidden = YES;
//    scrollview2.hidden = NO;
//    [scrollview2 setScrollEnabled:YES];
//    [scrollview2 setContentSize:CGSizeMake(298, 1421)];
}


//- (void)dealloc {
//    [T15 release];
//    [T16 release];
//    [T15 release];
//    [T16 release];
//    [super dealloc];
//}

- (IBAction)segmentAction:(id)sender {
    action1 =1;
    if(segment1.selectedSegmentIndex==0){
        NSLog(@"1 : %d",segment1.selectedSegmentIndex);
    }
    else{
        NSLog(@"2: %d",segment1.selectedSegmentIndex);
    }   

}
@end
