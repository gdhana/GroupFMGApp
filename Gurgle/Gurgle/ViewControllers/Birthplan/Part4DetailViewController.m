//
//  Part4DetailViewController.m
//  Gurgle
//
//  Created by Dhanasekar Gunabalan on 6/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Part4DetailViewController.h"
#import "BirthplaninfoViewController.h"
#import "myBirthplanViewController.h"
#import "Part1DetailViewController.h"
#import "Part2DetailViewController.h"
#import "Part3DetailViewController.h"

#import "BirthplanViewController.h"
#import "ToolsViewController.h"
#import "FunViewController.h"
#import "HelpViewController.h"

#import "firstResponder.h"

#import "GurgleAdViewController.h"

//#import "LabelFont.h"

#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

BOOL action1,action2,action3,action4,action5,action6,action7,action8;

@interface Part4DetailViewController ()

@end

@implementation Part4DetailViewController

@synthesize nextPreviousControl;
@synthesize keyboardToolbar;
@synthesize Fields;
@synthesize Clickbuttons;

@synthesize T1;
@synthesize T2;
@synthesize T3;
@synthesize T4;
//@synthesize T5;
@synthesize T6;

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
    
    [scrollview4 setScrollEnabled:YES];
    [scrollview4 setContentSize:CGSizeMake(298, 1380)];
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    
    // Data.plist code
	// get paths from root direcory
	NSArray *paths = NSSearchPathForDirectoriesInDomains (NSDocumentDirectory, NSUserDomainMask, YES);
	// get documents path
	NSString *documentsPath = [paths objectAtIndex:0];
	// get the path to our Data/plist file
	NSString *plistPath = [documentsPath stringByAppendingPathComponent:@"P4TextData.plist"];
	
	// check to see if Data.plist exists in documents
	if (![[NSFileManager defaultManager] fileExistsAtPath:plistPath]) 
	{
		// if not in documents, get property list from main bundle
		plistPath = [[NSBundle mainBundle] pathForResource:@"P4TextData" ofType:@"plist"];
	}
	
	// read property list into memory as an NSData object
	NSData *plistXML = [[NSFileManager defaultManager] contentsAtPath:plistPath];
	NSString *errorDesc = nil;
	NSPropertyListFormat format;
	// convert static property liost into dictionary object
	NSDictionary *temp = (NSDictionary *)[NSPropertyListSerialization propertyListFromData:plistXML mutabilityOption:kCFPropertyListMutableContainers format:&format errorDescription:&errorDesc];
	if (!temp) 
	{
		NSLog(@"Error reading P4TextData plist: %@, format: %d", errorDesc, format);
	}
   	// assign values
	//self.personName = [temp objectForKey:@"Name"];
	self.Fields = [NSMutableArray arrayWithArray:[temp objectForKey:@"Fields"]];
    // NSLog(@"%@",temp);
	// display values
	//nameEntered.text = personName;
	T1.text = [Fields objectAtIndex:0];
	T2.text = [Fields objectAtIndex:1];
	T3.text = [Fields objectAtIndex:2];
    T4.text = [Fields objectAtIndex:3];
   // T5.text = [Fields objectAtIndex:4];
    T6.text = [Fields objectAtIndex:4];
    self.Clickbuttons = [NSMutableArray arrayWithArray:[temp objectForKey:@"Click"]];
    [Button1 setSelected:[[Clickbuttons objectAtIndex:0]boolValue]];
    checkboxSelected1 = [[Clickbuttons objectAtIndex:0]boolValue];
    [Button2 setSelected:[[Clickbuttons objectAtIndex:1]boolValue]];
    checkboxSelected2 = [[Clickbuttons objectAtIndex:1]boolValue];
    [Button3 setSelected:[[Clickbuttons objectAtIndex:2]boolValue]];
    checkboxSelected3 = [[Clickbuttons objectAtIndex:2]boolValue];
    [Button4 setSelected:[[Clickbuttons objectAtIndex:3]boolValue]];
    checkboxSelected4 = [[Clickbuttons objectAtIndex:3]boolValue];
    [Button5 setSelected:[[Clickbuttons objectAtIndex:4]boolValue]];
    checkboxSelected5 = [[Clickbuttons objectAtIndex:4]boolValue];
    [Button6 setSelected:[[Clickbuttons objectAtIndex:5]boolValue]];
    checkboxSelected6 = [[Clickbuttons objectAtIndex:5]boolValue];
    [Button7 setSelected:[[Clickbuttons objectAtIndex:6]boolValue]];
    checkboxSelected7 = [[Clickbuttons objectAtIndex:6]boolValue];
    [Button8 setSelected:[[Clickbuttons objectAtIndex:7]boolValue]];
    checkboxSelected8 = [[Clickbuttons objectAtIndex:7]boolValue];

}

- (void)viewDidUnload
{
    Button1 = nil;
    Button2 = nil;
    Button3 = nil;
    Button4 = nil;
    Button5 = nil;
    Button6 = nil;
    Button7 = nil;
    Button8 = nil;
    T1 = nil;
    T2 = nil;
    T3 = nil;
    T4 = nil;
   // T5 = nil;
    T6 = nil;
    [self setT1:nil];
    [self setT2:nil];
    [self setT3:nil];
    [self setT4:nil];
   // [self setT5:nil];
    [self setT6:nil];
    bottombanner = nil;
    Spinner = nil;
    Topbanner = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

//- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
//	
//	[theTextField resignFirstResponder];
//	return YES;
//}
//muthamil.sundaram inbainiya
- (IBAction)dismissKeyboard:(id)sender
{
	[[self.view findFirstResponder] resignFirstResponder];
}
- (IBAction)buttonSavePressed:(id)sender
{
    [[self.view findFirstResponder] resignFirstResponder];
    // make sure all fields are have something in them
    if ((T1.text.length  > 0) && (T2.text.length > 0)  && (T3.text.length > 0)&& (T4.text.length > 0) && (T6.text.length > 0) && checkboxSelected1 == 1 && checkboxSelected2 == 1 && checkboxSelected3 == 1 && checkboxSelected4 == 1 && checkboxSelected5 == 1 && checkboxSelected6 == 1 && checkboxSelected7 == 1 && checkboxSelected8 == 1) {
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
    //	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Alert Completed" message:@"Your birth plan is completed Cancel to edit or Continue." delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Continue", nil];
    //    [alert show];
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    if(alertView.tag == 1){
        if (buttonIndex == 0) {
            self.view.userInteractionEnabled = YES;
            [[self.view findFirstResponder] resignFirstResponder];
            [T1 becomeFirstResponder];
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
            [T1 becomeFirstResponder];
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

//    if (buttonIndex == 0) {
//        self.view.userInteractionEnabled = YES;
//        [[self.view findFirstResponder] resignFirstResponder];
//        [T1 becomeFirstResponder];
//    }
//    if (buttonIndex == 1) {
//        self.view.userInteractionEnabled = NO;
//        [self Emailsend];
//       // [self Storedata];
////        myBirthplanViewController *myBirthplanView = [[myBirthplanViewController alloc] initWithNibName:@"myBirthplanViewController" bundle:nil];
////        myBirthplanView.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
////        [self presentModalViewController:myBirthplanView animated:YES];
//        //  [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.examplesite1.com"]];
//    }
}
-(void) Cleardata
{
    T1.text = @"";
    T2.text = @"";
    T3.text = @"";
    T4.text = @"";
    T6.text = @"";
    checkboxSelected1 = NO;checkboxSelected2 = NO;checkboxSelected3 = NO;checkboxSelected4 = NO;checkboxSelected5 = NO;checkboxSelected6 = NO;checkboxSelected7 = NO;
    checkboxSelected8 = NO;
}
-(void) Storedata
{
    // get paths from root direcory
    NSArray *paths = NSSearchPathForDirectoriesInDomains (NSDocumentDirectory, NSUserDomainMask, YES);
    // get documents path
    NSString *documentsPath = [paths objectAtIndex:0];
    // get the path to our Data/plist file
    NSString *plistPath = [documentsPath stringByAppendingPathComponent:@"P4TextData.plist"];
    
    // set the variables to the values in the text fields
    //  self.personName = nameEntered.text;
    self.Fields = [[NSMutableArray alloc] initWithCapacity:5];
    [Fields addObject:T1.text];
    [Fields addObject:T2.text];
    [Fields addObject:T3.text];
    [Fields addObject:T4.text];
    //[Fields addObject:T5.text];
    [Fields addObject:T6.text];
    self.Clickbuttons = [[NSMutableArray alloc] initWithCapacity:8];
    [Clickbuttons addObject: [NSNumber numberWithBool:checkboxSelected1]];
    [Clickbuttons addObject: [NSNumber numberWithBool:checkboxSelected2]];
    [Clickbuttons addObject: [NSNumber numberWithBool:checkboxSelected3]];
    [Clickbuttons addObject: [NSNumber numberWithBool:checkboxSelected4]];
    [Clickbuttons addObject: [NSNumber numberWithBool:checkboxSelected5]];
    [Clickbuttons addObject: [NSNumber numberWithBool:checkboxSelected6]];
    [Clickbuttons addObject: [NSNumber numberWithBool:checkboxSelected7]];
    [Clickbuttons addObject: [NSNumber numberWithBool:checkboxSelected8]];
       
    NSDictionary *plistDict = [NSDictionary dictionaryWithObjects: [NSArray arrayWithObjects: Fields,Clickbuttons, nil] forKeys:[NSArray arrayWithObjects: @"Fields",@"Click", nil]];
    
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
        NSLog(@"Error in P4TextData saveData: %@", error);
        // [error release];
    }
}

- (void) Emailsend 
{
    NSString *t1 = T1.text; NSString *t2 = T2.text;NSString *t3 = T3.text;NSString *t4 = T4.text;NSString *t6 = T6.text;
//    BOOL c1 =checkboxSelected1;BOOL c2 =checkboxSelected2;BOOL c3 =checkboxSelected3;BOOL c4 =checkboxSelected4;BOOL c5 =checkboxSelected5;BOOL c6 =checkboxSelected6;
//    BOOL c7 =checkboxSelected7;BOOL c8 =checkboxSelected8;
//    NSString *emailBody =[NSString stringWithFormat:@"Your birth plan 4:\n1: %@ ,\n2: %@ , \n3: %@ ,\n4: %@ ,\n5: %@ ,\n%d ,\n%d ,\n%d ,\n%d ,\n%d ,\n%d ,\n%d ,\n%d ,\n \"Success\".\n\n",t1,t2,t3,t4,t6,c1,c2,c3,c4,c5,c6,c7,c8]; 
//    
//    //NSLog(@"%@",emailBody);
//    SKPSMTPMessage *test_smtp_message = [[SKPSMTPMessage alloc] init];
//    test_smtp_message.fromEmail = @"dhanasekar.gunabalan@groupfmg.com";
//    test_smtp_message.toEmail = @"dhanasekar.gunabalan@groupfmg.com";
//    test_smtp_message.relayHost = @"email.wearefmg.net";
//    test_smtp_message.requiresAuth = 0;
//    test_smtp_message.login = @"dhanasekar.gunabalan";
//    test_smtp_message.pass =@"roja@1234";
//    test_smtp_message.wantsSecure = 1; // smtp.gmail.com doesn't work without TLS!
//    test_smtp_message.subject = @"My birth plan part4";
//    
//    //    test_smtp_message.bccEmail = @"testbcc@test.com";
//    
//    // Only do this for self-signed certs!
//    // test_smtp_message.validateSSLChain = NO;
//    test_smtp_message.delegate1 = self;
//    
//    NSMutableArray *parts_to_send = [NSMutableArray array];
//    
//    //If you are not sure how to format your message part, send an email to your self.  
//    //In Mail.app, View > Message> Raw Source to see the raw text that a standard email client will generate.
//    //This should give you an idea of the proper format and options you need
//    NSDictionary *plain_text_part = [NSDictionary dictionaryWithObjectsAndKeys:
//                                     @"text/plain\r\n\tcharset=UTF-8;\r\n\tformat=flowed", kSKPSMTPPartContentTypeKey,
//                                     [emailBody stringByAppendingString:@"\n"], kSKPSMTPPartMessageKey,
//                                     @"quoted-printable", kSKPSMTPPartContentTransferEncodingKey,
//                                     nil];
//    [parts_to_send addObject:plain_text_part];
//    
//    if (test_smtp_message.requiresAuth == 1)
//    {
//        NSString *vcard_path = [[NSBundle mainBundle] pathForResource:@"test" ofType:@"vcf"];
//        NSData *vcard_data = [NSData dataWithContentsOfFile:vcard_path];
//        NSDictionary *vcard_part = [NSDictionary dictionaryWithObjectsAndKeys:
//                                    @"text/directory;\r\n\tx-unix-mode=0644;\r\n\tname=\"test.vcf\"",kSKPSMTPPartContentTypeKey,
//                                    @"attachment;\r\n\tfilename=\"test.vcf\"",kSKPSMTPPartContentDispositionKey,
//                                    [vcard_data encodeBase64ForData],kSKPSMTPPartMessageKey,
//                                    @"base64",kSKPSMTPPartContentTransferEncodingKey,nil];
//        [parts_to_send addObject:vcard_part];
//    }
//    
//    if (test_smtp_message.requiresAuth == 1)
//    {
//        NSString *image_path = [[NSBundle mainBundle] pathForResource:@"Success" ofType:@"png"];
//        NSData *image_data = [NSData dataWithContentsOfFile:image_path];        
//        NSDictionary *image_part = [NSDictionary dictionaryWithObjectsAndKeys:
//                                    @"inline;\r\n\tfilename=\"Success.png\"",kSKPSMTPPartContentDispositionKey,
//                                    @"base64",kSKPSMTPPartContentTransferEncodingKey,
//                                    @"image/png;\r\n\tname=Success.png;\r\n\tx-unix-mode=0666",kSKPSMTPPartContentTypeKey,
//                                    [image_data encodeWrappedBase64ForData],kSKPSMTPPartMessageKey,
//                                    nil];
//        [parts_to_send addObject:image_part];
//    }
//    NSString *string1 = @"\n\nTest Unicode:☃,漢字";
//    NSDictionary *sig_text_part = [NSDictionary dictionaryWithObjectsAndKeys:
//                                   @"text/plain\r\n\tcharset=UTF-8;\r\n\tformat=flowed", kSKPSMTPPartContentTypeKey,
//                                   [@"\n" stringByAppendingString:string1], kSKPSMTPPartMessageKey,
//                                   @"quoted-printable", kSKPSMTPPartContentTransferEncodingKey,
//                                   nil];
//    [parts_to_send addObject:sig_text_part];
//    
//    test_smtp_message.parts = parts_to_send;
//    
//    Spinner.hidden = NO;
//    [Spinner startAnimating];
//    HighestState = 0;
//    
//    [test_smtp_message send];
    
    
    NSString *C1str = @"";
    if (action1 == 1) {
        C1str = [NSString stringWithFormat:@"%d", checkboxSelected1];
        if (checkboxSelected1 == 1) {
            C1str = @"YES";
        }else {
            C1str = @"NO";
        }
    }
    NSString *C2str = @"";
    if (action2 == 1) {
        C2str = [NSString stringWithFormat:@"%d", checkboxSelected2];
        if (checkboxSelected2 == 1) {
            C2str = @"YES";
        }else {
            C2str = @"NO";
        }
    }
    NSString *C3str = @"";
    if (action3 == 1) {
        C3str = [NSString stringWithFormat:@"%d", checkboxSelected3];
        if (checkboxSelected3 == 1) {
            C3str = @"YES";
        }else {
            C3str = @"NO";
        }
    }
    NSString *C4str = @"";
    if (action4 == 1) {
        C4str = [NSString stringWithFormat:@"%d", checkboxSelected4];
        if (checkboxSelected4 == 1) {
            C4str = @"YES";
        }else {
            C4str = @"NO";
        }
    }
    NSString *C5str = @"";
    if (action5 == 1) {
        C5str = [NSString stringWithFormat:@"%d", checkboxSelected5];
        if (checkboxSelected5 == 1) {
            C5str = @"YES";
        }else {
            C5str = @"NO";
        }
    }
    NSString *C6str = @"";
    if (action6 == 1) {
        C6str = [NSString stringWithFormat:@"%d", checkboxSelected6];
        if (checkboxSelected6 == 1) {
            C6str = @"YES";
        }else {
            C6str = @"NO";
        }
    }
    NSString *C7str = @"";
    if (action7 == 1) {
        C7str = [NSString stringWithFormat:@"%d", checkboxSelected7];
        if (checkboxSelected7 == 1) {
            C7str = @"YES";
        }else {
            C7str = @"NO";
        }
    }
    NSString *C8str = @"";
    if (action8 == 1) {
        C8str = [NSString stringWithFormat:@"%d", checkboxSelected8];
        if (checkboxSelected8 == 1) {
            C8str = @"YES";
        }else {
            C8str = @"NO";
        }
    }

//    NSString *C1str= (checkboxSelected1 ? @"YES" : @"NO");NSString *C2str= (checkboxSelected2 ? @"YES" : @"NO");NSString *C3str= (checkboxSelected3 ? @"YES" : @"NO");
//    NSString *C4str= (checkboxSelected4 ? @"YES" : @"NO");NSString *C5str= (checkboxSelected5 ? @"YES" : @"NO");NSString *C6str= (checkboxSelected6 ? @"YES" : @"NO");
//    NSString *C7str= (checkboxSelected7 ? @"YES" : @"NO");NSString *C8str= (checkboxSelected8 ? @"YES" : @"NO");
    
    NSString *emailBody2 =[NSString stringWithFormat:@"<html><head><title>My birth plan part4</title></head><body><table width='600' cellpadding='5' cellspacing='0' border='1'><tr><td><table width='600' cellpadding='5' cellspacing='0' border='0' style='border-left:1px solid #00000'><tr><td width='417' style='font-weight:bold; display:inline;font-size:12px;'><span style='font-weight:bold; display:inline;font-size:18px;color:#FF00FF;'>Feeding my baby after birth</span></td><td width='162' style='font-weight:bold; display:inline;font-size:12px;'></td></tr><tr><td style='font-weight:bold; display:inline;font-size:12px;'>&nbsp;</td><td style='font-weight:bold; display:inline;font-size:12px;'>&nbsp;</td></tr><td width='417' style='font-weight:bold; display:inline;font-size:12px;'>I wish to breastfeed exclusively as soon as possible after the birth - </td><td width='162' style='font-weight:bold; display:inline;font-size:12px;'>%@</td></tr><tr><td width='417' style='font-weight:bold; display:inline;font-size:12px;'>I wish to breastfeed, but formula supplementation is acceptable - </td><td width='162' style='font-weight:bold; display:inline;font-size:12px;'>%@</td></tr><tr><td width='417' style='font-weight:bold; display:inline;font-size:12px;'>I wish to formula feed - </td><td width='162' style='font-weight:bold; display:inline;font-size:12px;'>%@</td></tr><tr><td width='417' style='font-weight:bold; display:inline;font-size:12px;'>I do not want my baby to be given a dummy - </td><td width='162' style='font-weight:bold; display:inline;font-size:12px;'>%@</td></tr><tr><td width='417' style='font-weight:bold; display:inline;font-size:12px;'>I would like to meet with a lactation consultant - </td><td width='162' style='font-weight:bold; display:inline;font-size:12px;'>%@</td></tr><tr><td width='417' style='font-weight:bold; display:inline;font-size:12px;'><span style='font-weight:bold; display:inline; font-size:16px; color:#FF00FF;'>Straight after the birth I would like to eat - </span></td><td width='162' style='font-weight:bold; display:inline;font-size:12px;'>%@</td></tr><tr><td width='417' style='font-weight:bold; display:inline;font-size:12px;'><span style='font-weight:bold; display:inline; font-size:16px; color:#FF00FF;'>After the birth I will allow the following family members/friends </span></td><td width='162' style='font-weight:bold; display:inline;font-size:12px;'>&nbsp;</td></tr><tr><td style='font-weight:bold; display:inline;font-size:12px;'><span style='font-weight:bold; display:inline; font-size:16px; color:#FF00FF;'>in to see me and the baby - </span></td><td style='font-weight:bold; display:inline;font-size:12px;'>%@</td></tr><tr><td width='617' style='font-weight:bold; display:inline;font-size:12px;'><span style='font-weight:bold; display:inline;font-size:18px;color:#FF00FF;'>In the event that baby requires special care due to trauma or illness</span></td><td width='162' style='font-weight:bold; display:inline;font-size:12px;'>&nbsp;</td></tr><tr><td width='417' style='font-weight:bold; display:inline;font-size:12px;'>I would like to breastfeed/pump breast milk - </td><td width='162' style='font-weight:bold; display:inline;font-size:12px;'>%@</td></tr><tr><td style='font-weight:bold; display:inline;font-size:12px;'>Birth-partner will accompany baby if transferred to another hospital - </td><td style='font-weight:bold; display:inline;font-size:12px;'>%@</td></tr><tr><td width='417' style='font-weight:bold; display:inline;font-size:12px;'>I would like to be transferred to baby's hospital - </td><td width='162' style='font-weight:bold; display:inline;font-size:12px;'>%@</td></tr><tr><td style='font-weight:bold; display:inline;font-size:12px;'></td><td style='font-weight:bold; display:inline;font-size:12px;'>&nbsp;</td></tr><tr><td width='417' style='font-weight:bold; display:inline;font-size:12px;'><span style='font-weight:bold; display:inline;font-size:18px;color:#FF00FF;'>Tip:</span>It might be useful for you and your birth partner to agree on a special word which you can say if you are not happy with something that is happening but find it hard to verbalise it.You can easily change your mind during labour, but it is not always easy to get your point across.</td><td width='162' style='font-weight:bold; display:inline;font-size:12px;'>&nbsp;</td></tr><tr><td style='font-weight:bold; display:inline;font-size:12px;'>&nbsp;</td><td style='font-weight:bold; display:inline;font-size:12px;'>&nbsp;</td></tr><tr><td width='417' style='font-weight:bold; display:inline;font-size:12px;'><span style='font-weight:bold; display:inline; font-size:16px; color:#FF00FF;'>Anything else you would like to add - </span></td><td width='162' style='font-weight:bold; display:inline;font-size:12px;'>%@</td></tr><tr><td width='417' style='font-weight:bold; display:inline;font-size:12px;'><span style='font-weight:bold; display:inline; font-size:16px; color:#FF00FF;'>Cord Blood Donation Information (Please add any information</span></td><td width='162' style='font-weight:bold; display:inline;font-size:12px;'>&nbsp;</td></tr><tr><td style='font-weight:bold; display:inline;font-size:12px;'><span style='font-weight:bold; display:inline; font-size:16px; color:#FF00FF;'>if you are donating your baby’s cord blood stem cells) - </span></td><td style='font-weight:bold; display:inline;font-size:12px;'>%@</td></tr><tr><td style='font-weight:bold; display:inline;font-size:12px;'></td><td style='font-weight:bold; display:inline;font-size:12px;'>&nbsp;</td></tr><tr><td style='font-weight:bold; display:inline;font-size:12px;'>Date : </td><td style='font-weight:bold; display:inline;font-size:12px;'>%@</td></tr><tr><td style='font-weight:bold; display:inline;font-size:12px;'>Signature</td><td style='font-weight:bold; display:inline;font-size:12px;'></td></tr><tr><td style='font-weight:bold; display:inline;font-size:12px;'>&nbsp;</td><td style='font-weight:bold; display:inline;font-size:12px;'></td></tr></table></td></tr></table></body></html>",C1str,C2str,C3str,C4str,C5str,t1,t2,C6str,C7str,C8str,t3,t4,t6];

    
    //create email
    MFMailComposeViewController *mail = [[MFMailComposeViewController alloc] init];
    
    mail.mailComposeDelegate = self;
    NSData *UIImageJPEGRepresentation(UIImage *image, CGFloat compressionQuality);
    
    if ([MFMailComposeViewController canSendMail]) {
        
        //Setting up the Subject, recipients, and message body.
        
        // [mail setToRecipients:[NSArray arrayWithObjects:@"dhanasekar.gunabalan@groupfmg.com",nil]];
        
        [mail setSubject:@"My birth plan part4"];
        // [mail addAttachmentData:UIImageJPEGRepresentation(imageView.image,0.5) mimeType:@"image/png" fileName:@"gurgle.png"];
        [mail setMessageBody:emailBody2 isHTML:YES];
        
        //Present the mail view controller
        
        [self presentModalViewController:mail animated:YES];
        self.view.userInteractionEnabled = YES;
    }
}

- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error

{
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
            [self Storedata];
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
            [self Storedata];
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
    [self Cleardata];
    [self Storedata];
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
    [self Storedata];
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
			if (responder == T1) {
				[T6 becomeFirstResponder];
			} else if (responder == T2) {
				[T1 becomeFirstResponder];
			} else if (responder == T3) {
				[T2 becomeFirstResponder];
			}else if (responder == T4) {
				[T3 becomeFirstResponder];
//			}else if (responder == T5) {
//				[T4 becomeFirstResponder];
			}else if (responder == T6) {
				[T4 becomeFirstResponder];
			}
			break;
		case 1:
			// next
			if (responder == T1) {
				[T2 becomeFirstResponder];
			} else if (responder == T2) {
				[T3 becomeFirstResponder];
			} else if (responder == T3) {
				[T4 becomeFirstResponder];
			}
			else if (responder == T4) {
				[T6 becomeFirstResponder];
			}
//            else if (responder == T5) {
//				[T6 becomeFirstResponder];
//			}
            else if (responder == T6) {
				[T1 becomeFirstResponder];
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
    rc = [textField convertRect:rc toView:scrollview4];
    pt = rc.origin;
    pt.x = 0;
    pt.y -= 1;
    [scrollview4 setContentOffset:pt animated:YES];
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
    rc = [textField convertRect:rc toView:scrollview4];
    pt = rc.origin;
    pt.x = 0;
    pt.y -= 1;
    [scrollview4 setContentOffset:pt animated:YES];
	return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    //[[NSUserDefaults standardDefaults] setObject:textField.text forKey:@"name_post"];
    
    if (textField == T1) {
        [T2 becomeFirstResponder];
    } else if (textField == T2) {
        [T3 becomeFirstResponder];
    } else if (textField == T3) {
        [T4 becomeFirstResponder];
    }
    else if (textField == T4) {
        [T6 becomeFirstResponder];
    }
//    else if (textField == T5) {
//        [T6 becomeFirstResponder];
//    }
    else if (textField == T6) {
        [T1 becomeFirstResponder];
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




- (IBAction)Button1:(id)sender {
    action1 = 1;
    if (checkboxSelected1 == 0){
		[Button1 setSelected:YES];
		checkboxSelected1 = 1;
	} else {
		[Button1 setSelected:NO];
		checkboxSelected1 = 0;
	}
}

- (IBAction)Button2:(id)sender {
    action2 = 1;
    if (checkboxSelected2 == 0){
		[Button2 setSelected:YES];
		checkboxSelected2 = 1;
	} else {
		[Button2 setSelected:NO];
		checkboxSelected2 = 0;
	}
}

- (IBAction)Button3:(id)sender {
    action3 = 1;
    if (checkboxSelected3 == 0){
		[Button3 setSelected:YES];
		checkboxSelected3 = 1;
	} else {
		[Button3 setSelected:NO];
		checkboxSelected3 = 0;
	}
}

- (IBAction)Button4:(id)sender {
    action4 = 1;
    if (checkboxSelected4 == 0){
		[Button4 setSelected:YES];
		checkboxSelected4 = 1;
	} else {
		[Button4 setSelected:NO];
		checkboxSelected4 = 0;
	}
}

- (IBAction)Button5:(id)sender {
    action5 = 1;
    if (checkboxSelected5 == 0){
		[Button5 setSelected:YES];
		checkboxSelected5 = 1;
	} else {
		[Button5 setSelected:NO];
		checkboxSelected5 = 0;
	}
}

- (IBAction)Button6:(id)sender {
    action6 = 1;
    if (checkboxSelected6 == 0){
		[Button6 setSelected:YES];
		checkboxSelected6 = 1;
	} else {
		[Button6 setSelected:NO];
		checkboxSelected6 = 0;
	}
}
- (IBAction)Button7:(id)sender {
    action7 = 1;
    if (checkboxSelected7 == 0){
		[Button7 setSelected:YES];
		checkboxSelected7 = 1;
	} else {
		[Button7 setSelected:NO];
		checkboxSelected7 = 0;
	}
}
- (IBAction)Button8:(id)sender {
    action8 = 1;
    if (checkboxSelected8 == 0){
		[Button8 setSelected:YES];
		checkboxSelected8 = 1;
	} else {
		[Button8 setSelected:NO];
		checkboxSelected8 = 0;
	}
}

- (IBAction)showBirthplanInfoView:(id)sender
{
    BirthplaninfoViewController *BirthplaninfoView = [[BirthplaninfoViewController alloc] initWithNibName:@"BirthplaninfoViewController" bundle:nil];
    BirthplaninfoView.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentModalViewController:BirthplaninfoView animated:YES];
}

- (IBAction)showmyBirthplan:(id)sender
{
    [self Storedata];
    myBirthplanViewController *myBirthplanView = [[myBirthplanViewController alloc] initWithNibName:@"myBirthplanViewController" bundle:nil];
    myBirthplanView.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentModalViewController:myBirthplanView animated:YES];
    //[self.view addSubview:questionnaire.view];
}
- (IBAction)showPart1DetailView:(id)sender
{
    Part1DetailViewController *Part1DetailView = [[Part1DetailViewController alloc] initWithNibName:@"Part1DetailViewController" bundle:nil];
    Part1DetailView.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentModalViewController:Part1DetailView animated:YES];
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

- (IBAction)showBirthplanView:(id)sender
{
    BirthplanViewController *BirthplanView = [[BirthplanViewController alloc] initWithNibName:@"BirthplanViewController" bundle:nil];
    BirthplanView.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentModalViewController:BirthplanView animated:YES];
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
