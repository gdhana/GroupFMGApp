//
//  Part3DetailViewController.m
//  Gurgle
//
//  Created by Dhanasekar Gunabalan on 6/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Part3DetailViewController.h"
#import "BirthplaninfoViewController.h"
#import "myBirthplanViewController.h"
#import "Part1DetailViewController.h"
#import "Part2DetailViewController.h"
#import "Part4DetailViewController.h"

#import "BirthplanViewController.h"
#import "ToolsViewController.h"
#import "FunViewController.h"
#import "HelpViewController.h"

#import "firstResponder.h"

#import "GurgleAdViewController.h"

//#define YES             (BOOL)1
//#define NO              (BOOL)0

#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

BOOL action1,action2,action3,action4,action5,action6,action7,action8,action9,action10,action11,action12,action13,action14,action15,action16,action17,action18,action19,action20;
BOOL action21,action23,action24;

@interface Part3DetailViewController ()

@end

@implementation Part3DetailViewController

@synthesize nextPreviousControl;
@synthesize keyboardToolbar;
@synthesize T1,T2;
@synthesize Fields;
@synthesize Clickbuttons;

//- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
//{
//    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
//    if (self) {
//        // Custom initialization
//    }
//    return self;
//}
//
- (void)viewDidLoad
{
//    bottombanner.animationImages = [NSArray arrayWithObjects: 
//                                    [UIImage imageNamed:@"huggies_banner.png"],                              
//                                    [UIImage imageNamed:@"Banner1.jpg"],[UIImage imageNamed:@"Banner2.jpg"],[UIImage imageNamed:@"Banner3.jpg"],[UIImage imageNamed:@"Banner4.jpg"],[UIImage imageNamed:@"Banner5.jpg"], nil];
//    bottombanner.animationDuration = 25.0; // seconds
//    bottombanner.animationRepeatCount = 0; //0 loops for ever/noted
//    [bottombanner startAnimating];
    
    [scrollview3 setScrollEnabled:YES];
    [scrollview3 setContentSize:CGSizeMake(198, 1835)];
  
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    // get paths from root direcory
	NSArray *paths = NSSearchPathForDirectoriesInDomains (NSDocumentDirectory, NSUserDomainMask, YES);
	// get documents path
	NSString *documentsPath = [paths objectAtIndex:0];
	// get the path to our Data/plist file
	NSString *plistPath = [documentsPath stringByAppendingPathComponent:@"P3TextData.plist"];
	
	// check to see if Data.plist exists in documents
	if (![[NSFileManager defaultManager] fileExistsAtPath:plistPath]) 
	{
		// if not in documents, get property list from main bundle
		plistPath = [[NSBundle mainBundle] pathForResource:@"P3TextData" ofType:@"plist"];
	}
	
	// read property list into memory as an NSData object
	NSData *plistXML = [[NSFileManager defaultManager] contentsAtPath:plistPath];
	NSString *errorDesc = nil;
	NSPropertyListFormat format;
	// convert static property liost into dictionary object
	NSDictionary *temp = (NSDictionary *)[NSPropertyListSerialization propertyListFromData:plistXML mutabilityOption:kCFPropertyListMutableContainers format:&format errorDescription:&errorDesc];
	if (!temp) 
	{
		NSLog(@"Error reading P3TextData plist: %@, format: %d", errorDesc, format);
	}
   	// assign values
	self.Fields = [NSMutableArray arrayWithArray:[temp objectForKey:@"Fields3"]];
	T1.text = [Fields objectAtIndex:0];
    T2.text = [Fields objectAtIndex:1];
    
    self.Clickbuttons = [NSMutableArray arrayWithArray:[temp objectForKey:@"Click3"]];
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
    [Button9 setSelected:[[Clickbuttons objectAtIndex:8]boolValue]];
    checkboxSelected9 = [[Clickbuttons objectAtIndex:8]boolValue];
    [Button91 setSelected:[[Clickbuttons objectAtIndex:9]boolValue]];
    checkboxSelected91 = [[Clickbuttons objectAtIndex:9]boolValue];
    [Button10 setSelected:[[Clickbuttons objectAtIndex:10]boolValue]];
    checkboxSelected10 = [[Clickbuttons objectAtIndex:10]boolValue];
    [Button11 setSelected:[[Clickbuttons objectAtIndex:11]boolValue]];
    checkboxSelected11 = [[Clickbuttons objectAtIndex:11]boolValue];
    [Button12 setSelected:[[Clickbuttons objectAtIndex:12]boolValue]];
    checkboxSelected12 = [[Clickbuttons objectAtIndex:12]boolValue];
    [Button13 setSelected:[[Clickbuttons objectAtIndex:13]boolValue]];
    checkboxSelected13 = [[Clickbuttons objectAtIndex:13]boolValue];
    [Button14 setSelected:[[Clickbuttons objectAtIndex:14]boolValue]];
    checkboxSelected14 = [[Clickbuttons objectAtIndex:14]boolValue];
    [Button15 setSelected:[[Clickbuttons objectAtIndex:15]boolValue]];
    checkboxSelected15 = [[Clickbuttons objectAtIndex:15]boolValue];
    [Button16 setSelected:[[Clickbuttons objectAtIndex:16]boolValue]];
    checkboxSelected16 = [[Clickbuttons objectAtIndex:16]boolValue];
    [Button17 setSelected:[[Clickbuttons objectAtIndex:17]boolValue]];
    checkboxSelected17 = [[Clickbuttons objectAtIndex:17]boolValue];
    [Button18 setSelected:[[Clickbuttons objectAtIndex:18]boolValue]];
    checkboxSelected18 = [[Clickbuttons objectAtIndex:18]boolValue];
    [Button19 setSelected:[[Clickbuttons objectAtIndex:19]boolValue]];
    checkboxSelected19 = [[Clickbuttons objectAtIndex:19]boolValue];
    [Button20 setSelected:[[Clickbuttons objectAtIndex:20]boolValue]];
    checkboxSelected20 = [[Clickbuttons objectAtIndex:20]boolValue];
    [Button21 setSelected:[[Clickbuttons objectAtIndex:21]boolValue]];
    checkboxSelected21 = [[Clickbuttons objectAtIndex:21]boolValue];
    [Button22 setSelected:[[Clickbuttons objectAtIndex:22]boolValue]];
    checkboxSelected22 = [[Clickbuttons objectAtIndex:22]boolValue];
    [Button23 setSelected:[[Clickbuttons objectAtIndex:23]boolValue]];
    checkboxSelected23 = [[Clickbuttons objectAtIndex:23]boolValue];
    [Button24 setSelected:[[Clickbuttons objectAtIndex:24]boolValue]];
    checkboxSelected24 = [[Clickbuttons objectAtIndex:24]boolValue];
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
    Button9 = nil;
    Button91 = nil;
    Button10 = nil;
    Button11 = nil;
    Button12 = nil;
    Button13 = nil;
    Button14 = nil;
    Button15 = nil;
    Button16 = nil;
    Button17 = nil;
    Button18 = nil;
    Button19 = nil;
    Button20 = nil;
    Button21 = nil;
    Button22 = nil;
    Button23 = nil;
    Button24 = nil;
   // Button25 = nil;
    bottombanner = nil;
    T1 = nil;
    
    [self setT1:nil];
    
    Spinner = nil;
    Topbanner = nil;
    [self Storedata];
   
    T2 = nil;
    [self setT2:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (IBAction)dismissKeyboard:(id)sender
{
	[[self.view findFirstResponder] resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
//        [T1 resignFirstResponder];
//    	return NO;
    
    if (textField == T1) {
        [T2 becomeFirstResponder];
    } else if (textField == T2) {
        [T1 becomeFirstResponder];
    }
    return NO;
}

//- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
//    
//    if([text isEqualToString:@"\n"]) {
//        [T1 resignFirstResponder];
//        return NO;
//    }
//    
//    return YES;
//}
- (IBAction)nextPrevious:(id)sender
{
	UIView *responder = [self.view findFirstResponder];
	
	switch([(UISegmentedControl *)sender selectedSegmentIndex]) {
		case 0:
			// previous
			if (responder == T1) {
				[T2 becomeFirstResponder];
			} else if (responder == T2) {
				[T1 becomeFirstResponder];
			}
            break;
		case 1:
			// next
			if (responder == T1) {
				[T2 becomeFirstResponder];
			} else if (responder == T2) {
				[T1 becomeFirstResponder];
			}
            break;
	}
}

#pragma mark -
#pragma mark UITextFieldDelegate


- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
	keyboardToolbarShouldHide = NO;
    CGPoint pt;
    CGRect rc = [textField bounds];
    rc = [textField convertRect:rc toView:scrollview3];
    pt = rc.origin;
    pt.x = 0;
    pt.y += 1;
    [scrollview3 setContentOffset:pt animated:YES];
	//DebugLog(@"textFieldShouldBeginEditing: %@",textField);
	return YES;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
	//DebugLog(@"textFieldShouldEndEditing: %@",textField);
    keyboardToolbarShouldHide = YES;
    CGPoint pt;
    CGRect rc = [textField bounds];
    rc = [textField convertRect:rc toView:scrollview3];
    pt = rc.origin;
    pt.x = 0;
    pt.y -= 1;
    [scrollview3 setContentOffset:pt animated:YES];
	return YES;
}

- (IBAction)buttonSavePressed:(id)sender
{
   
    [[self.view findFirstResponder] resignFirstResponder];
    // make sure all fields are have something in them
    if (T1.text.length  > 0 && T1.text.length  > 0 && checkboxSelected1 == 1 && checkboxSelected2 == 1 && checkboxSelected3 == 1 && checkboxSelected4 == 1 && checkboxSelected5 == 1 && checkboxSelected6 == 1 && checkboxSelected7 == 1 && checkboxSelected8 == 1 && checkboxSelected9 == 1 && checkboxSelected10 == 1 && checkboxSelected11 == 1 && checkboxSelected12 == 1 && checkboxSelected13 == 1 && checkboxSelected14 == 1 && checkboxSelected15 == 1 && checkboxSelected16 == 1 && checkboxSelected17 == 1 && checkboxSelected18 == 1 && checkboxSelected19 == 1 && checkboxSelected20 == 1 && checkboxSelected21 == 1 && checkboxSelected23 == 1 && checkboxSelected24 == 1) {
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
////        myBirthplanViewController *myBirthplanView = [[myBirthplanViewController alloc] initWithNibName:@"myBirthplanViewController" bundle:nil];
////        myBirthplanView.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
////        [self presentModalViewController:myBirthplanView animated:YES];
//        //  [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.examplesite1.com"]];
//    }
}

-(void) Cleardata
{
    T1.text = @"";T2.text = @"";
    checkboxSelected1 = NO;checkboxSelected2 = NO;checkboxSelected3 = NO;checkboxSelected4 = NO;checkboxSelected5 = NO;checkboxSelected6 = NO;checkboxSelected7 = NO;
    checkboxSelected8 = NO;checkboxSelected9 = NO;checkboxSelected10 = NO;checkboxSelected11 = NO;checkboxSelected12 = NO;checkboxSelected13 = NO;
    checkboxSelected14 = NO;checkboxSelected15 = NO;checkboxSelected16 = NO;checkboxSelected17 = NO;checkboxSelected18 = NO;checkboxSelected19 = NO;checkboxSelected20 = NO;
    checkboxSelected21 = NO;checkboxSelected23 = NO;checkboxSelected24 = NO;
}


-(void) Storedata
{
    // get paths from root direcory
    NSArray *paths = NSSearchPathForDirectoriesInDomains (NSDocumentDirectory, NSUserDomainMask, YES);
    // get documents path
    NSString *documentsPath = [paths objectAtIndex:0];
    // get the path to our Data/plist file
    NSString *plistPath = [documentsPath stringByAppendingPathComponent:@"P3TextData.plist"];
    
    // set the variables to the values in the text fields
   
    self.Fields = [[NSMutableArray alloc] initWithCapacity:2];
    [Fields addObject:T1.text];
    [Fields addObject:T2.text];
    self.Clickbuttons = [[NSMutableArray alloc] initWithCapacity:25];
    [Clickbuttons addObject: [NSNumber numberWithBool:checkboxSelected1]];
    [Clickbuttons addObject: [NSNumber numberWithBool:checkboxSelected2]];
    [Clickbuttons addObject: [NSNumber numberWithBool:checkboxSelected3]];
    [Clickbuttons addObject: [NSNumber numberWithBool:checkboxSelected4]];
    [Clickbuttons addObject: [NSNumber numberWithBool:checkboxSelected5]];
    [Clickbuttons addObject: [NSNumber numberWithBool:checkboxSelected6]];
    [Clickbuttons addObject: [NSNumber numberWithBool:checkboxSelected7]];
    [Clickbuttons addObject: [NSNumber numberWithBool:checkboxSelected8]];
    [Clickbuttons addObject: [NSNumber numberWithBool:checkboxSelected9]];
    [Clickbuttons addObject: [NSNumber numberWithBool:checkboxSelected91]];
    [Clickbuttons addObject: [NSNumber numberWithBool:checkboxSelected10]];
    [Clickbuttons addObject: [NSNumber numberWithBool:checkboxSelected11]];
    [Clickbuttons addObject: [NSNumber numberWithBool:checkboxSelected12]];
    [Clickbuttons addObject: [NSNumber numberWithBool:checkboxSelected13]];
    [Clickbuttons addObject: [NSNumber numberWithBool:checkboxSelected14]];
    [Clickbuttons addObject: [NSNumber numberWithBool:checkboxSelected15]];
    [Clickbuttons addObject: [NSNumber numberWithBool:checkboxSelected16]];
    [Clickbuttons addObject: [NSNumber numberWithBool:checkboxSelected17]];
    [Clickbuttons addObject: [NSNumber numberWithBool:checkboxSelected18]];
    [Clickbuttons addObject: [NSNumber numberWithBool:checkboxSelected19]];
    [Clickbuttons addObject: [NSNumber numberWithBool:checkboxSelected20]];
    [Clickbuttons addObject: [NSNumber numberWithBool:checkboxSelected21]];
    [Clickbuttons addObject: [NSNumber numberWithBool:checkboxSelected22]];
    [Clickbuttons addObject: [NSNumber numberWithBool:checkboxSelected23]];
    [Clickbuttons addObject: [NSNumber numberWithBool:checkboxSelected24]];

    
    NSDictionary *plistDict = [NSDictionary dictionaryWithObjects: [NSArray arrayWithObjects: Clickbuttons,Fields, nil] forKeys:[NSArray arrayWithObjects: @"Click3",@"Fields3", nil]];
    
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
        NSLog(@"Error in P3TextData saveData: %@", error);
        // [error release];
    }
}

- (void) Emailsend 
{
    NSString *t1 = T1.text;NSString *t2 = T2.text;
//    BOOL c1 =checkboxSelected1;BOOL c2 =checkboxSelected2;BOOL c3 =checkboxSelected3;BOOL c4 =checkboxSelected4;BOOL c5 =checkboxSelected5;BOOL c6 =checkboxSelected6;
//    BOOL c7 =checkboxSelected7;BOOL c8 =checkboxSelected8;BOOL c9 =checkboxSelected9;BOOL c10 =checkboxSelected10;BOOL c11 =checkboxSelected11;BOOL c12 =checkboxSelected12;
//    BOOL c13 =checkboxSelected13;BOOL c14 =checkboxSelected14;BOOL c15 =checkboxSelected15;BOOL c16 =checkboxSelected16;BOOL c17 =checkboxSelected17;BOOL c18 =checkboxSelected18;
//    BOOL c19 =checkboxSelected19;BOOL c20 =checkboxSelected20;BOOL c21 =checkboxSelected21;BOOL c22 =checkboxSelected22;BOOL c23 =checkboxSelected23;BOOL c24 =checkboxSelected24;
//    //    BOOL c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13,c14,c15,c16,c17,c18,c19,c20,c21,c22,c23,c24,c25,c26,c27,c28,c30,c31,c32,c33,c34,c35,c36,c37,c38,c39,c40,c41,c42,c43;
//    NSString *emailBody =[NSString stringWithFormat:@"Your birth plan 3:\n1: %@ ,\n%d ,\n%d ,\n%d ,\n%d ,\n%d ,\n%d ,\n%d ,\n%d ,\n%d ,\n%d ,\n%d ,\n%d ,\n%d ,\n%d ,\n%d ,\n%d ,\n%d ,\n%d ,\n%d ,\n%d ,\n%d ,\n%d ,\n%d ,\n%d ,\n \"Success\".\n\n",t1,c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13,c14,c15,c16,c17,c18,c19,c20,c21,c22,c23,c24]; 
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
//    test_smtp_message.subject = @"My birth plan part3";
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
    NSString *C9str = @"";
    if (action9 == 1) {
        C9str = [NSString stringWithFormat:@"%d", checkboxSelected9];
        if (checkboxSelected9 == 1) {
            C9str = @"YES";
        }else {
            C9str = @"NO";
        }
    }
    NSString *C10str = @"";
    if (action10 == 1) {
        C10str = [NSString stringWithFormat:@"%d", checkboxSelected10];
        if (checkboxSelected10 == 1) {
            C10str = @"YES";
        }else {
            C10str = @"NO";
        }
    }
    NSString *C11str = @"";
    if (action11 == 1) {
        C11str = [NSString stringWithFormat:@"%d", checkboxSelected11];
        if (checkboxSelected11 == 1) {
            C11str = @"YES";
        }else {
            C11str = @"NO";
        }
    }
    NSString *C12str = @"";
    if (action12 == 1) {
        C12str = [NSString stringWithFormat:@"%d", checkboxSelected12];
        if (checkboxSelected12 == 1) {
            C12str = @"YES";
        }else {
            C12str = @"NO";
        }
    }
    NSString *C13str = @"";
    if (action13 == 1) {
        C13str = [NSString stringWithFormat:@"%d", checkboxSelected13];
        if (checkboxSelected13 == 1) {
            C13str = @"YES";
        }else {
            C13str = @"NO";
        }
    }
    NSString *C14str = @"";
    if (action14 == 1) {
        C14str = [NSString stringWithFormat:@"%d", checkboxSelected14];
        if (checkboxSelected14 == 1) {
            C14str = @"YES";
        }else {
            C14str = @"NO";
        }
    }
    NSString *C15str = @"";
    if (action15 == 1) {
        C15str = [NSString stringWithFormat:@"%d", checkboxSelected15];
        if (checkboxSelected15 == 1) {
            C15str = @"YES";
        }else {
            C15str = @"NO";
        }
    }
    NSString *C16str = @"";
    if (action16 == 1) {
        C16str = [NSString stringWithFormat:@"%d", checkboxSelected16];
        if (checkboxSelected16 == 1) {
            C16str = @"YES";
        }else {
            C16str = @"NO";
        }
    }
    NSString *C17str = @"";
    if (action17 == 1) {
        C17str = [NSString stringWithFormat:@"%d", checkboxSelected17];
        if (checkboxSelected17 == 1) {
            C17str = @"YES";
        }else {
            C17str = @"NO";
        }
    }
    NSString *C18str = @"";
    if (action18 == 1) {
        C18str = [NSString stringWithFormat:@"%d", checkboxSelected18];
        if (checkboxSelected18 == 1) {
            C18str = @"YES";
        }else {
            C18str = @"NO";
        }
    }
    NSString *C19str = @"";
    if (action19 == 1) {
        C19str = [NSString stringWithFormat:@"%d", checkboxSelected19];
        if (checkboxSelected19 == 1) {
            C19str = @"YES";
        }else {
            C19str = @"NO";
        }
    }
    NSString *C20str = @"";
    if (action20 == 1) {
        C20str = [NSString stringWithFormat:@"%d", checkboxSelected20];
        if (checkboxSelected20 == 1) {
            C20str = @"YES";
        }else {
            C20str = @"NO";
        }
    }
    NSString *C21str = @"";
    if (action21 == 1) {
        C21str = [NSString stringWithFormat:@"%d", checkboxSelected21];
        if (checkboxSelected21 == 1) {
            C21str = @"YES";
        }else {
            C21str = @"NO";
        }
    }
    NSString *C23str = @"";
    if (action23 == 1) {
        C23str = [NSString stringWithFormat:@"%d", checkboxSelected23];
        if (checkboxSelected23 == 1) {
            C23str = @"YES";
        }else {
            C23str = @"NO";
        }
    }
    NSString *C24str = @"";
    if (action24 == 1) {
        C24str = [NSString stringWithFormat:@"%d", checkboxSelected24];
        if (checkboxSelected24 == 1) {
            C24str = @"YES";
        }else {
            C24str = @"NO";
        }
    }

//    NSString *C1str= (checkboxSelected1 ? @"YES" : @"NO");NSString *C2str= (checkboxSelected2 ? @"YES" : @"NO");NSString *C3str= (checkboxSelected3 ? @"YES" : @"NO");
//    NSString *C4str= (checkboxSelected4 ? @"YES" : @"NO");NSString *C5str= (checkboxSelected5 ? @"YES" : @"NO");NSString *C6str= (checkboxSelected6 ? @"YES" : @"NO");
//    NSString *C7str= (checkboxSelected7 ? @"YES" : @"NO");NSString *C8str= (checkboxSelected8 ? @"YES" : @"NO");NSString *C9str= (checkboxSelected9 ? @"YES" : @"NO");
//    NSString *C91str= (checkboxSelected91 ? @"YES" : @"NO");NSString *C10str= (checkboxSelected10 ? @"YES" : @"NO");NSString *C11str= (checkboxSelected11 ? @"YES" : @"NO");
//    NSString *C12str= (checkboxSelected12 ? @"YES" : @"NO");NSString *C13str= (checkboxSelected13 ? @"YES" : @"NO");NSString *C14str= (checkboxSelected14 ? @"YES" : @"NO");
//    NSString *C15str= (checkboxSelected15 ? @"YES" : @"NO");NSString *C16str= (checkboxSelected16 ? @"YES" : @"NO");NSString *C17str= (checkboxSelected17 ? @"YES" : @"NO");
//    NSString *C18str= (checkboxSelected18 ? @"YES" : @"NO");NSString *C19str= (checkboxSelected19 ? @"YES" : @"NO");NSString *C20str= (checkboxSelected20 ? @"YES" : @"NO");
//    NSString *C21str= (checkboxSelected21 ? @"YES" : @"NO");NSString *C22str= (checkboxSelected22 ? @"YES" : @"NO");NSString *C23str= (checkboxSelected23 ? @"YES" : @"NO");
//    NSString *C24str= (checkboxSelected24 ? @"YES" : @"NO");
    
//    NSString *emailBody2 =[NSString stringWithFormat:@"<html><head><title>My birth plan part3</title></head><body><table width='600' cellpadding='5' cellspacing='0' border='1'><tr><td><table width='600' cellpadding='5' cellspacing='0' border='0' style='border-left:1px solid #00000'><tr><td width='300' style='font-weight:bold; display:inline;font-size:12px;'><span style='font-weight:bold; display:inline;font-size:18px;color:#FF00FF;'>Following delivery of my baby</span></td><td width='300' style='font-weight:bold; display:inline;font-size:12px;'></td></tr><td width='300' style='font-weight:bold; display:inline;font-size:12px;'>I would like my baby placed directly on my chest immediately after delivery</td><td width='300' style='font-weight:bold; display:inline;font-size:12px;'>%@</td></tr><tr><td width='300' style='font-weight:bold; display:inline;font-size:12px;'>I would like my birth partner to be first to hold the baby</td><td width='300' style='font-weight:bold; display:inline;font-size:12px;'>%@</td></tr><tr><td width='300' style='font-weight:bold; display:inline;font-size:12px;'>I would like my birth-partner to cut the cord</td><td width='300' style='font-weight:bold; display:inline;font-size:12px;'>%@</td></tr><tr><td width='300' style='font-weight:bold; display:inline;font-size:12px;'>I would like to cut the cord</td><td width='300' style='font-weight:bold; display:inline;font-size:12px;'>%@</td></tr><tr><td width='300' style='font-weight:bold; display:inline;font-size:12px;'>Birth-partner does not want to cut cord</td><td width='300' style='font-weight:bold; display:inline;font-size:12px;'>%@</td></tr><tr><td width='300' style='font-weight:bold; display:inline;font-size:12px;'>I would like to hold the baby while the placenta is delivered</td><td width='300' style='font-weight:bold; display:inline;font-size:12px;'>%@</td></tr><tr><td width='300' style='font-weight:bold; display:inline;font-size:12px;'>I would like the placenta to be delivered naturally</td><td width='300' style='font-weight:bold; display:inline;font-size:12px;'>%@</td></tr><tr><td width='300' style='font-weight:bold; display:inline;font-size:12px;'>I would like the baby to be examined in my presence</td><td width='300' style='font-weight:bold; display:inline;font-size:12px;'>%@</td></tr><tr><td width='300' style='font-weight:bold; display:inline;font-size:12px;'>If the baby cannot be examined in my presence, I would like my</td><td width='300' style='font-weight:bold; display:inline;font-size:12px;'></td></tr><tr><td width='300' height='24' style='font-weight:bold; display:inline; font-size:12px;'><span style='font-weight:bold; display:inline;font-size:12px;'>Birth-partner to remain with the baby at all times</span></td><td><span style='font-weight:bold; display:inline;font-size:12px;'>%@</span></td></tr><tr><td width='300' style='font-weight:bold; display:inline;font-size:12px;'>I would like to see the placenta after the birth</td><td width='300' style='font-weight:bold; display:inline;font-size:12px;'>%@</td></tr><tr><td width='300' style='font-weight:bold; display:inline;font-size:12px;'>I would like my baby cleaned before being handed to me</td><td width='300' style='font-weight:bold; display:inline;font-size:12px;'>%@</td></tr><tr><td width='300' style='font-weight:bold; display:inline;font-size:12px;'>I would like my baby handed to me straight away without being cleaned</td><td width='300' style='font-weight:bold; display:inline;font-size:12px;'>%@</td></tr><tr><td width='300' style='font-weight:bold; display:inline;font-size:12px;'>I do not want to know the sex of my baby - I would like to find out myself</td><td width='300' style='font-weight:bold; display:inline;font-size:12px;'>%@</td></tr><tr><td style='font-weight:bold; display:inline;font-size:12px;'><span style='font-weight:bold; display:inline;font-size:14px;color:#FF00FF;'>Assisted Delivery</span></td><td style='font-weight:bold; display:inline;font-size:12px;'></td></tr><tr><td style='font-weight:bold; display:inline;font-size:12px;'>If additional medical assistance is required for<br>the birth, I would prefer:</td></tr><tr><td style='font-weight:bold; display:inline;font-size:12px;'>assisted delivery - forceps</td><td style='font-weight:bold; display:inline;font-size:12px;'>%@</td></tr><tr><td style='font-weight:bold; display:inline;font-size:12px;'>assisted delivery - ventouse</td><td style='font-weight:bold; display:inline;font-size:12px;'>%@</td></tr><tr><td style='font-weight:bold; display:inline;font-size:12px;'>caesarean section</td><td style='font-weight:bold; display:inline;font-size:12px;'>%@</td></tr><tr><td style='font-weight:bold; display:inline;font-size:12px;'><span style='font-weight:bold; display:inline;font-size:14px;color:#FF00FF;'>Vitamin K</span></td><td style='font-weight:bold; display:inline;font-size:12px;'></td></tr><tr><td style='font-weight:bold; display:inline;font-size:12px;'>I would like my baby to have the single<br>injection of Vitamin K</td><td style='font-weight:bold; display:inline;font-size:12px;'>%@</td></tr><tr><td style='font-weight:bold; display:inline;font-size:12px;'>I would like my baby to have oral Vitamin K</td><td style='font-weight:bold; display:inline;font-size:12px;'>%@</td></tr><tr><td style='font-weight:bold; display:inline;font-size:12px;'>I do not want my baby to have Vitamin K</td><td style='font-weight:bold; display:inline;font-size:12px;'>%@</td></tr><tr><td style='font-weight:bold; display:inline;font-size:12px;'><span style='font-weight:bold; display:inline;font-size:14px;color:#FF00FF;'>Caesarean</span></td><td style='font-weight:bold; display:inline;font-size:12px;'></td></tr><tr><td style='font-weight:bold; display:inline;font-size:12px;'>In the event that a cesarean section is deemed necessary, I would like the following:</td></tr><tr><td style='font-weight:bold; display:inline;font-size:12px;'>Birth-partner present</td><td style='font-weight:bold; display:inline;font-size:12px;'>%@</td></tr><tr><td style='font-weight:bold; display:inline;font-size:12px;'>Other support present</td><td style='font-weight:bold; display:inline;font-size:12px;'>%@</td></tr><tr><td style='font-weight:bold; display:inline;font-size:12px;'>Photos / video</td><td style='font-weight:bold; display:inline;font-size:12px;'>%@</td></tr><tr><td style='font-weight:bold; display:inline;font-size:12px;'>Screen lowered at delivery</td><td style='font-weight:bold; display:inline;font-size:12px;'>%@</td></tr><tr><td style='font-weight:bold; display:inline;font-size:12px;'>I would like the procedure describedas it is happening</td><td style='font-weight:bold; display:inline;font-size:12px;'>%@</td></tr><tr><td style='font-weight:bold; display:inline;font-size:12px;'>Anything else</td><td style='font-weight:bold; display:inline;font-size:12px;'>%@</td></tr></table></td></tr></table></body></html>",C1str,C2str,C3str,C4str,C5str,C6str,C7str,C8str,C9str,C10str,C11str,C12str,C13str,C14str,C15str,C16str,C17str,C18str,C19str,C20str,C21str,t2,C23str,C24str,t1];
    
    NSString *emailBody2 =[NSString stringWithFormat:@"<html><head><title>My birth plan part3</title></head><body><table width='600' cellpadding='5' cellspacing='0' border='1'><tr><td><table width='600' cellpadding='5' cellspacing='0' border='0' style='border-left:1px solid #00000'><tr><td width='462' style='font-weight:bold; display:inline;font-size:12px;'><span style='font-weight:bold; display:inline;font-size:18px;color:#FF00FF;'>Following delivery of my baby</span></td><td width='117' style='font-weight:bold; display:inline;font-size:12px;'></td></tr><tr><td style='font-weight:bold; display:inline;font-size:12px;'>&nbsp;</td><td style='font-weight:bold; display:inline;font-size:12px;'>&nbsp;</td></tr><td width='462' style='font-weight:bold; display:inline;font-size:12px;'>I would like my baby placed directly on my chest immediately after delivery - </td><td width='117' style='font-weight:bold; display:inline;font-size:12px;'>%@</td></tr><tr><td width='462' style='font-weight:bold; display:inline;font-size:12px;'>I would like my birth partner to be first to hold the baby - </td><td width='117' style='font-weight:bold; display:inline;font-size:12px;'>%@</td></tr><tr><td width='462' style='font-weight:bold; display:inline;font-size:12px;'>I would like my birth-partner to cut the cord - </td><td width='117' style='font-weight:bold; display:inline;font-size:12px;'>%@</td></tr><tr><td width='462' style='font-weight:bold; display:inline;font-size:12px;'>I would like to cut the cord - </td><td width='117' style='font-weight:bold; display:inline;font-size:12px;'>%@</td></tr><tr><td width='462' style='font-weight:bold; display:inline;font-size:12px;'>Birth-partner does not want to cut cord - </td><td width='117' style='font-weight:bold; display:inline;font-size:12px;'>%@</td></tr><tr><td width='462' style='font-weight:bold; display:inline;font-size:12px;'>I would like to hold the baby while the placenta is delivered - </td><td width='117' style='font-weight:bold; display:inline;font-size:12px;'>%@</td></tr><tr><td width='462' style='font-weight:bold; display:inline;font-size:12px;'>I would like the placenta to be delivered naturally - </td><td width='117' style='font-weight:bold; display:inline;font-size:12px;'>%@</td></tr><tr><td width='462' style='font-weight:bold; display:inline;font-size:12px;'>I would like the baby to be examined in my presence - </td><td width='117' style='font-weight:bold; display:inline;font-size:12px;'>%@</td></tr><tr><td width='462' style='font-weight:bold; display:inline;font-size:12px;'>If the baby cannot be examined in my presence, I would like my Birth-partner to</td><td width='117' style='font-weight:bold; display:inline;font-size:12px;'></td></tr><tr><td width='462' style='font-weight:bold; display:inline;font-size:12px;'>remain with the baby at all times - </td><td><span style='font-weight:bold; display:inline;font-size:12px;'>%@</span></td></tr><tr><td width='462' style='font-weight:bold; display:inline;font-size:12px;'>I would like to see the placenta after the birth - </td><td width='117' style='font-weight:bold; display:inline;font-size:12px;'>%@</td></tr><tr><td width='462' style='font-weight:bold; display:inline;font-size:12px;'>I would like my baby cleaned before being handed to me - </td><td width='117' style='font-weight:bold; display:inline;font-size:12px;'>%@</td></tr><tr><td width='462' style='font-weight:bold; display:inline;font-size:12px;'>I would like my baby handed to me straight away without being cleaned -</td><td width='117' style='font-weight:bold; display:inline;font-size:12px;'>%@</td></tr><tr><td width='462' style='font-weight:bold; display:inline;font-size:12px;'>I do not want to know the sex of my baby - I would like to find out myself - </td><td width='117' style='font-weight:bold; display:inline;font-size:12px;'>%@</td></tr><tr><td style='font-weight:bold; display:inline;font-size:12px;'>&nbsp;</td><td style='font-weight:bold; display:inline;font-size:12px;'></td></tr><tr><td style='font-weight:bold; display:inline;font-size:12px;'><span style='font-weight:bold; display:inline;font-size:14px;color:#FF00FF;'>Assisted Delivery</span></td><td style='font-weight:bold; display:inline;font-size:12px;'></td></tr><tr><td style='font-weight:bold; display:inline;font-size:12px;'>If additional medical assistance is required for the birth, I would prefer:</td></tr><tr><td style='font-weight:bold; display:inline;font-size:12px;'>assisted delivery - forceps - </td><td style='font-weight:bold; display:inline;font-size:12px;'>%@</td></tr><tr><td style='font-weight:bold; display:inline;font-size:12px;'>assisted delivery - ventouse - </td><td style='font-weight:bold; display:inline;font-size:12px;'>%@</td></tr><tr><td style='font-weight:bold; display:inline;font-size:12px;'>caesarean section - </td><td style='font-weight:bold; display:inline;font-size:12px;'>%@</td></tr><tr><td style='font-weight:bold; display:inline;font-size:12px;'>&nbsp;</td><td style='font-weight:bold; display:inline;font-size:12px;'></td></tr><tr><td style='font-weight:bold; display:inline;font-size:12px;'><span style='font-weight:bold; display:inline;font-size:14px;color:#FF00FF;'>Vitamin K</span></td><td style='font-weight:bold; display:inline;font-size:12px;'></td></tr><tr><td style='font-weight:bold; display:inline;font-size:12px;'>I would like my baby to have the single injection of Vitamin K - </td><td style='font-weight:bold; display:inline;font-size:12px;'>%@</td></tr><tr><td style='font-weight:bold; display:inline;font-size:12px;'>I would like my baby to have oral Vitamin K - </td><td style='font-weight:bold; display:inline;font-size:12px;'>%@</td></tr><tr><td style='font-weight:bold; display:inline;font-size:12px;'>I do not want my baby to have Vitamin K - </td><td style='font-weight:bold; display:inline;font-size:12px;'>%@</td></tr><tr><td style='font-weight:bold; display:inline;font-size:12px;'>&nbsp;</td><td style='font-weight:bold; display:inline;font-size:12px;'></td></tr><tr><td style='font-weight:bold; display:inline;font-size:12px;'><span style='font-weight:bold; display:inline;font-size:14px;color:#FF00FF;'>Caesarean</span></td><td style='font-weight:bold; display:inline;font-size:12px;'></td></tr><tr><td style='font-weight:bold; display:inline;font-size:12px;'>In the event that a cesarean section is deemed necessary, I would like the following:</td></tr><tr><td style='font-weight:bold; display:inline;font-size:12px;'>Birth-partner present - </td><td style='font-weight:bold; display:inline;font-size:12px;'>%@</td></tr><tr><td style='font-weight:bold; display:inline;font-size:12px;'>Other support present - </td><td style='font-weight:bold; display:inline;font-size:12px;'>%@</td></tr><tr><td style='font-weight:bold; display:inline;font-size:12px;'>Photos / video - </td><td style='font-weight:bold; display:inline;font-size:12px;'>%@</td></tr><tr><td style='font-weight:bold; display:inline;font-size:12px;'>Screen lowered at delivery - </td><td style='font-weight:bold; display:inline;font-size:12px;'>%@</td></tr><tr><td style='font-weight:bold; display:inline;font-size:12px;'>I would like the procedure describedas it is happening - </td><td style='font-weight:bold; display:inline;font-size:12px;'>%@</td></tr><tr><td style='font-weight:bold; display:inline;font-size:12px;'>Anything else - </td><td style='font-weight:bold; display:inline;font-size:12px;'>%@</td></tr><tr><td style='font-weight:bold; display:inline;font-size:12px;'>&nbsp;</td><td style='font-weight:bold; display:inline;font-size:12px;'>&nbsp;</td></tr></table></td></tr></table></body></html>",C1str,C2str,C3str,C4str,C5str,C6str,C7str,C8str,C9str,C10str,C11str,C12str,C13str,C14str,C15str,C16str,C17str,C18str,C19str,C20str,C21str,t2,C23str,C24str,t1];
    
    //create email
    MFMailComposeViewController *mail = [[MFMailComposeViewController alloc] init];
    
    mail.mailComposeDelegate = self;
    NSData *UIImageJPEGRepresentation(UIImage *image, CGFloat compressionQuality);
    
    if ([MFMailComposeViewController canSendMail]) {
        
        //Setting up the Subject, recipients, and message body.
        
        // [mail setToRecipients:[NSArray arrayWithObjects:@"dhanasekar.gunabalan@groupfmg.com",nil]];
        
        [mail setSubject:@"My birth plan part3"];
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
    //NSLog(@"HighestState:%d", HighestState);
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

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
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
- (IBAction)Button9:(id)sender {
     action9 = 1;
    if (checkboxSelected9 == 0){
		[Button9 setSelected:YES];
		checkboxSelected9 = 1;
	} else {
		[Button9 setSelected:NO];
		checkboxSelected9 = 0;
	}
}

- (IBAction)Button91:(id)sender {
//    if (checkboxSelected91 == 0){
//		[Button91 setSelected:YES];
//		checkboxSelected91 = 1;
//	} else {
//		[Button91 setSelected:NO];
//		checkboxSelected91 = 0;
//	}
}
- (IBAction)Button10:(id)sender {
     action10 = 1;
    if (checkboxSelected10 == 0){
		[Button10 setSelected:YES];
		checkboxSelected10 = 1;
	} else {
		[Button10 setSelected:NO];
		checkboxSelected10 = 0;
	}
}
- (IBAction)Button11:(id)sender {
     action11 = 1;
    if (checkboxSelected11 == 0){
		[Button11 setSelected:YES];
		checkboxSelected11 = 1;
	} else {
		[Button11 setSelected:NO];
		checkboxSelected11 = 0;
	}
}
- (IBAction)Button12:(id)sender {
     action12 = 1;
    if (checkboxSelected12 == 0){
		[Button12 setSelected:YES];
		checkboxSelected12 = 1;
	} else {
		[Button12 setSelected:NO];
		checkboxSelected12 = 0;
	}
}
- (IBAction)Button13:(id)sender {
     action13 = 1;
    if (checkboxSelected13 == 0){
		[Button13 setSelected:YES];
		checkboxSelected13 = 1;
	} else {
		[Button13 setSelected:NO];
		checkboxSelected13 = 0;
	}
}
- (IBAction)Button14:(id)sender {
     action14 = 1;
    if (checkboxSelected14 == 0){
		[Button14 setSelected:YES];
		checkboxSelected14 = 1;
	} else {
		[Button14 setSelected:NO];
		checkboxSelected14 = 0;
	}
}
- (IBAction)Button15:(id)sender {
     action15 = 1;
    if (checkboxSelected15 == 0){
		[Button15 setSelected:YES];
		checkboxSelected15 = 1;
	} else {
		[Button15 setSelected:NO];
		checkboxSelected15 = 0;
	}
}
- (IBAction)Button16:(id)sender {
     action16 = 1;
    if (checkboxSelected16 == 0){
		[Button16 setSelected:YES];
		checkboxSelected16 = 1;
	} else {
		[Button16 setSelected:NO];
		checkboxSelected16 = 0;
	}
}
- (IBAction)Button17:(id)sender {
     action17 = 1;
    if (checkboxSelected17 == 0){
		[Button17 setSelected:YES];
		checkboxSelected17 = 1;
	} else {
		[Button17 setSelected:NO];
		checkboxSelected17 = 0;
	}
}
- (IBAction)Button18:(id)sender {
     action18 = 1;
    if (checkboxSelected18 == 0){
		[Button18 setSelected:YES];
		checkboxSelected18 = 1;
	} else {
		[Button18 setSelected:NO];
		checkboxSelected18 = 0;
	}
}
- (IBAction)Button19:(id)sender {
     action19 = 1;
    if (checkboxSelected19 == 0){
		[Button19 setSelected:YES];
		checkboxSelected19 = 1;
	} else {
		[Button19 setSelected:NO];
		checkboxSelected19 = 0;
	}
}
- (IBAction)Button20:(id)sender {
     action20 = 1;
    if (checkboxSelected20 == 0){
		[Button20 setSelected:YES];
		checkboxSelected20 = 1;
	} else {
		[Button20 setSelected:NO];
		checkboxSelected20 = 0;
	}
}
- (IBAction)Button21:(id)sender {
     action21 = 1;
    if (checkboxSelected21 == 0){
		[Button21 setSelected:YES];
		checkboxSelected21 = 1;
	} else {
		[Button21 setSelected:NO];
		checkboxSelected21 = 0;
	}
}
- (IBAction)Button22:(id)sender {
    
//    if (checkboxSelected22 == 0){
//		[Button22 setSelected:YES];
//		checkboxSelected22 = 1;
//	} else {
//		[Button22 setSelected:NO];
//		checkboxSelected22 = 0;
//	}
}
- (IBAction)Button23:(id)sender {
     action23 = 1;
    if (checkboxSelected23 == 0){
		[Button23 setSelected:YES];
		checkboxSelected23 = 1;
	} else {
		[Button23 setSelected:NO];
		checkboxSelected23 = 0;
	}
}
- (IBAction)Button24:(id)sender {
     action24 = 1;
    if (checkboxSelected24 == 0){
		[Button24 setSelected:YES];
		checkboxSelected24 = 1;
	} else {
		[Button24 setSelected:NO];
		checkboxSelected24 = 0;
	}
}
//- (IBAction)Button25:(id)sender {
//    if (checkboxSelected25 == 0){
//		[Button25 setSelected:YES];
//		checkboxSelected25 = 1;
//	} else {
//		[Button25 setSelected:NO];
//		checkboxSelected25 = 0;
//	}
//}

- (IBAction)showBirthplanInfoView:(id)sender
{
    [self Storedata];
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
    [self Storedata];
    Part1DetailViewController *Part1DetailView = [[Part1DetailViewController alloc] initWithNibName:@"Part1DetailViewController" bundle:nil];
    Part1DetailView.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentModalViewController:Part1DetailView animated:YES];
}

- (IBAction)showPart2DetailView:(id)sender
{
    [self Storedata];
    Part2DetailViewController *Part2DetailView = [[Part2DetailViewController alloc] initWithNibName:@"Part2DetailViewController" bundle:nil];
    Part2DetailView.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentModalViewController:Part2DetailView animated:YES];
}
- (IBAction)showPart4DetailView:(id)sender
{
    [self Storedata];
    Part4DetailViewController *Part4DetailView = [[Part4DetailViewController alloc] initWithNibName:@"Part4DetailViewController" bundle:nil];
    Part4DetailView.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentModalViewController:Part4DetailView animated:YES];
}

- (IBAction)showBirthplanView:(id)sender
{
    [self Storedata];
    BirthplanViewController *BirthplanView = [[BirthplanViewController alloc] initWithNibName:@"BirthplanViewController" bundle:nil];
    BirthplanView.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentModalViewController:BirthplanView animated:YES];
}

- (IBAction)ToolsView:(id)sender
{
    [self Storedata];
    ToolsViewController *ToolsView = [[ToolsViewController alloc] initWithNibName:@"ToolsViewController" bundle:nil];
    ToolsView.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentModalViewController:ToolsView animated:YES];
}
- (IBAction)FunView:(id)sender
{
    [self Storedata];
    FunViewController *FunView = [[FunViewController alloc] initWithNibName:@"FunViewController" bundle:nil];
    FunView.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentModalViewController:FunView animated:YES];
}
- (IBAction)HelpView:(id)sender
{
    [self Storedata];
    HelpViewController *HelpView = [[HelpViewController alloc] initWithNibName:@"HelpViewController" bundle:nil];
    HelpView.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentModalViewController:HelpView animated:YES];
}


@end
