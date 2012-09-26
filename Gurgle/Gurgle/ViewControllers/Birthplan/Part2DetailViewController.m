//
//  Part2DetailViewController.m
//  Gurgle
//
//  Created by Dhanasekar Gunabalan on 6/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
//#define YES             (BOOL)1
//#define NO              (BOOL)0

#import "Part2DetailViewController.h"
#import "BirthplaninfoViewController.h"
#import "myBirthplanViewController.h"
#import "Part1DetailViewController.h"
#import "Part3DetailViewController.h"
#import "Part4DetailViewController.h"
#import "BirthplanViewController.h"
#import "ToolsViewController.h"
#import "FunViewController.h"
#import "HelpViewController.h"

#import "firstResponder.h"

#import "GurgleAdViewController.h"

#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

BOOL action1,action2,action3,action4,action5,action6,action7,action8,action9,action10,action11,action12,action13,action14,action15,action17,action18,action19,action20,action21;
BOOL action22,action23,action24,action25,action26,action27,action28,action29,action30,action31,action32,action33,action34,action35,action36,action37,action38,action39,action40;
BOOL action41,action42,action43;

@interface Part2DetailViewController ()

@end

@implementation Part2DetailViewController

@synthesize nextPreviousControl;
@synthesize keyboardToolbar;
@synthesize Fields;
@synthesize Clickbuttons;

@synthesize T1;
@synthesize T2;
@synthesize T3;
@synthesize T4;
@synthesize T5;


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
    
    [scrollview2 setScrollEnabled:YES];
    [scrollview2 setContentSize:CGSizeMake(298, 3185)];

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
	NSString *plistPath = [documentsPath stringByAppendingPathComponent:@"P2TextData.plist"];
	
	// check to see if Data.plist exists in documents
	if (![[NSFileManager defaultManager] fileExistsAtPath:plistPath]) 
	{
		// if not in documents, get property list from main bundle
		plistPath = [[NSBundle mainBundle] pathForResource:@"P2TextData" ofType:@"plist"];
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
	self.Fields = [NSMutableArray arrayWithArray:[temp objectForKey:@"Fields2"]];
    // NSLog(@"%@",temp);
	// display values
	//nameEntered.text = personName;
	T1.text = [Fields objectAtIndex:0];
	T2.text = [Fields objectAtIndex:1];
	T3.text = [Fields objectAtIndex:2];
    T4.text = [Fields objectAtIndex:3];
    T5.text = [Fields objectAtIndex:4];
    self.Clickbuttons = [NSMutableArray arrayWithArray:[temp objectForKey:@"Click1"]];
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
    [Button10 setSelected:[[Clickbuttons objectAtIndex:9]boolValue]];
    checkboxSelected10 = [[Clickbuttons objectAtIndex:9]boolValue];
    [Button11 setSelected:[[Clickbuttons objectAtIndex:10]boolValue]];
    checkboxSelected11 = [[Clickbuttons objectAtIndex:10]boolValue];
    [Button12 setSelected:[[Clickbuttons objectAtIndex:11]boolValue]];
    checkboxSelected12 = [[Clickbuttons objectAtIndex:11]boolValue];
    [Button13 setSelected:[[Clickbuttons objectAtIndex:12]boolValue]];
    checkboxSelected13 = [[Clickbuttons objectAtIndex:12]boolValue];
    [Button14 setSelected:[[Clickbuttons objectAtIndex:13]boolValue]];
    checkboxSelected14 = [[Clickbuttons objectAtIndex:13]boolValue];
    [Button15 setSelected:[[Clickbuttons objectAtIndex:14]boolValue]];
    checkboxSelected15 = [[Clickbuttons objectAtIndex:14]boolValue];
  //  [Button16 setSelected:[[Clickbuttons objectAtIndex:15]boolValue]];
  //  checkboxSelected16 = [[Clickbuttons objectAtIndex:15]boolValue];
    [Button17 setSelected:[[Clickbuttons objectAtIndex:15]boolValue]];
    checkboxSelected17 = [[Clickbuttons objectAtIndex:15]boolValue];
    [Button18 setSelected:[[Clickbuttons objectAtIndex:16]boolValue]];
    checkboxSelected18 = [[Clickbuttons objectAtIndex:16]boolValue];
    [Button19 setSelected:[[Clickbuttons objectAtIndex:17]boolValue]];
    checkboxSelected19 = [[Clickbuttons objectAtIndex:17]boolValue];
    [Button20 setSelected:[[Clickbuttons objectAtIndex:18]boolValue]];
    checkboxSelected20 = [[Clickbuttons objectAtIndex:18]boolValue];
    [Button21 setSelected:[[Clickbuttons objectAtIndex:19]boolValue]];
    checkboxSelected21 = [[Clickbuttons objectAtIndex:19]boolValue];
    [Button22 setSelected:[[Clickbuttons objectAtIndex:20]boolValue]];
    checkboxSelected22 = [[Clickbuttons objectAtIndex:20]boolValue];
    [Button23 setSelected:[[Clickbuttons objectAtIndex:21]boolValue]];
    checkboxSelected23 = [[Clickbuttons objectAtIndex:21]boolValue];
    [Button24 setSelected:[[Clickbuttons objectAtIndex:22]boolValue]];
    checkboxSelected24 = [[Clickbuttons objectAtIndex:22]boolValue];
    [Button25 setSelected:[[Clickbuttons objectAtIndex:23]boolValue]];
    checkboxSelected25 = [[Clickbuttons objectAtIndex:23]boolValue];
    [Button26 setSelected:[[Clickbuttons objectAtIndex:24]boolValue]];
    checkboxSelected26 = [[Clickbuttons objectAtIndex:24]boolValue];
    [Button27 setSelected:[[Clickbuttons objectAtIndex:25]boolValue]];
    checkboxSelected27 = [[Clickbuttons objectAtIndex:25]boolValue];
    [Button28 setSelected:[[Clickbuttons objectAtIndex:26]boolValue]];
    checkboxSelected28 = [[Clickbuttons objectAtIndex:26]boolValue];
    [Button29 setSelected:[[Clickbuttons objectAtIndex:27]boolValue]];
    checkboxSelected29 = [[Clickbuttons objectAtIndex:27]boolValue];
    [Button30 setSelected:[[Clickbuttons objectAtIndex:28]boolValue]];
    checkboxSelected30 = [[Clickbuttons objectAtIndex:28]boolValue];
    [Button31 setSelected:[[Clickbuttons objectAtIndex:29]boolValue]];
    checkboxSelected31 = [[Clickbuttons objectAtIndex:29]boolValue];
    [Button32 setSelected:[[Clickbuttons objectAtIndex:30]boolValue]];
    checkboxSelected32 = [[Clickbuttons objectAtIndex:30]boolValue];
    [Button33 setSelected:[[Clickbuttons objectAtIndex:31]boolValue]];
    checkboxSelected33 = [[Clickbuttons objectAtIndex:31]boolValue];
    [Button34 setSelected:[[Clickbuttons objectAtIndex:32]boolValue]];
    checkboxSelected34 = [[Clickbuttons objectAtIndex:32]boolValue];
    [Button35 setSelected:[[Clickbuttons objectAtIndex:33]boolValue]];
    checkboxSelected35 = [[Clickbuttons objectAtIndex:33]boolValue];
    [Button36 setSelected:[[Clickbuttons objectAtIndex:34]boolValue]];
    checkboxSelected36 = [[Clickbuttons objectAtIndex:34]boolValue];
    [Button37 setSelected:[[Clickbuttons objectAtIndex:35]boolValue]];
    checkboxSelected37 = [[Clickbuttons objectAtIndex:35]boolValue];
    [Button38 setSelected:[[Clickbuttons objectAtIndex:36]boolValue]];
    checkboxSelected38 = [[Clickbuttons objectAtIndex:36]boolValue];
    [Button39 setSelected:[[Clickbuttons objectAtIndex:37]boolValue]];
    checkboxSelected39 = [[Clickbuttons objectAtIndex:37]boolValue];
    [Button40 setSelected:[[Clickbuttons objectAtIndex:38]boolValue]];
    checkboxSelected40 = [[Clickbuttons objectAtIndex:38]boolValue];
    [Button41 setSelected:[[Clickbuttons objectAtIndex:39]boolValue]];
    checkboxSelected41 = [[Clickbuttons objectAtIndex:39]boolValue];
    [Button42 setSelected:[[Clickbuttons objectAtIndex:40]boolValue]];
    checkboxSelected42 = [[Clickbuttons objectAtIndex:40]boolValue];
    [Button43 setSelected:[[Clickbuttons objectAtIndex:41]boolValue]];
    checkboxSelected43 = [[Clickbuttons objectAtIndex:41]boolValue];

    //NSLog(@"%d",checkboxSelected1);
}

- (void)viewDidUnload
{
    Button1 = nil;
    Button2 = nil;
    Button2 = nil;
    Button3 = nil;
    Button4 = nil;
    Button5 = nil;
    Button6 = nil;
    Button7 = nil;
    Button8 = nil;
    Button9 = nil;
    Button9 = nil;
    Button10 = nil;
    Button11 = nil;
    Button12 = nil;
    Button13 = nil;
    Button14 = nil;
    Button15 = nil;
   // Button16 = nil;
    Button17 = nil;
    Button18 = nil;
    Button19 = nil;
    Button20 = nil;
    Button21 = nil;
    Button22 = nil;
    Button23 = nil;
    Button24 = nil;
    Button25 = nil;
    Button26 = nil;
    Button27 = nil;
    Button28 = nil;
    Button29 = nil;
    Button30 = nil;
    Button31 = nil;
    Button32 = nil;
    Button33 = nil;
    Button34 = nil;
    Button35 = nil;
    Button36 = nil;
    Button37 = nil;
    Button38 = nil;
    Button39 = nil;
    Button40 = nil;
    Button41 = nil;
    Button42 = nil;
    Button43 = nil;

    T1 = nil;
    T2 = nil;
    T3 = nil;
    T4 = nil;
    T5 = nil;
    [self setT1:nil];
    [self setT2:nil];
    [self setT3:nil];
    [self setT4:nil];
    [self setT5:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    keyboardToolbar = nil;
    nextPreviousControl = nil;
    
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

- (IBAction)dismissKeyboard:(id)sender
{
	[[self.view findFirstResponder] resignFirstResponder];
}
- (IBAction)buttonSavePressed:(id)sender
{
    [[self.view findFirstResponder] resignFirstResponder];
    // make sure all fields are have something in them
    if ((T1.text.length  > 0) && (T2.text.length > 0)  && (T3.text.length > 0)&& (T4.text.length > 0)  && (T5.text.length > 0) && checkboxSelected1 == 1 && checkboxSelected2 == 1 && checkboxSelected3 == 1 && checkboxSelected4 == 1 && checkboxSelected5 == 1 && checkboxSelected6 == 1 && checkboxSelected7 == 1 && checkboxSelected8 == 1 && checkboxSelected9 == 1 && checkboxSelected10 == 1 && checkboxSelected11 == 1 && checkboxSelected12 == 1 && checkboxSelected13 == 1 && checkboxSelected14 == 1 && checkboxSelected15 == 1 && checkboxSelected17 == 1 && checkboxSelected18 == 1 && checkboxSelected19 == 1 && checkboxSelected20 == 1 && checkboxSelected21 == 1 && checkboxSelected22 == 1 && checkboxSelected23 == 1 && checkboxSelected24 == 1 && checkboxSelected25 == 1 && checkboxSelected26 == 1 && checkboxSelected27 == 1 && checkboxSelected28 == 1 && checkboxSelected29 == 1 && checkboxSelected30 == 1 && checkboxSelected31 == 1 && checkboxSelected32 == 1 && checkboxSelected33 == 1 && checkboxSelected34 == 1 && checkboxSelected35 == 1 && checkboxSelected36 == 1 && checkboxSelected37 == 1 && checkboxSelected38 == 1 && checkboxSelected39 == 1 && checkboxSelected40 == 1 && checkboxSelected41 == 1 && checkboxSelected42 == 1 && checkboxSelected43 == 1 ) {
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
////        [self Cleardata];
////        [self Storedata];
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
    T5.text = @"";
    checkboxSelected1 = NO;checkboxSelected2 = NO;checkboxSelected3 = NO;checkboxSelected4 = NO;checkboxSelected5 = NO;checkboxSelected6 = NO;checkboxSelected7 = NO;
    checkboxSelected8 = NO;checkboxSelected9 = NO;checkboxSelected10 = NO;checkboxSelected11 = NO;checkboxSelected12 = NO;checkboxSelected13 = NO;checkboxSelected14 = NO;
    checkboxSelected15 = NO;checkboxSelected17 = NO;checkboxSelected18 = NO;checkboxSelected19 = NO;checkboxSelected20 = NO;checkboxSelected21 = NO;
    checkboxSelected22 = NO;checkboxSelected23 = NO;checkboxSelected24 = NO;checkboxSelected25 = NO;checkboxSelected26 = NO;checkboxSelected27 = NO;checkboxSelected28 = NO;
    checkboxSelected29 = NO;checkboxSelected30 = NO;checkboxSelected31 = NO;checkboxSelected32 = NO;checkboxSelected33 = NO;checkboxSelected34 = NO;checkboxSelected35 = NO;
    checkboxSelected36 = NO;checkboxSelected37 = NO;checkboxSelected38 = NO;checkboxSelected39 = NO;checkboxSelected40 = NO;checkboxSelected41 = NO;checkboxSelected42 = NO;
    checkboxSelected43 = NO;
}
-(void) Storedata
{
    // get paths from root direcory
    NSArray *paths = NSSearchPathForDirectoriesInDomains (NSDocumentDirectory, NSUserDomainMask, YES);
    // get documents path
    NSString *documentsPath = [paths objectAtIndex:0];
    // get the path to our Data/plist file
    NSString *plistPath = [documentsPath stringByAppendingPathComponent:@"P2TextData.plist"];
    
    // set the variables to the values in the text fields
    //  self.personName = nameEntered.text;
    self.Fields = [[NSMutableArray alloc] initWithCapacity:5];
    [Fields addObject:T1.text];
    [Fields addObject:T2.text];
    [Fields addObject:T3.text];
    [Fields addObject:T4.text];
    [Fields addObject:T5.text];
    self.Clickbuttons = [[NSMutableArray alloc] initWithCapacity:42];
    [Clickbuttons addObject: [NSNumber numberWithBool:checkboxSelected1]];
    [Clickbuttons addObject: [NSNumber numberWithBool:checkboxSelected2]];
    [Clickbuttons addObject: [NSNumber numberWithBool:checkboxSelected3]];
    [Clickbuttons addObject: [NSNumber numberWithBool:checkboxSelected4]];
    [Clickbuttons addObject: [NSNumber numberWithBool:checkboxSelected5]];
    [Clickbuttons addObject: [NSNumber numberWithBool:checkboxSelected6]];
    [Clickbuttons addObject: [NSNumber numberWithBool:checkboxSelected7]];
    [Clickbuttons addObject: [NSNumber numberWithBool:checkboxSelected8]];
    [Clickbuttons addObject: [NSNumber numberWithBool:checkboxSelected9]];
    [Clickbuttons addObject: [NSNumber numberWithBool:checkboxSelected10]];
    [Clickbuttons addObject: [NSNumber numberWithBool:checkboxSelected11]];
    [Clickbuttons addObject: [NSNumber numberWithBool:checkboxSelected12]];
    [Clickbuttons addObject: [NSNumber numberWithBool:checkboxSelected13]];
    [Clickbuttons addObject: [NSNumber numberWithBool:checkboxSelected14]];
    [Clickbuttons addObject: [NSNumber numberWithBool:checkboxSelected15]];
    //[Clickbuttons addObject: [NSNumber numberWithBool:checkboxSelected16]];
    [Clickbuttons addObject: [NSNumber numberWithBool:checkboxSelected17]];
    [Clickbuttons addObject: [NSNumber numberWithBool:checkboxSelected18]];
    [Clickbuttons addObject: [NSNumber numberWithBool:checkboxSelected19]];
    [Clickbuttons addObject: [NSNumber numberWithBool:checkboxSelected20]];
    [Clickbuttons addObject: [NSNumber numberWithBool:checkboxSelected21]];
    [Clickbuttons addObject: [NSNumber numberWithBool:checkboxSelected22]];
    [Clickbuttons addObject: [NSNumber numberWithBool:checkboxSelected23]];
    [Clickbuttons addObject: [NSNumber numberWithBool:checkboxSelected24]];
    [Clickbuttons addObject: [NSNumber numberWithBool:checkboxSelected25]];
    [Clickbuttons addObject: [NSNumber numberWithBool:checkboxSelected26]];
    [Clickbuttons addObject: [NSNumber numberWithBool:checkboxSelected27]];
    [Clickbuttons addObject: [NSNumber numberWithBool:checkboxSelected28]];
    [Clickbuttons addObject: [NSNumber numberWithBool:checkboxSelected29]];
    [Clickbuttons addObject: [NSNumber numberWithBool:checkboxSelected30]];
    [Clickbuttons addObject: [NSNumber numberWithBool:checkboxSelected31]];
    [Clickbuttons addObject: [NSNumber numberWithBool:checkboxSelected32]];
    [Clickbuttons addObject: [NSNumber numberWithBool:checkboxSelected33]];
    [Clickbuttons addObject: [NSNumber numberWithBool:checkboxSelected34]];
    [Clickbuttons addObject: [NSNumber numberWithBool:checkboxSelected35]];
    [Clickbuttons addObject: [NSNumber numberWithBool:checkboxSelected36]];
    [Clickbuttons addObject: [NSNumber numberWithBool:checkboxSelected37]];
    [Clickbuttons addObject: [NSNumber numberWithBool:checkboxSelected38]];
    [Clickbuttons addObject: [NSNumber numberWithBool:checkboxSelected39]];
    [Clickbuttons addObject: [NSNumber numberWithBool:checkboxSelected40]];
    [Clickbuttons addObject: [NSNumber numberWithBool:checkboxSelected41]];
    [Clickbuttons addObject: [NSNumber numberWithBool:checkboxSelected42]];
    [Clickbuttons addObject: [NSNumber numberWithBool:checkboxSelected43]];
    
    NSDictionary *plistDict = [NSDictionary dictionaryWithObjects: [NSArray arrayWithObjects: Fields,Clickbuttons, nil] forKeys:[NSArray arrayWithObjects: @"Fields2",@"Click1", nil]];
    
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
}

- (void) Emailsend 
{
    
    NSString *t1 = T1.text; NSString *t2 = T2.text;NSString *t3 = T3.text;NSString *t4 = T4.text;NSString *t5 = T5.text;
//    BOOL c1 =checkboxSelected1;BOOL c2 =checkboxSelected2;BOOL c3 =checkboxSelected3;BOOL c4 =checkboxSelected4;BOOL c5 =checkboxSelected5;BOOL c6 =checkboxSelected6;
//    BOOL c7 =checkboxSelected7;BOOL c8 =checkboxSelected8;BOOL c9 =checkboxSelected9;BOOL c10 =checkboxSelected10;BOOL c11 =checkboxSelected11;BOOL c12 =checkboxSelected12;
//    BOOL c13 =checkboxSelected13;BOOL c14 =checkboxSelected14;BOOL c15 =checkboxSelected15;BOOL c17 =checkboxSelected17;BOOL c18 =checkboxSelected18;
//    BOOL c19 =checkboxSelected19;BOOL c20 =checkboxSelected20;BOOL c21 =checkboxSelected21;BOOL c22 =checkboxSelected22;BOOL c23 =checkboxSelected23;BOOL c24 =checkboxSelected24;
//    BOOL c25 =checkboxSelected25;BOOL c26 =checkboxSelected26;BOOL c27 =checkboxSelected27;BOOL c28 =checkboxSelected28;BOOL c29 =checkboxSelected29;BOOL c30 =checkboxSelected30;
//    BOOL c31 =checkboxSelected31;BOOL c32 =checkboxSelected32;BOOL c33 =checkboxSelected33;BOOL c34 =checkboxSelected34;BOOL c35 =checkboxSelected35;BOOL c36 =checkboxSelected36;
//    BOOL c37 =checkboxSelected37;BOOL c38 =checkboxSelected38;BOOL c39 =checkboxSelected39;BOOL c40 =checkboxSelected40;BOOL c41 =checkboxSelected41;BOOL c42 =checkboxSelected42;
//    BOOL c43 =checkboxSelected43;
    
//    BOOL c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13,c14,c15,c16,c17,c18,c19,c20,c21,c22,c23,c24,c25,c26,c27,c28,c30,c31,c32,c33,c34,c35,c36,c37,c38,c39,c40,c41,c42,c43;
//    NSString *emailBody =[NSString stringWithFormat:@"Your birth plan 2:\n1: %@ ,\n2: %@ , \n3: %@ ,\n4: %@ ,\n5: %@ ,\n%d ,\n%d ,\n%d ,\n%d ,\n%d ,\n%d ,\n%d ,\n%d ,\n%d ,\n%d ,\n%d ,\n%d ,\n%d ,\n%d ,\n%d ,\n%d ,\n%d ,\n%d ,\n%d ,\n%d ,\n%d ,\n%d ,\n%d ,\n%d ,\n%d ,\n%d ,\n%d ,\n%d ,\n%d ,\n%d ,\n%d ,\n%d ,\n%d ,\n%d ,\n%d ,\n%d ,\n%d ,\n%d ,\n%d ,\n%d ,\n%d ,\n%d ,\n%d ,\n \"Success\".\n\n",t1,t2,t3,t4,t5,c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13,c14,c15,c17,c18,c19,c20,c21,c22,c23,c24,c25,c26,c27,c28,c29,c30,c31,c32,c33,c34,c35,c36,c37,c38,c39,c40,c41,c42,c43]; 
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
    NSString *C22str = @"";
    if (action22 == 1) {
        C22str = [NSString stringWithFormat:@"%d", checkboxSelected22];
        if (checkboxSelected22 == 1) {
            C22str = @"YES";
        }else {
            C22str = @"NO";
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
    NSString *C25str = @"";
    if (action25 == 1) {
        C25str = [NSString stringWithFormat:@"%d", checkboxSelected25];
        if (checkboxSelected25 == 1) {
            C25str = @"YES";
        }else {
            C25str = @"NO";
        }
    }
    NSString *C26str = @"";
    if (action26 == 1) {
        C26str = [NSString stringWithFormat:@"%d", checkboxSelected26];
        if (checkboxSelected26 == 1) {
            C26str = @"YES";
        }else {
            C26str = @"NO";
        }
    }
    NSString *C27str = @"";
    if (action27 == 1) {
        C27str = [NSString stringWithFormat:@"%d", checkboxSelected27];
        if (checkboxSelected27 == 1) {
            C27str = @"YES";
        }else {
            C27str = @"NO";
        }
    }
    NSString *C28str = @"";
    if (action28 == 1) {
        C28str = [NSString stringWithFormat:@"%d", checkboxSelected28];
        if (checkboxSelected28 == 1) {
            C28str = @"YES";
        }else {
            C28str = @"NO";
        }
    }
    NSString *C29str = @"";
    if (action29 == 1) {
        C29str = [NSString stringWithFormat:@"%d", checkboxSelected29];
        if (checkboxSelected29 == 1) {
            C29str = @"YES";
        }else {
            C29str = @"NO";
        }
    }
    NSString *C30str = @"";
    if (action30 == 1) {
        C30str = [NSString stringWithFormat:@"%d", checkboxSelected30];
        if (checkboxSelected30 == 1) {
            C30str = @"YES";
        }else {
            C30str = @"NO";
        }
    }
    NSString *C31str = @"";
    if (action31 == 1) {
        C31str = [NSString stringWithFormat:@"%d", checkboxSelected31];
        if (checkboxSelected31 == 1) {
            C31str = @"YES";
        }else {
            C31str = @"NO";
        }
    }
    NSString *C32str = @"";
    if (action32 == 1) {
        C32str = [NSString stringWithFormat:@"%d", checkboxSelected32];
        if (checkboxSelected32 == 1) {
            C32str = @"YES";
        }else {
            C32str = @"NO";
        }
    }
    NSString *C33str = @"";
    if (action33 == 1) {
        C33str = [NSString stringWithFormat:@"%d", checkboxSelected33];
        if (checkboxSelected33 == 1) {
            C33str = @"YES";
        }else {
            C33str = @"NO";
        }
    }
    NSString *C34str = @"";
    if (action34 == 1) {
        C34str = [NSString stringWithFormat:@"%d", checkboxSelected34];
        if (checkboxSelected34 == 1) {
            C34str = @"YES";
        }else {
            C34str = @"NO";
        }
    }
    NSString *C35str = @"";
    if (action35 == 1) {
        C35str = [NSString stringWithFormat:@"%d", checkboxSelected35];
        if (checkboxSelected35 == 1) {
            C35str = @"YES";
        }else {
            C35str = @"NO";
        }
    }
    NSString *C36str = @"";
    if (action36 == 1) {
        C1str = [NSString stringWithFormat:@"%d", checkboxSelected36];
        if (checkboxSelected36 == 1) {
            C36str = @"YES";
        }else {
            C36str = @"NO";
        }
    }
    NSString *C37str = @"";
    if (action37 == 1) {
        C37str = [NSString stringWithFormat:@"%d", checkboxSelected37];
        if (checkboxSelected37 == 1) {
            C37str = @"YES";
        }else {
            C37str = @"NO";
        }
    }
    NSString *C38str = @"";
    if (action38 == 1) {
        C38str = [NSString stringWithFormat:@"%d", checkboxSelected38];
        if (checkboxSelected38 == 1) {
            C38str = @"YES";
        }else {
            C38str = @"NO";
        }
    }
    NSString *C39str = @"";
    if (action39 == 1) {
        C39str = [NSString stringWithFormat:@"%d", checkboxSelected39];
        if (checkboxSelected39 == 1) {
            C39str = @"YES";
        }else {
            C39str = @"NO";
        }
    }
    NSString *C40str = @"";
    if (action40 == 1) {
        C40str = [NSString stringWithFormat:@"%d", checkboxSelected40];
        if (checkboxSelected40 == 1) {
            C40str = @"YES";
        }else {
            C40str = @"NO";
        }
    }
    NSString *C41str = @"";
    if (action41 == 1) {
        C41str = [NSString stringWithFormat:@"%d", checkboxSelected41];
        if (checkboxSelected41 == 1) {
            C41str = @"YES";
        }else {
            C41str = @"NO";
        }
    }
    NSString *C42str = @"";
    if (action42 == 1) {
        C42str = [NSString stringWithFormat:@"%d", checkboxSelected42];
        if (checkboxSelected42 == 1) {
            C42str = @"YES";
        }else {
            C42str = @"NO";
        }
    }
    NSString *C43str = @"";
    if (action43 == 1) {
        C43str = [NSString stringWithFormat:@"%d", checkboxSelected43];
        if (checkboxSelected43 == 1) {
            C43str = @"YES";
        }else {
            C43str = @"NO";
        }
    }
//    NSString *C1str= (checkboxSelected1 ? @"YES" : @"NO");NSString *C2str= (checkboxSelected2 ? @"YES" : @"NO");NSString *C3str= (checkboxSelected3 ? @"YES" : @"NO");
//    NSString *C4str= (checkboxSelected4 ? @"YES" : @"NO");NSString *C5str= (checkboxSelected5 ? @"YES" : @"NO");NSString *C6str= (checkboxSelected6 ? @"YES" : @"NO");
//    NSString *C7str= (checkboxSelected7 ? @"YES" : @"NO");NSString *C8str= (checkboxSelected8 ? @"YES" : @"NO");NSString *C9str= (checkboxSelected9 ? @"YES" : @"NO");
//    NSString *C10str= (checkboxSelected10 ? @"YES" : @"NO");NSString *C11str= (checkboxSelected11 ? @"YES" : @"NO");NSString *C12str= (checkboxSelected12 ? @"YES" : @"NO");
//    NSString *C13str= (checkboxSelected13 ? @"YES" : @"NO");NSString *C14str= (checkboxSelected14 ? @"YES" : @"NO");NSString *C15str= (checkboxSelected15 ? @"YES" : @"NO");
//    NSString *C17str= (checkboxSelected17 ? @"YES" : @"NO");NSString *C18str= (checkboxSelected18 ? @"YES" : @"NO");NSString *C19str= (checkboxSelected19 ? @"YES" : @"NO");
//    NSString *C20str= (checkboxSelected20 ? @"YES" : @"NO");NSString *C21str= (checkboxSelected21 ? @"YES" : @"NO");NSString *C22str= (checkboxSelected22 ? @"YES" : @"NO");
//    NSString *C23str= (checkboxSelected23 ? @"YES" : @"NO");NSString *C24str= (checkboxSelected24 ? @"YES" : @"NO");NSString *C25str= (checkboxSelected25 ? @"YES" : @"NO");
//    NSString *C26str= (checkboxSelected26 ? @"YES" : @"NO");NSString *C27str= (checkboxSelected27 ? @"YES" : @"NO");NSString *C28str= (checkboxSelected28 ? @"YES" : @"NO");
//    NSString *C29str= (checkboxSelected29 ? @"YES" : @"NO");NSString *C30str= (checkboxSelected30 ? @"YES" : @"NO");NSString *C31str= (checkboxSelected31 ? @"YES" : @"NO");
//    NSString *C32str= (checkboxSelected32 ? @"YES" : @"NO");NSString *C33str= (checkboxSelected33 ? @"YES" : @"NO");NSString *C34str= (checkboxSelected34 ? @"YES" : @"NO");
//    NSString *C35str= (checkboxSelected35 ? @"YES" : @"NO");NSString *C36str= (checkboxSelected36 ? @"YES" : @"NO");NSString *C37str= (checkboxSelected37 ? @"YES" : @"NO");
//    NSString *C38str= (checkboxSelected38 ? @"YES" : @"NO");NSString *C39str= (checkboxSelected39 ? @"YES" : @"NO");NSString *C40str= (checkboxSelected40 ? @"YES" : @"NO");
//    NSString *C41str= (checkboxSelected41 ? @"YES" : @"NO");NSString *C42str= (checkboxSelected42 ? @"YES" : @"NO");NSString *C43str= (checkboxSelected43 ? @"YES" : @"NO");
    
//    //NSLog(@"%@",emailBody);
//    SKPSMTPMessage *test_smtp_message = [[SKPSMTPMessage alloc] init];
//    test_smtp_message.fromEmail = @"dhanasekar.gunabalan@groupfmg.com";
//    test_smtp_message.toEmail = @"dhanasekar.gunabalan@groupfmg.com";
//    test_smtp_message.relayHost = @"email.wearefmg.net";
//    test_smtp_message.requiresAuth = 0;
//    test_smtp_message.login = @"dhanasekar.gunabalan";
//    test_smtp_message.pass =@"roja@1234";
//    test_smtp_message.wantsSecure = 1; // smtp.gmail.com doesn't work without TLS!
//    test_smtp_message.subject = @"My birth plan part2";
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
    
 
    
    
    NSString *emailBody2 =[NSString stringWithFormat:@"<html><head><title>My birth plan part2</title></head><body><table width='600' cellpadding='5' cellspacing='0' border='1'><tr><td><table width='600' cellpadding='5' cellspacing='0' border='0'><tr><td width='300' style='font-weight:bold; display:inline;font-size:12px;'><span style='font-weight:bold; display:inline;font-size:18px;color:#FF00FF;'>Labour &amp; Birth</span></td><td width='300' style='font-weight:bold; display:inline;font-size:12px;'></td></tr><tr><td width='300' style='font-weight:bold; display:inline;font-size:12px;'><span style='font-weight:bold; display:inline;font-size:14px;color:#FF00FF;'>My Environment</span></td><td width='300' style='font-weight:bold; display:inline;font-size:12px;'></td></tr><td width='300' style='font-weight:bold; display:inline;font-size:12px;'>Dim lights:</td><td width='300' style='font-weight:bold; display:inline;font-size:12px;'> %@</td></tr><tr><td width='300' style='font-weight:bold; display:inline;font-size:12px;'>Quiet music/radio:</td><td width='300' style='font-weight:bold; display:inline;font-size:12px;'> %@</td></tr><tr><td width='300' style='font-weight:bold; display:inline;font-size:12px;'>Aromatherapy oils:</td><td width='300' style='font-weight:bold; display:inline;font-size:12px;'> %@</td></tr><tr><td width='300' style='font-weight:bold; display:inline;font-size:12px;'>Wear my own clothes:</td><td width='300' style='font-weight:bold; display:inline;font-size:12px;'> %@</td></tr><tr><td width='300' style='font-weight:bold; display:inline;font-size:12px;'>OK to have a medical student in the room:</td><td width='300' style='font-weight:bold; display:inline;font-size:12px;'> %@</td></tr><tr><td width='300' style='font-weight:bold; display:inline;font-size:12px;'>Other:</td><td width='300' style='font-weight:bold; display:inline;font-size:12px;'> %@</td></tr><tr><td width='300' style='font-weight:bold; display:inline;font-size:12px;'><span style='font-weight:bold; display:inline;font-size:14px;color:#FF00FF;'>My comfort during labour</span></td><td width='300' style='font-weight:bold; display:inline;font-size:12px;'></td></tr><tr><td width='300' style='font-weight:bold; display:inline;font-size:12px;'>Bath:</td><td width='300' style='font-weight:bold; display:inline;font-size:12px;'> %@</td></tr><tr><td width='300' style='font-weight:bold; display:inline;font-size:12px;'>Shower:</td><td width='300' style='font-weight:bold; display:inline;font-size:12px;'> %@</td></tr><tr><td width='300' style='font-weight:bold; display:inline;font-size:12px;'>Massage:</td><td width='300' style='font-weight:bold; display:inline;font-size:12px;'> %@</td></tr><tr><td width='300' style='font-weight:bold; display:inline;font-size:12px;'>Birthing ball:</td><td width='300' style='font-weight:bold; display:inline;font-size:12px;'> %@</td></tr><tr><td width='300' style='font-weight:bold; display:inline;font-size:12px;'>Bean Bag:</td><td width='300' style='font-weight:bold; display:inline;font-size:12px;'> %@</td></tr><tr><td width='300' style='font-weight:bold; display:inline;font-size:12px;'>Cold Flannel on forehead:</td><td width='300' style='font-weight:bold; display:inline;font-size:12px;'> %@</td></tr><tr><td width='300' style='font-weight:bold; display:inline;font-size:12px;'>Acupressure:</td><td width='300' style='font-weight:bold; display:inline;font-size:12px;'> %@</td></tr><tr><td width='300' style='font-weight:bold; display:inline;font-size:12px;'>Hypnotherapy:</td><td width='300' style='font-weight:bold; display:inline;font-size:12px;'> %@</td></tr><tr><td style='font-weight:bold; display:inline;font-size:12px;'>Other:</td><td style='font-weight:bold; display:inline;font-size:12px;'> %@</td></tr><tr><td style='font-weight:bold; display:inline;font-size:12px;'><span style='font-weight:bold; display:inline;font-size:14px;color:#FF00FF;'>How active will I be?</span></td><td style='font-weight:bold; display:inline;font-size:12px;'></td></tr><tr><td style='font-weight:bold; display:inline;font-size:12px;'>I would like to keep as active during labour as I can (walking,</td><td style='font-weight:bold; display:inline;font-size:12px;'>&nbsp;</td></tr><tr><td style='font-weight:bold; display:inline;font-size:12px;'>birthing ball, labouring sitting, squatting, kneeling etc):</td><td style='font-weight:bold; display:inline;font-size:12px;'> %@</td></tr><tr><td style='font-weight:bold; display:inline;font-size:12px;'>Mobility is not important to me:</td><td style='font-weight:bold; display:inline;font-size:12px;'> %@</td></tr><tr><td style='font-weight:bold; display:inline;font-size:12px;'><span style='font-weight:bold; display:inline;font-size:14px;color:#FF00FF;'>I would prefer to be in the following positions during</span></td><td style='font-weight:bold; display:inline;font-size:12px;'></td></tr><tr><td style='font-weight:bold; display:inline;font-size:12px;'><span style='font-weight:bold; display:inline;font-size:14px;color:#FF00FF;'>labour and birth: (Your can tick more than one)</span></td><td style='font-weight:bold; display:inline;font-size:12px;'></td></tr><tr><td style='font-weight:bold; display:inline;font-size:12px;'>Walking:</td><td style='font-weight:bold; display:inline;font-size:12px;'> %@</td></tr><tr><td style='font-weight:bold; display:inline;font-size:12px;'>Standing:</td><td style='font-weight:bold; display:inline;font-size:12px;'> %@</td></tr><tr><td style='font-weight:bold; display:inline;font-size:12px;'>Squatting:</td><td style='font-weight:bold; display:inline;font-size:12px;'> %@</td></tr><tr><td style='font-weight:bold; display:inline;font-size:12px;'>Sitting:</td><td style='font-weight:bold; display:inline;font-size:12px;'> %@</td></tr><tr><td style='font-weight:bold; display:inline;font-size:12px;'>Kneeling:</td><td style='font-weight:bold; display:inline;font-size:12px;'> %@</td></tr><tr><td style='font-weight:bold; display:inline;font-size:12px;'>Lying down:</td><td style='font-weight:bold; display:inline;font-size:12px;'> %@</td></tr><tr><td style='font-weight:bold; display:inline;font-size:12px;'>Birth Stool:</td><td style='font-weight:bold; display:inline;font-size:12px;'> %@</td></tr><tr><td style='font-weight:bold; display:inline;font-size:12px;'>Other:</td><td style='font-weight:bold; display:inline;font-size:12px;'> %@</td></tr><tr><td style='font-weight:bold; display:inline;font-size:12px;'><span style='font-weight:bold; display:inline;font-size:14px;color:#FF00FF;'>Managing my pain relief</span></td><td style='font-weight:bold; display:inline;font-size:12px;'></td></tr><tr><td style='font-weight:bold; display:inline;font-size:12px;'>I will let you know if I want pain relief:</td><td style='font-weight:bold; display:inline;font-size:12px;'> %@</td></tr><tr><td style='font-weight:bold; display:inline;font-size:12px;'>Please offer if I appear uncomfortable:</td><td style='font-weight:bold; display:inline;font-size:12px;'> %@</td></tr><tr><td style='font-weight:bold; display:inline;font-size:12px;'>Offer as soon as possible:</td><td style='font-weight:bold; display:inline;font-size:12px;'> %@</td></tr><tr><td style='font-weight:bold; display:inline;font-size:12px;'><span style='font-weight:bold; display:inline;font-size:14px;color:#FF00FF;'>Breaking my waters</span></td><td style='font-weight:bold; display:inline;font-size:12px;'></td></tr><tr><td style='font-weight:bold; display:inline;font-size:12px;'>I prefer my waters to be allowed to rupture on its own:</td><td style='font-weight:bold; display:inline;font-size:12px;'> %@</td></tr><tr><td style='font-weight:bold; display:inline;font-size:12px;'><span style='font-weight:bold; display:inline;font-size:14px;color:#FF00FF;'>Delivery of my baby</span></td><td style='font-weight:bold; display:inline;font-size:12px;'></td></tr><tr><td style='font-weight:bold; display:inline;font-size:12px;'>I would like to touch baby's head when it crowns:</td><td style='font-weight:bold; display:inline;font-size:12px;'> %@</td></tr><tr><td style='font-weight:bold; display:inline;font-size:12px;'>I would like a mirror available to view pushing/crowning/birth:</td><td style='font-weight:bold; display:inline;font-size:12px;'> %@</td></tr><tr><td style='font-weight:bold; display:inline;font-size:12px;'><span style='font-weight:bold; display:inline;font-size:14px;color:#FF00FF;'>If I can I would like to try to use the:</span></td><td style='font-weight:bold; display:inline;font-size:12px;'></td></tr><tr><td style='font-weight:bold; display:inline;font-size:12px;'>Birthing pool:</td><td style='font-weight:bold; display:inline;font-size:12px;'> %@</td></tr><tr><td style='font-weight:bold; display:inline;font-size:12px;'>Birthing ball:</td><td style='font-weight:bold; display:inline;font-size:12px;'> %@</td></tr><tr><td style='font-weight:bold; display:inline;font-size:12px;'>Other:</td><td style='font-weight:bold; display:inline;font-size:12px;'> %@</td></tr><tr><td style='font-weight:bold; display:inline;font-size:12px;'><span style='font-weight:bold; display:inline;font-size:14px;color:#FF00FF;'>How I would like to be monitored during labour</span></td><td style='font-weight:bold; display:inline;font-size:12px;'></td></tr><tr><td style='font-weight:bold; display:inline;font-size:12px;'>Continuous monitoring (will mean limited mobility):</td><td style='font-weight:bold; display:inline;font-size:12px;'> %@</td></tr><tr><td style='font-weight:bold; display:inline;font-size:12px;'>Intermittent monitoring:</td><td style='font-weight:bold; display:inline;font-size:12px;'> %@</td></tr><tr><td style='font-weight:bold; display:inline;font-size:12px;'>No monitoring - except in emergency situations:</td><td style='font-weight:bold; display:inline;font-size:12px;'> %@</td></tr><tr><td style='font-weight:bold; display:inline;font-size:12px;'><span style='font-weight:bold; display:inline;font-size:14px;color:#FF00FF;'>Vaginal / Cervix Examinations</span></td><td style='font-weight:bold; display:inline;font-size:12px;'></td></tr><tr><td style='font-weight:bold; display:inline;font-size:12px;'>I would like minimal examinations:</td><td style='font-weight:bold; display:inline;font-size:12px;'> %@</td></tr><tr><td style='font-weight:bold; display:inline;font-size:12px;'>I am happy for examinations as deemed necessary by medical staff:</td><td style='font-weight:bold; display:inline;font-size:12px;'> %@</td></tr><tr><td style='font-weight:bold; display:inline;font-size:12px;'>No monitoring - except in emergency situations:</td><td style='font-weight:bold; display:inline;font-size:12px;'> %@</td></tr><tr><td style='font-weight:bold; display:inline;font-size:12px;'><span style='font-weight:bold; display:inline;font-size:14px;color:#FF00FF;'>Medical Pain Relief Options</span></td><td style='font-weight:bold; display:inline;font-size:12px;'></td></tr><tr><td style='font-weight:bold; display:inline;font-size:12px;'>I would like to try to manage without medical pain relief options:</td><td style='font-weight:bold; display:inline;font-size:12px;'> %@</td></tr><tr><td style='font-weight:bold; display:inline;font-size:12px;'>I would like to try: (Number in order of preference)</td><td style='font-weight:bold; display:inline;font-size:12px;'></td></tr><tr><td style='font-weight:bold; display:inline;font-size:12px;'>Gas / Air:</td><td style='font-weight:bold; display:inline;font-size:12px;'> %@</td></tr><tr><td style='font-weight:bold; display:inline;font-size:12px;'>Pethidine:</td><td style='font-weight:bold; display:inline;font-size:12px;'> %@</td></tr><tr><td style='font-weight:bold; display:inline;font-size:12px;'>Epidural:</td><td style='font-weight:bold; display:inline;font-size:12px;'> %@</td></tr><tr><td style='font-weight:bold; display:inline;font-size:12px;'>Other:</td><td style='font-weight:bold; display:inline;font-size:12px;'> %@</td></tr><tr><td style='font-weight:bold; display:inline;font-size:12px;'><span style='font-weight:bold; display:inline;font-size:14px;color:#FF00FF;'>Episiotomy</span></td><td style='font-weight:bold; display:inline;font-size:12px;'></td></tr><tr><td style='font-weight:bold; display:inline;font-size:12px;'>I do not want an episiotomy unless there is an emergency situation:</td><td style='font-weight:bold; display:inline;font-size:12px;'> %@</td></tr><tr><td style='font-weight:bold; display:inline;font-size:12px;'>I would like an episiotomy to reduce the risk of tearing:</td><td style='font-weight:bold; display:inline;font-size:12px;'> %@</td></tr><tr><td style='font-weight:bold; display:inline;font-size:12px;'>&nbsp;</td><td style='font-weight:bold; display:inline;font-size:12px;'>&nbsp;</td></tr></table></td></tr></table></body></html>",C1str,C2str,C3str,C4str,C5str,t1,C6str,C7str,C8str,C9str,C10str,C11str,C12str,C13str,t2,C14str,C15str,C17str,C18str,C19str,C20str,C21str,C22str,C23str,t3,C24str,C25str,C26str,C27str,C28str,C29str,C30str,C31str,t4,C32str,C33str,C34str,C35str,C36str,C37str,C38str,C39str,C40str,C41str,t5,C42str,C43str]; 
    
    //create email
    MFMailComposeViewController *mail = [[MFMailComposeViewController alloc] init];
    
    mail.mailComposeDelegate = self;
    NSData *UIImageJPEGRepresentation(UIImage *image, CGFloat compressionQuality);
    
    if ([MFMailComposeViewController canSendMail]) {
        
        //Setting up the Subject, recipients, and message body.
        
        // [mail setToRecipients:[NSArray arrayWithObjects:@"dhanasekar.gunabalan@groupfmg.com",nil]];
        
        [mail setSubject:@"My birth plan part2"];
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
          //  [self Cleardata];
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
          //  [self Cleardata];
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
    //  ProgressBar.hidden = YES;
   // [self Cleardata];
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
				[T5 becomeFirstResponder];
			} else if (responder == T2) {
				[T1 becomeFirstResponder];
			} else if (responder == T3) {
				[T2 becomeFirstResponder];
			}else if (responder == T4) {
				[T3 becomeFirstResponder];
			}else if (responder == T5) {
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
				[T5 becomeFirstResponder];
			}
            else if (responder == T5) {
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
	keyboardToolbarShouldHide = NO;
    CGPoint pt;
    CGRect rc = [textField bounds];
    rc = [textField convertRect:rc toView:scrollview2];
    pt = rc.origin;
    pt.x = 0;
    pt.y += 1;
    [scrollview2 setContentOffset:pt animated:YES];
	//DebugLog(@"textFieldShouldBeginEditing: %@",textField);
	return YES;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
	//DebugLog(@"textFieldShouldEndEditing: %@",textField);
    keyboardToolbarShouldHide = YES;
    CGPoint pt;
    CGRect rc = [textField bounds];
    rc = [textField convertRect:rc toView:scrollview2];
    pt = rc.origin;
    pt.x = 0;
    pt.y -= 1;
    [scrollview2 setContentOffset:pt animated:YES];
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
    }else if (textField == T4) {
        [T5 becomeFirstResponder];
    }else if (textField == T5) {
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


//- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
//	
//	[theTextField resignFirstResponder];
//	return YES;
//}


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
//- (IBAction)Button16:(id)sender {
//    if (checkboxSelected16 == 0){
//		[Button16 setSelected:YES];
//		checkboxSelected16 = 1;
//	} else {
//		[Button16 setSelected:NO];
//		checkboxSelected16 = 0;
//	}
//}
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
    action22 = 1;
    if (checkboxSelected22 == 0){
		[Button22 setSelected:YES];
		checkboxSelected22 = 1;
	} else {
		[Button22 setSelected:NO];
		checkboxSelected22 = 0;
	}
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
- (IBAction)Button25:(id)sender {
    action25 = 1;
    if (checkboxSelected25 == 0){
		[Button25 setSelected:YES];
		checkboxSelected25 = 1;
	} else {
		[Button25 setSelected:NO];
		checkboxSelected25 = 0;
	}
}
- (IBAction)Button26:(id)sender {
    action26 = 1;
    if (checkboxSelected26 == 0){
		[Button26 setSelected:YES];
		checkboxSelected26 = 1;
	} else {
		[Button26 setSelected:NO];
		checkboxSelected26 = 0;
	}
}
- (IBAction)Button27:(id)sender {
    action27 = 1;
    if (checkboxSelected27 == 0){
		[Button27 setSelected:YES];
		checkboxSelected27 = 1;
	} else {
		[Button27 setSelected:NO];
		checkboxSelected27 = 0;
	}
}
- (IBAction)Button28:(id)sender {
    action28 = 1;
    if (checkboxSelected28 == 0){
		[Button28 setSelected:YES];
		checkboxSelected28 = 1;
	} else {
		[Button28 setSelected:NO];
		checkboxSelected28 = 0;
	}
}
- (IBAction)Button29:(id)sender {
    action29 = 1;
    if (checkboxSelected29 == 0){
		[Button29 setSelected:YES];
		checkboxSelected29 = 1;
	} else {
		[Button29 setSelected:NO];
		checkboxSelected29 = 0;
	}
}
- (IBAction)Button30:(id)sender {
    action30 = 1;
    if (checkboxSelected30 == 0){
		[Button30 setSelected:YES];
		checkboxSelected30 = 1;
	} else {
		[Button30 setSelected:NO];
		checkboxSelected30 = 0;
	}
}
- (IBAction)Button31:(id)sender {
    action31 = 1;
    if (checkboxSelected31 == 0){
		[Button31 setSelected:YES];
		checkboxSelected31 = 1;
	} else {
		[Button31 setSelected:NO];
		checkboxSelected31 = 0;
	}
}
- (IBAction)Button32:(id)sender {
    action32 = 1;
    if (checkboxSelected32 == 0){
		[Button32 setSelected:YES];
		checkboxSelected32 = 1;
	} else {
		[Button32 setSelected:NO];
		checkboxSelected32 = 0;
	}
}
- (IBAction)Button33:(id)sender {
    action33 = 1;
    if (checkboxSelected33 == 0){
		[Button33 setSelected:YES];
		checkboxSelected33 = 1;
	} else {
		[Button33 setSelected:NO];
		checkboxSelected33 = 0;
	}
}
- (IBAction)Button34:(id)sender {
    action34 = 1;
    if (checkboxSelected34 == 0){
		[Button34 setSelected:YES];
		checkboxSelected34 = 1;
	} else {
		[Button34 setSelected:NO];
		checkboxSelected34 = 0;
	}
}
- (IBAction)Button35:(id)sender {
    action35 = 1;
    if (checkboxSelected35 == 0){
		[Button35 setSelected:YES];
		checkboxSelected35 = 1;
	} else {
		[Button35 setSelected:NO];
		checkboxSelected35 = 0;
	}
}
- (IBAction)Button36:(id)sender {
    action36 = 1;
    if (checkboxSelected36 == 0){
		[Button36 setSelected:YES];
		checkboxSelected36 = 1;
	} else {
		[Button36 setSelected:NO];
		checkboxSelected36 = 0;
	}
}
- (IBAction)Button37:(id)sender {
    action37 = 1;
    if (checkboxSelected37 == 0){
		[Button37 setSelected:YES];
		checkboxSelected37 = 1;
	} else {
		[Button37 setSelected:NO];
		checkboxSelected37 = 0;
	}
}
- (IBAction)Button38:(id)sender {
    action38 = 1;
    if (checkboxSelected38 == 0){
		[Button38 setSelected:YES];
		checkboxSelected38 = 1;
	} else {
		[Button38 setSelected:NO];
		checkboxSelected38 = 0;
	}
}
- (IBAction)Button39:(id)sender {
    action39 = 1;
    if (checkboxSelected39 == 0){
		[Button39 setSelected:YES];
		checkboxSelected39 = 1;
	} else {
		[Button39 setSelected:NO];
		checkboxSelected39 = 0;
	}
}
- (IBAction)Button40:(id)sender {
    action40 = 1;
    if (checkboxSelected40 == 0){
		[Button40 setSelected:YES];
		checkboxSelected40 = 1;
	} else {
		[Button40 setSelected:NO];
		checkboxSelected40 = 0;
	}
}
- (IBAction)Button41:(id)sender {
    action41 = 1;
    if (checkboxSelected41 == 0){
		[Button41 setSelected:YES];
		checkboxSelected41 = 1;
	} else {
		[Button41 setSelected:NO];
		checkboxSelected41 = 0;
	}
}
- (IBAction)Button42:(id)sender {
    action42 = 1;
    if (checkboxSelected42 == 0){
		[Button42 setSelected:YES];
		checkboxSelected42 = 1;
	} else {
		[Button42 setSelected:NO];
		checkboxSelected42 = 0;
	}
}
- (IBAction)Button43:(id)sender {
    action43 = 1;
    if (checkboxSelected43 == 0){
		[Button43 setSelected:YES];
		checkboxSelected43 = 1;
	} else {
		[Button43 setSelected:NO];
		checkboxSelected43 = 0;
	}
}

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
    Part1DetailViewController *Part1DetailView = [[Part1DetailViewController alloc] initWithNibName:@"Part1DetailViewController" bundle:nil];
    Part1DetailView.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentModalViewController:Part1DetailView animated:YES];
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
