//
//  newborncheckViewController.m
//  Gurgle
//
//  Created by Dhanasekar Gunabalan on 9/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "newborncheckViewController.h"

#import "newbornchecklistinfoViewController.h"

#import "BirthplanViewController.h"
#import "ToolsViewController.h"
#import "FunViewController.h"
#import "HelpViewController.h"
#import "GurgleAdViewController.h"

@interface newborncheckViewController ()

@end

@implementation newborncheckViewController

@synthesize btn35lbl;
@synthesize btn34lbl;
@synthesize btn33lbl;
@synthesize btn32lbl;
@synthesize btn31lbl;
@synthesize btn30lbl;
@synthesize btn29lbl;
@synthesize btn28lbl;
@synthesize btn27lbl;
@synthesize btn26lbl;
@synthesize btn25lbl;
@synthesize btn24lbl;
@synthesize btn23lbl;
@synthesize btn22lbl;
@synthesize btn21lbl;
@synthesize btn20lbl;
@synthesize btn19lbl;
@synthesize btn18lbl;
@synthesize btn17lbl;
@synthesize btn16lbl;
@synthesize btn15lbl;
@synthesize btn14lbl;
@synthesize btn13lbl;
@synthesize btn12lbl;
@synthesize btn11lbl;
@synthesize btn10lbl;
@synthesize btn9lbl;

@synthesize btn8lbl;
@synthesize btn7lbl;
@synthesize btn6lbl;
@synthesize btn5lbl;
@synthesize btn4lbl;
@synthesize btn3lbl;
@synthesize btn2lbl;
@synthesize btn1lbl;

@synthesize Clickbuttons;

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
    
[scrollview setScrollEnabled:YES];
[scrollview setContentSize:CGSizeMake(198, 2250)];
[super viewDidLoad];
// Do any additional setup after loading the view from its nib.
    
    
    // Data.plist code
	// get paths from root direcory
	NSArray *paths = NSSearchPathForDirectoriesInDomains (NSDocumentDirectory, NSUserDomainMask, YES);
	// get documents path
	NSString *documentsPath = [paths objectAtIndex:0];
	// get the path to our Data/plist file
	NSString *plistPath = [documentsPath stringByAppendingPathComponent:@"Newborn.plist"];
	
	// check to see if Data.plist exists in documents
	if (![[NSFileManager defaultManager] fileExistsAtPath:plistPath]) 
	{
		// if not in documents, get property list from main bundle
		plistPath = [[NSBundle mainBundle] pathForResource:@"Newborn" ofType:@"plist"];
	}
	
	// read property list into memory as an NSData object
	NSData *plistXML = [[NSFileManager defaultManager] contentsAtPath:plistPath];
	NSString *errorDesc = nil;
	NSPropertyListFormat format;
	// convert static property liost into dictionary object
	NSDictionary *temp = (NSDictionary *)[NSPropertyListSerialization propertyListFromData:plistXML mutabilityOption:kCFPropertyListMutableContainers format:&format errorDescription:&errorDesc];
	if (!temp) 
	{
		NSLog(@"Error reading Newborn plist: %@, format: %d", errorDesc, format);
	}
   	// assign values
	
    self.Clickbuttons = [NSMutableArray arrayWithArray:[temp objectForKey:@"Click1"]];
    [btn1selc setSelected:[[Clickbuttons objectAtIndex:0]boolValue]];
    checkboxSelected1 = [[Clickbuttons objectAtIndex:0]boolValue];
    [btn2selc setSelected:[[Clickbuttons objectAtIndex:1]boolValue]];
    checkboxSelected2 = [[Clickbuttons objectAtIndex:1]boolValue];
    [btn3selc setSelected:[[Clickbuttons objectAtIndex:2]boolValue]];
    checkboxSelected3 = [[Clickbuttons objectAtIndex:2]boolValue];
    [btn4selc setSelected:[[Clickbuttons objectAtIndex:3]boolValue]];
    checkboxSelected4 = [[Clickbuttons objectAtIndex:3]boolValue];
    [btn5selc setSelected:[[Clickbuttons objectAtIndex:4]boolValue]];
    checkboxSelected5 = [[Clickbuttons objectAtIndex:4]boolValue];
    [btn6selc setSelected:[[Clickbuttons objectAtIndex:5]boolValue]];
    checkboxSelected6 = [[Clickbuttons objectAtIndex:5]boolValue];
    [btn7selc setSelected:[[Clickbuttons objectAtIndex:6]boolValue]];
    checkboxSelected7 = [[Clickbuttons objectAtIndex:6]boolValue];
    [btn8selc setSelected:[[Clickbuttons objectAtIndex:7]boolValue]];
    checkboxSelected8 = [[Clickbuttons objectAtIndex:7]boolValue];
    [btn9selc setSelected:[[Clickbuttons objectAtIndex:8]boolValue]];
    checkboxSelected9 = [[Clickbuttons objectAtIndex:8]boolValue];
    [btn10selc setSelected:[[Clickbuttons objectAtIndex:9]boolValue]];
    checkboxSelected10 = [[Clickbuttons objectAtIndex:9]boolValue];
    [btn11selc setSelected:[[Clickbuttons objectAtIndex:10]boolValue]];
    checkboxSelected11 = [[Clickbuttons objectAtIndex:10]boolValue];
    [btn12selc setSelected:[[Clickbuttons objectAtIndex:11]boolValue]];
    checkboxSelected12 = [[Clickbuttons objectAtIndex:11]boolValue];
    [btn13selc setSelected:[[Clickbuttons objectAtIndex:12]boolValue]];
    checkboxSelected13 = [[Clickbuttons objectAtIndex:12]boolValue];
    [btn14selc setSelected:[[Clickbuttons objectAtIndex:13]boolValue]];
    checkboxSelected14 = [[Clickbuttons objectAtIndex:13]boolValue];
    [btn15selc setSelected:[[Clickbuttons objectAtIndex:14]boolValue]];
    checkboxSelected15 = [[Clickbuttons objectAtIndex:14]boolValue];
    [btn16selc setSelected:[[Clickbuttons objectAtIndex:15]boolValue]];
    checkboxSelected16 = [[Clickbuttons objectAtIndex:15]boolValue];
    [btn17selc setSelected:[[Clickbuttons objectAtIndex:16]boolValue]];
    checkboxSelected17 = [[Clickbuttons objectAtIndex:16]boolValue];
    [btn18selc setSelected:[[Clickbuttons objectAtIndex:17]boolValue]];
    checkboxSelected18 = [[Clickbuttons objectAtIndex:17]boolValue];
    [btn19selc setSelected:[[Clickbuttons objectAtIndex:18]boolValue]];
    checkboxSelected19 = [[Clickbuttons objectAtIndex:18]boolValue];
    [btn20selc setSelected:[[Clickbuttons objectAtIndex:19]boolValue]];
    checkboxSelected20 = [[Clickbuttons objectAtIndex:19]boolValue];
    [btn21selc setSelected:[[Clickbuttons objectAtIndex:20]boolValue]];
    checkboxSelected21 = [[Clickbuttons objectAtIndex:20]boolValue];
    [btn22selc setSelected:[[Clickbuttons objectAtIndex:21]boolValue]];
    checkboxSelected22 = [[Clickbuttons objectAtIndex:21]boolValue];
    [btn23selc setSelected:[[Clickbuttons objectAtIndex:22]boolValue]];
    checkboxSelected23 = [[Clickbuttons objectAtIndex:22]boolValue];
    [btn24selc setSelected:[[Clickbuttons objectAtIndex:23]boolValue]];
    checkboxSelected24 = [[Clickbuttons objectAtIndex:23]boolValue];
    [btn25selc setSelected:[[Clickbuttons objectAtIndex:24]boolValue]];
    checkboxSelected25 = [[Clickbuttons objectAtIndex:24]boolValue];
    [btn26selc setSelected:[[Clickbuttons objectAtIndex:25]boolValue]];
    checkboxSelected26 = [[Clickbuttons objectAtIndex:25]boolValue];
    [btn27selc setSelected:[[Clickbuttons objectAtIndex:26]boolValue]];
    checkboxSelected27 = [[Clickbuttons objectAtIndex:26]boolValue];
    [btn28selc setSelected:[[Clickbuttons objectAtIndex:27]boolValue]];
    checkboxSelected28 = [[Clickbuttons objectAtIndex:27]boolValue];
    [btn29selc setSelected:[[Clickbuttons objectAtIndex:28]boolValue]];
    checkboxSelected29 = [[Clickbuttons objectAtIndex:28]boolValue];
    [btn30selc setSelected:[[Clickbuttons objectAtIndex:29]boolValue]];
    checkboxSelected30 = [[Clickbuttons objectAtIndex:29]boolValue];
    [btn31selc setSelected:[[Clickbuttons objectAtIndex:30]boolValue]];
    checkboxSelected31 = [[Clickbuttons objectAtIndex:30]boolValue];
    [btn32selc setSelected:[[Clickbuttons objectAtIndex:31]boolValue]];
    checkboxSelected32 = [[Clickbuttons objectAtIndex:31]boolValue];
    [btn33selc setSelected:[[Clickbuttons objectAtIndex:32]boolValue]];
    checkboxSelected33 = [[Clickbuttons objectAtIndex:32]boolValue];
    [btn34selc setSelected:[[Clickbuttons objectAtIndex:33]boolValue]];
    checkboxSelected34 = [[Clickbuttons objectAtIndex:33]boolValue];
    [btn35selc setSelected:[[Clickbuttons objectAtIndex:34]boolValue]];
    checkboxSelected35 = [[Clickbuttons objectAtIndex:34]boolValue];
    //NSLog(@"%d",checkboxSelected1);
    [self Retrivecolors];
}

- (void)viewDidUnload
{

scrollview = nil;
btn1lbl = nil;
[self setBtn1lbl:nil];
btn1selc = nil;
btn2lbl = nil;
btn2selc = nil;
[self setBtn2lbl:nil];
btn3lbl = nil;
btn4lbl = nil;
btn5lbl = nil;
btn6lbl = nil;
btn7lbl = nil;
btn8lbl = nil;
btn9lbl = nil;
btn10lbl = nil;
btn11lbl = nil;
btn12lbl = nil;
btn13lbl = nil;
btn14lbl = nil;
btn15lbl = nil;
btn16lbl = nil;
btn17lbl = nil;
btn18lbl = nil;
btn19lbl = nil;
btn20lbl = nil;
btn21lbl = nil;
btn22lbl = nil;
btn23lbl = nil;
btn24lbl = nil;
btn25lbl = nil;
btn26lbl = nil;
btn27lbl = nil;
btn28lbl = nil;
btn29lbl = nil;
btn30lbl = nil;
btn31lbl = nil;
btn32lbl = nil;
btn33lbl = nil;
btn34lbl = nil;
btn35lbl = nil;
btn3selc = nil;
btn4selc = nil;
btn5selc = nil;
btn6selc = nil;
btn7selc = nil;
btn8selc = nil;
btn9selc = nil;
btn10selc = nil;
btn11selc = nil;
btn12selc = nil;
btn14selc = nil;
btn13selc = nil;
btn14selc = nil;
btn15selc = nil;
btn16selc = nil;
btn17selc = nil;
btn18selc = nil;
btn19selc = nil;
btn20selc = nil;
btn21selc = nil;
btn23selc = nil;
btn22selc = nil;
btn23selc = nil;
btn24selc = nil;
btn25selc = nil;
btn26selc = nil;
btn27selc = nil;
btn28selc = nil;
btn29selc = nil;
btn30selc = nil;
btn31selc = nil;
btn32selc = nil;
btn33selc = nil;
btn34selc = nil;
btn35selc = nil;
[self setBtn3lbl:nil];
[self setBtn4lbl:nil];
[self setBtn5lbl:nil];
[self setBtn6lbl:nil];
[self setBtn7lbl:nil];
[self setBtn8lbl:nil];
[self setBtn9lbl:nil];
[self setBtn9lbl:nil];
[self setBtn10lbl:nil];
[self setBtn11lbl:nil];
[self setBtn12lbl:nil];
[self setBtn13lbl:nil];
[self setBtn14lbl:nil];
[self setBtn15lbl:nil];
[self setBtn16lbl:nil];
[self setBtn17lbl:nil];
[self setBtn18lbl:nil];
[self setBtn19lbl:nil];
[self setBtn20lbl:nil];
[self setBtn21lbl:nil];
[self setBtn22lbl:nil];
[self setBtn23lbl:nil];
[self setBtn24lbl:nil];
[self setBtn25lbl:nil];
[self setBtn26lbl:nil];
[self setBtn27lbl:nil];
[self setBtn28lbl:nil];
[self setBtn29lbl:nil];
[self setBtn31lbl:nil];
[self setBtn31lbl:nil];
[self setBtn32lbl:nil];
[self setBtn33lbl:nil];
[self setBtn34lbl:nil];
[self setBtn35lbl:nil];
    Topbanner = nil;
    bottombanner = nil;
[super viewDidUnload];
// Release any retained subviews of the main view.
// e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
return (interfaceOrientation == UIInterfaceOrientationPortrait);
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

-(void) Retrivecolors
{
    
    if (checkboxSelected1 == 1) {
        [btn1lbl setTitleColor:[UIColor magentaColor] forState:UIControlStateNormal];
    }else {
        [btn1lbl setTitleColor:[UIColor colorWithRed:44/255.0 green:93/255.0 blue:205/255.0 alpha:1.0] forState:UIControlStateNormal];
        [btn1lbl setTitleColor:[UIColor colorWithRed:44/255.0 green:93/255.0 blue:205/255.0 alpha:1.0] forState:UIControlStateHighlighted];
    }
    if (checkboxSelected2 == 1) {
        [btn2lbl setTitleColor:[UIColor magentaColor] forState:UIControlStateNormal];
    }else {
        [btn2lbl setTitleColor:[UIColor colorWithRed:44/255.0 green:93/255.0 blue:205/255.0 alpha:1.0] forState:UIControlStateNormal];
        [btn2lbl setTitleColor:[UIColor colorWithRed:44/255.0 green:93/255.0 blue:205/255.0 alpha:1.0] forState:UIControlStateHighlighted];
    }
    
    if (checkboxSelected3 == 1) {
        [btn3lbl setTitleColor:[UIColor magentaColor] forState:UIControlStateNormal];
    }else {
        [btn3lbl setTitleColor:[UIColor colorWithRed:44/255.0 green:93/255.0 blue:205/255.0 alpha:1.0] forState:UIControlStateNormal];
        [btn3lbl setTitleColor:[UIColor colorWithRed:44/255.0 green:93/255.0 blue:205/255.0 alpha:1.0] forState:UIControlStateHighlighted];
    }
    
    if (checkboxSelected4 == 1) {
        [btn4lbl setTitleColor:[UIColor magentaColor] forState:UIControlStateNormal];
    }else {
        [btn4lbl setTitleColor:[UIColor colorWithRed:44/255.0 green:93/255.0 blue:205/255.0 alpha:1.0] forState:UIControlStateNormal];
        [btn4lbl setTitleColor:[UIColor colorWithRed:44/255.0 green:93/255.0 blue:205/255.0 alpha:1.0] forState:UIControlStateHighlighted];
    }
    if (checkboxSelected5 == 1) {
        [btn5lbl setTitleColor:[UIColor magentaColor] forState:UIControlStateNormal];
    }else {
        [btn5lbl setTitleColor:[UIColor colorWithRed:44/255.0 green:93/255.0 blue:205/255.0 alpha:1.0] forState:UIControlStateNormal];
        [btn5lbl setTitleColor:[UIColor colorWithRed:44/255.0 green:93/255.0 blue:205/255.0 alpha:1.0] forState:UIControlStateHighlighted];
    }
    
    if (checkboxSelected6 == 1) {
        [btn6lbl setTitleColor:[UIColor magentaColor] forState:UIControlStateNormal];
    }else {
        [btn6lbl setTitleColor:[UIColor colorWithRed:44/255.0 green:93/255.0 blue:205/255.0 alpha:1.0] forState:UIControlStateNormal];
        [btn6lbl setTitleColor:[UIColor colorWithRed:44/255.0 green:93/255.0 blue:205/255.0 alpha:1.0] forState:UIControlStateHighlighted];
    }
    
    if (checkboxSelected7 == 1) {
        [btn7lbl setTitleColor:[UIColor magentaColor] forState:UIControlStateNormal];
    }else {
        [btn7lbl setTitleColor:[UIColor colorWithRed:44/255.0 green:93/255.0 blue:205/255.0 alpha:1.0] forState:UIControlStateNormal];
        [btn7lbl setTitleColor:[UIColor colorWithRed:44/255.0 green:93/255.0 blue:205/255.0 alpha:1.0] forState:UIControlStateHighlighted];
    }
    
    if (checkboxSelected8 == 1) {
        [btn8lbl setTitleColor:[UIColor magentaColor] forState:UIControlStateNormal];
    }else {
        [btn8lbl setTitleColor:[UIColor colorWithRed:44/255.0 green:93/255.0 blue:205/255.0 alpha:1.0] forState:UIControlStateNormal];
        [btn8lbl setTitleColor:[UIColor colorWithRed:44/255.0 green:93/255.0 blue:205/255.0 alpha:1.0] forState:UIControlStateHighlighted];
    }
    
    if (checkboxSelected9 == 1) {
        [btn9lbl setTitleColor:[UIColor magentaColor] forState:UIControlStateNormal];
    }else {
        [btn9lbl setTitleColor:[UIColor colorWithRed:44/255.0 green:93/255.0 blue:205/255.0 alpha:1.0] forState:UIControlStateNormal];
        [btn9lbl setTitleColor:[UIColor colorWithRed:44/255.0 green:93/255.0 blue:205/255.0 alpha:1.0] forState:UIControlStateHighlighted];
    }
    
    if (checkboxSelected10 == 1) {
        [btn10lbl setTitleColor:[UIColor magentaColor] forState:UIControlStateNormal];
    }else {
        [btn10lbl setTitleColor:[UIColor colorWithRed:44/255.0 green:93/255.0 blue:205/255.0 alpha:1.0] forState:UIControlStateNormal];
        [btn10lbl setTitleColor:[UIColor colorWithRed:44/255.0 green:93/255.0 blue:205/255.0 alpha:1.0] forState:UIControlStateHighlighted];
    }
    
    if (checkboxSelected11 == 1) {
        [btn11lbl setTitleColor:[UIColor magentaColor] forState:UIControlStateNormal];
    }else {
        [btn11lbl setTitleColor:[UIColor colorWithRed:44/255.0 green:93/255.0 blue:205/255.0 alpha:1.0] forState:UIControlStateNormal];
        [btn11lbl setTitleColor:[UIColor colorWithRed:44/255.0 green:93/255.0 blue:205/255.0 alpha:1.0] forState:UIControlStateHighlighted];
    }
    
    if (checkboxSelected12 == 1) {
        [btn12lbl setTitleColor:[UIColor magentaColor] forState:UIControlStateNormal];
    }else {
        [btn12lbl setTitleColor:[UIColor colorWithRed:44/255.0 green:93/255.0 blue:205/255.0 alpha:1.0] forState:UIControlStateNormal];
        [btn12lbl setTitleColor:[UIColor colorWithRed:44/255.0 green:93/255.0 blue:205/255.0 alpha:1.0] forState:UIControlStateHighlighted];
    }
    if (checkboxSelected13 == 1) {
        [btn13lbl setTitleColor:[UIColor magentaColor] forState:UIControlStateNormal];
    }else {
        [btn13lbl setTitleColor:[UIColor colorWithRed:44/255.0 green:93/255.0 blue:205/255.0 alpha:1.0] forState:UIControlStateNormal];
        [btn13lbl setTitleColor:[UIColor colorWithRed:44/255.0 green:93/255.0 blue:205/255.0 alpha:1.0] forState:UIControlStateHighlighted];
    }
    if (checkboxSelected14 == 1) {
        [btn14lbl setTitleColor:[UIColor magentaColor] forState:UIControlStateNormal];
    }else {
        [btn14lbl setTitleColor:[UIColor colorWithRed:44/255.0 green:93/255.0 blue:205/255.0 alpha:1.0] forState:UIControlStateNormal];
        [btn14lbl setTitleColor:[UIColor colorWithRed:44/255.0 green:93/255.0 blue:205/255.0 alpha:1.0] forState:UIControlStateHighlighted];
    }
    if (checkboxSelected15 == 1) {
        [btn15lbl setTitleColor:[UIColor magentaColor] forState:UIControlStateNormal];
    }else {
        [btn15lbl setTitleColor:[UIColor colorWithRed:44/255.0 green:93/255.0 blue:205/255.0 alpha:1.0] forState:UIControlStateNormal];
        [btn15lbl setTitleColor:[UIColor colorWithRed:44/255.0 green:93/255.0 blue:205/255.0 alpha:1.0] forState:UIControlStateHighlighted];
    }
    
    if (checkboxSelected16 == 1) {
        [btn16lbl setTitleColor:[UIColor magentaColor] forState:UIControlStateNormal];
    }else {
        [btn16lbl setTitleColor:[UIColor colorWithRed:44/255.0 green:93/255.0 blue:205/255.0 alpha:1.0] forState:UIControlStateNormal];
        [btn16lbl setTitleColor:[UIColor colorWithRed:44/255.0 green:93/255.0 blue:205/255.0 alpha:1.0] forState:UIControlStateHighlighted];
    }
    
    if (checkboxSelected17 == 1) {
        [btn17lbl setTitleColor:[UIColor magentaColor] forState:UIControlStateNormal];
    }else {
        [btn17lbl setTitleColor:[UIColor colorWithRed:44/255.0 green:93/255.0 blue:205/255.0 alpha:1.0] forState:UIControlStateNormal];
        [btn17lbl setTitleColor:[UIColor colorWithRed:44/255.0 green:93/255.0 blue:205/255.0 alpha:1.0] forState:UIControlStateHighlighted];
    }
    
    if (checkboxSelected18 == 1) {
        [btn18lbl setTitleColor:[UIColor magentaColor] forState:UIControlStateNormal];
    }else {
        [btn18lbl setTitleColor:[UIColor colorWithRed:44/255.0 green:93/255.0 blue:205/255.0 alpha:1.0] forState:UIControlStateNormal];
        [btn18lbl setTitleColor:[UIColor colorWithRed:44/255.0 green:93/255.0 blue:205/255.0 alpha:1.0] forState:UIControlStateHighlighted];
    }
    
    if (checkboxSelected19 == 1) {
        [btn19lbl setTitleColor:[UIColor magentaColor] forState:UIControlStateNormal];
    }else {
        [btn19lbl setTitleColor:[UIColor colorWithRed:44/255.0 green:93/255.0 blue:205/255.0 alpha:1.0] forState:UIControlStateNormal];
        [btn19lbl setTitleColor:[UIColor colorWithRed:44/255.0 green:93/255.0 blue:205/255.0 alpha:1.0] forState:UIControlStateHighlighted];
    }
    
    if (checkboxSelected20 == 1) {
        [btn20lbl setTitleColor:[UIColor magentaColor] forState:UIControlStateNormal];
    }else {
        [btn20lbl setTitleColor:[UIColor colorWithRed:44/255.0 green:93/255.0 blue:205/255.0 alpha:1.0] forState:UIControlStateNormal];
        [btn20lbl setTitleColor:[UIColor colorWithRed:44/255.0 green:93/255.0 blue:205/255.0 alpha:1.0] forState:UIControlStateHighlighted];
    }
    
    if (checkboxSelected21 == 1) {
        [btn21lbl setTitleColor:[UIColor magentaColor] forState:UIControlStateNormal];
    }else {
        [btn21lbl setTitleColor:[UIColor colorWithRed:44/255.0 green:93/255.0 blue:205/255.0 alpha:1.0] forState:UIControlStateNormal];
        [btn21lbl setTitleColor:[UIColor colorWithRed:44/255.0 green:93/255.0 blue:205/255.0 alpha:1.0] forState:UIControlStateHighlighted];
    }
    
    if (checkboxSelected22 == 1) {
        [btn22lbl setTitleColor:[UIColor magentaColor] forState:UIControlStateNormal];
    }else {
        [btn22lbl setTitleColor:[UIColor colorWithRed:44/255.0 green:93/255.0 blue:205/255.0 alpha:1.0] forState:UIControlStateNormal];
        [btn22lbl setTitleColor:[UIColor colorWithRed:44/255.0 green:93/255.0 blue:205/255.0 alpha:1.0] forState:UIControlStateHighlighted];
    }
    
    if (checkboxSelected23 == 1) {
        [btn23lbl setTitleColor:[UIColor magentaColor] forState:UIControlStateNormal];
    }else {
        [btn23lbl setTitleColor:[UIColor colorWithRed:44/255.0 green:93/255.0 blue:205/255.0 alpha:1.0] forState:UIControlStateNormal];
        [btn23lbl setTitleColor:[UIColor colorWithRed:44/255.0 green:93/255.0 blue:205/255.0 alpha:1.0] forState:UIControlStateHighlighted];
    }
    
    if (checkboxSelected24 == 1) {
        [btn24lbl setTitleColor:[UIColor magentaColor] forState:UIControlStateNormal];
    }else {
        [btn24lbl setTitleColor:[UIColor colorWithRed:44/255.0 green:93/255.0 blue:205/255.0 alpha:1.0] forState:UIControlStateNormal];
        [btn24lbl setTitleColor:[UIColor colorWithRed:44/255.0 green:93/255.0 blue:205/255.0 alpha:1.0] forState:UIControlStateHighlighted];
    }
    
    if (checkboxSelected25 == 1) {
        [btn25lbl setTitleColor:[UIColor magentaColor] forState:UIControlStateNormal];
    }else {
        [btn25lbl setTitleColor:[UIColor colorWithRed:44/255.0 green:93/255.0 blue:205/255.0 alpha:1.0] forState:UIControlStateNormal];
        [btn25lbl setTitleColor:[UIColor colorWithRed:44/255.0 green:93/255.0 blue:205/255.0 alpha:1.0] forState:UIControlStateHighlighted];
    }
    
    if (checkboxSelected26 == 1) {
        [btn26lbl setTitleColor:[UIColor magentaColor] forState:UIControlStateNormal];
    }else {
        [btn26lbl setTitleColor:[UIColor colorWithRed:44/255.0 green:93/255.0 blue:205/255.0 alpha:1.0] forState:UIControlStateNormal];
        [btn26lbl setTitleColor:[UIColor colorWithRed:44/255.0 green:93/255.0 blue:205/255.0 alpha:1.0] forState:UIControlStateHighlighted];
    }
    
    if (checkboxSelected27 == 1) {
        [btn27lbl setTitleColor:[UIColor magentaColor] forState:UIControlStateNormal];
    }else {
        [btn27lbl setTitleColor:[UIColor colorWithRed:44/255.0 green:93/255.0 blue:205/255.0 alpha:1.0] forState:UIControlStateNormal];
        [btn27lbl setTitleColor:[UIColor colorWithRed:44/255.0 green:93/255.0 blue:205/255.0 alpha:1.0] forState:UIControlStateHighlighted];
    }
    
    if (checkboxSelected28 == 1) {
        [btn28lbl setTitleColor:[UIColor magentaColor] forState:UIControlStateNormal];
    }else {
        [btn28lbl setTitleColor:[UIColor colorWithRed:44/255.0 green:93/255.0 blue:205/255.0 alpha:1.0] forState:UIControlStateNormal];
        [btn28lbl setTitleColor:[UIColor colorWithRed:44/255.0 green:93/255.0 blue:205/255.0 alpha:1.0] forState:UIControlStateHighlighted];
    }
    
    if (checkboxSelected29 == 1) {
        [btn29lbl setTitleColor:[UIColor magentaColor] forState:UIControlStateNormal];
    }else {
        [btn29lbl setTitleColor:[UIColor colorWithRed:44/255.0 green:93/255.0 blue:205/255.0 alpha:1.0] forState:UIControlStateNormal];
        [btn29lbl setTitleColor:[UIColor colorWithRed:44/255.0 green:93/255.0 blue:205/255.0 alpha:1.0] forState:UIControlStateHighlighted];
    }
    
    if (checkboxSelected30 == 1) {
        [btn30lbl setTitleColor:[UIColor magentaColor] forState:UIControlStateNormal];
    }else {
        [btn30lbl setTitleColor:[UIColor colorWithRed:44/255.0 green:93/255.0 blue:205/255.0 alpha:1.0] forState:UIControlStateNormal];
        [btn30lbl setTitleColor:[UIColor colorWithRed:44/255.0 green:93/255.0 blue:205/255.0 alpha:1.0] forState:UIControlStateHighlighted];
    }
    
    if (checkboxSelected31 == 1) {
        [btn31lbl setTitleColor:[UIColor magentaColor] forState:UIControlStateNormal];
    }else {
        [btn31lbl setTitleColor:[UIColor colorWithRed:44/255.0 green:93/255.0 blue:205/255.0 alpha:1.0] forState:UIControlStateNormal];
        [btn31lbl setTitleColor:[UIColor colorWithRed:44/255.0 green:93/255.0 blue:205/255.0 alpha:1.0] forState:UIControlStateHighlighted];
    }
    
    if (checkboxSelected32 == 1) {
        [btn32lbl setTitleColor:[UIColor magentaColor] forState:UIControlStateNormal];
    }else {
        [btn32lbl setTitleColor:[UIColor colorWithRed:44/255.0 green:93/255.0 blue:205/255.0 alpha:1.0] forState:UIControlStateNormal];
        [btn32lbl setTitleColor:[UIColor colorWithRed:44/255.0 green:93/255.0 blue:205/255.0 alpha:1.0] forState:UIControlStateHighlighted];
    }
    
    if (checkboxSelected33 == 1) {
        [btn33lbl setTitleColor:[UIColor magentaColor] forState:UIControlStateNormal];
    }else {
        [btn33lbl setTitleColor:[UIColor colorWithRed:44/255.0 green:93/255.0 blue:205/255.0 alpha:1.0] forState:UIControlStateNormal];
        [btn33lbl setTitleColor:[UIColor colorWithRed:44/255.0 green:93/255.0 blue:205/255.0 alpha:1.0] forState:UIControlStateHighlighted];
    }
    
    if (checkboxSelected34 == 1) {
        [btn34lbl setTitleColor:[UIColor magentaColor] forState:UIControlStateNormal];
    }else {
        [btn34lbl setTitleColor:[UIColor colorWithRed:44/255.0 green:93/255.0 blue:205/255.0 alpha:1.0] forState:UIControlStateNormal];
        [btn34lbl setTitleColor:[UIColor colorWithRed:44/255.0 green:93/255.0 blue:205/255.0 alpha:1.0] forState:UIControlStateHighlighted];
    }
    
    if (checkboxSelected35 == 1) {
        [btn35lbl setTitleColor:[UIColor magentaColor] forState:UIControlStateNormal];
    }else {
        [btn35lbl setTitleColor:[UIColor colorWithRed:44/255.0 green:93/255.0 blue:205/255.0 alpha:1.0] forState:UIControlStateNormal];
        [btn35lbl setTitleColor:[UIColor colorWithRed:44/255.0 green:93/255.0 blue:205/255.0 alpha:1.0] forState:UIControlStateHighlighted];
    }
    
}

-(void) Storedata
{
    // get paths from root direcory
    NSArray *paths = NSSearchPathForDirectoriesInDomains (NSDocumentDirectory, NSUserDomainMask, YES);
    // get documents path
    NSString *documentsPath = [paths objectAtIndex:0];
    // get the path to our Data/plist file
    NSString *plistPath = [documentsPath stringByAppendingPathComponent:@"Newborn.plist"];
    
    // set the variables to the values in the text fields
    
    self.Clickbuttons = [[NSMutableArray alloc] initWithCapacity:43];
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
    [Clickbuttons addObject: [NSNumber numberWithBool:checkboxSelected16]];
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
    
    NSDictionary *plistDict = [NSDictionary dictionaryWithObjects: [NSArray arrayWithObjects: Clickbuttons, nil] forKeys:[NSArray arrayWithObjects: @"Click1", nil]];
    
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
        NSLog(@"Error in Newborn saveData: %@", error);
        // [error release];
    }
}

- (IBAction)btn1lbl:(id)sender {
if (checkboxSelected1 == 0){
    [btn1lbl setTitleColor:[UIColor magentaColor] forState:UIControlStateNormal];
    [btn1selc setSelected:YES];
    checkboxSelected1 = 1;
} else {
   // [btn1lbl setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
   // [btn1lbl setTitleColor:[UIColor colorWithRed:1.0/256.0 green:1.0/256.0 blue:1.0/256.0 alpha:1.0] forState:UIControlStateHighlighted];
    [btn1lbl setTitleColor:[UIColor colorWithRed:44/255.0 green:93/255.0 blue:205/255.0 alpha:1.0] forState:UIControlStateNormal];
    [btn1lbl setTitleColor:[UIColor colorWithRed:44/255.0 green:93/255.0 blue:205/255.0 alpha:1.0] forState:UIControlStateHighlighted];
    [btn1selc setSelected:NO];
    checkboxSelected1 = 0;
}
}

- (IBAction)btn2lbl:(id)sender {
if (checkboxSelected2 == 0){
    [btn2lbl setTitleColor:[UIColor magentaColor] forState:UIControlStateNormal];
    [btn2selc setSelected:YES];
    checkboxSelected2 = 1;
} else {
    [btn2lbl setTitleColor:[UIColor colorWithRed:44/255.0 green:93/255.0 blue:205/255.0 alpha:1.0] forState:UIControlStateNormal];
    [btn2lbl setTitleColor:[UIColor colorWithRed:44/255.0 green:93/255.0 blue:205/255.0 alpha:1.0] forState:UIControlStateHighlighted];
    [btn2selc setSelected:NO];
    checkboxSelected2 = 0;
}
}

- (IBAction)btn3lbl:(id)sender {
if (checkboxSelected3 == 0){
    [btn3lbl setTitleColor:[UIColor magentaColor] forState:UIControlStateNormal];
    [btn3selc setSelected:YES];
    checkboxSelected3 = 1;
} else {
    [btn3lbl setTitleColor:[UIColor colorWithRed:44/255.0 green:93/255.0 blue:205/255.0 alpha:1.0] forState:UIControlStateNormal];
    [btn3lbl setTitleColor:[UIColor colorWithRed:44/255.0 green:93/255.0 blue:205/255.0 alpha:1.0] forState:UIControlStateHighlighted];
    [btn3selc setSelected:NO];
    checkboxSelected3 = 0;
}
}

- (IBAction)btn4lbl:(id)sender {
if (checkboxSelected4 == 0){
    [btn4lbl setTitleColor:[UIColor magentaColor] forState:UIControlStateNormal];
    [btn4selc setSelected:YES];
    checkboxSelected4 = 1;
} else {
    [btn4lbl setTitleColor:[UIColor colorWithRed:44/255.0 green:93/255.0 blue:205/255.0 alpha:1.0] forState:UIControlStateNormal];
    [btn4lbl setTitleColor:[UIColor colorWithRed:44/255.0 green:93/255.0 blue:205/255.0 alpha:1.0] forState:UIControlStateHighlighted];
    [btn4selc setSelected:NO];
    checkboxSelected4 = 0;
}
}

- (IBAction)btn5lbl:(id)sender {
if (checkboxSelected5 == 0){
    [btn5lbl setTitleColor:[UIColor magentaColor] forState:UIControlStateNormal];
    [btn5selc setSelected:YES];
    checkboxSelected5 = 1;
} else {
    [btn5lbl setTitleColor:[UIColor colorWithRed:44/255.0 green:93/255.0 blue:205/255.0 alpha:1.0] forState:UIControlStateNormal];
    [btn5lbl setTitleColor:[UIColor colorWithRed:44/255.0 green:93/255.0 blue:205/255.0 alpha:1.0] forState:UIControlStateHighlighted];
    [btn5selc setSelected:NO];
    checkboxSelected5 = 0;
}
}

- (IBAction)btn6lbl:(id)sender {
if (checkboxSelected6 == 0){
    [btn6lbl setTitleColor:[UIColor magentaColor] forState:UIControlStateNormal];
    [btn6selc setSelected:YES];
    checkboxSelected6 = 1;
} else {
    [btn6lbl setTitleColor:[UIColor colorWithRed:44/255.0 green:93/255.0 blue:205/255.0 alpha:1.0] forState:UIControlStateNormal];
    [btn6lbl setTitleColor:[UIColor colorWithRed:44/255.0 green:93/255.0 blue:205/255.0 alpha:1.0] forState:UIControlStateHighlighted];
    [btn6selc setSelected:NO];
    checkboxSelected6 = 0;
}
}

- (IBAction)btn7lbl:(id)sender {
if (checkboxSelected7 == 0){
    [btn7lbl setTitleColor:[UIColor magentaColor] forState:UIControlStateNormal];
    [btn7selc setSelected:YES];
    checkboxSelected7 = 1;
} else {
    [btn7lbl setTitleColor:[UIColor colorWithRed:44/255.0 green:93/255.0 blue:205/255.0 alpha:1.0] forState:UIControlStateNormal];
    [btn7lbl setTitleColor:[UIColor colorWithRed:44/255.0 green:93/255.0 blue:205/255.0 alpha:1.0] forState:UIControlStateHighlighted];
    [btn7selc setSelected:NO];
    checkboxSelected7 = 0;
}

}

- (IBAction)btn8lbl:(id)sender {
if (checkboxSelected8 == 0){
    [btn8lbl setTitleColor:[UIColor magentaColor] forState:UIControlStateNormal];
    [btn8selc setSelected:YES];
    checkboxSelected8 = 1;
} else {
    [btn8lbl setTitleColor:[UIColor colorWithRed:44/255.0 green:93/255.0 blue:205/255.0 alpha:1.0] forState:UIControlStateNormal];
    [btn8lbl setTitleColor:[UIColor colorWithRed:44/255.0 green:93/255.0 blue:205/255.0 alpha:1.0] forState:UIControlStateHighlighted];
    [btn8selc setSelected:NO];
    checkboxSelected8 = 0;
}
}

- (IBAction)btn9lbl:(id)sender {
if (checkboxSelected9 == 0){
    [btn9lbl setTitleColor:[UIColor magentaColor] forState:UIControlStateNormal];
    [btn9selc setSelected:YES];
    checkboxSelected9 = 1;
} else {
    [btn9lbl setTitleColor:[UIColor colorWithRed:44/255.0 green:93/255.0 blue:205/255.0 alpha:1.0] forState:UIControlStateNormal];
    [btn9lbl setTitleColor:[UIColor colorWithRed:44/255.0 green:93/255.0 blue:205/255.0 alpha:1.0] forState:UIControlStateHighlighted];
    [btn9selc setSelected:NO];
    checkboxSelected9 = 0;
}
}

- (IBAction)btn10lbl:(id)sender {
if (checkboxSelected10 == 0){
    [btn10lbl setTitleColor:[UIColor magentaColor] forState:UIControlStateNormal];
    [btn10selc setSelected:YES];
    checkboxSelected10 = 1;
} else {
    [btn10lbl setTitleColor:[UIColor colorWithRed:44/255.0 green:93/255.0 blue:205/255.0 alpha:1.0] forState:UIControlStateNormal];
    [btn10lbl setTitleColor:[UIColor colorWithRed:44/255.0 green:93/255.0 blue:205/255.0 alpha:1.0] forState:UIControlStateHighlighted];
    [btn10selc setSelected:NO];
    checkboxSelected10 = 0;
}
}

- (IBAction)btn11lbl:(id)sender {
if (checkboxSelected11 == 0){
    [btn11lbl setTitleColor:[UIColor magentaColor] forState:UIControlStateNormal];
    [btn11selc setSelected:YES];
    checkboxSelected11 = 1;
} else {
    [btn11lbl setTitleColor:[UIColor colorWithRed:44/255.0 green:93/255.0 blue:205/255.0 alpha:1.0] forState:UIControlStateNormal];
    [btn11lbl setTitleColor:[UIColor colorWithRed:44/255.0 green:93/255.0 blue:205/255.0 alpha:1.0] forState:UIControlStateHighlighted];
    [btn11selc setSelected:NO];
    checkboxSelected11 = 0;
}
}

- (IBAction)btn12lbl:(id)sender {
if (checkboxSelected12 == 0){
    [btn12lbl setTitleColor:[UIColor magentaColor] forState:UIControlStateNormal];
    [btn12selc setSelected:YES];
    checkboxSelected12 = 1;
} else {
    [btn12lbl setTitleColor:[UIColor colorWithRed:44/255.0 green:93/255.0 blue:205/255.0 alpha:1.0] forState:UIControlStateNormal];
    [btn12lbl setTitleColor:[UIColor colorWithRed:44/255.0 green:93/255.0 blue:205/255.0 alpha:1.0] forState:UIControlStateHighlighted];
    [btn12selc setSelected:NO];
    checkboxSelected12 = 0;
}
}

- (IBAction)btn13lbl:(id)sender {
if (checkboxSelected13 == 0){
    [btn13lbl setTitleColor:[UIColor magentaColor] forState:UIControlStateNormal];
    [btn13selc setSelected:YES];
    checkboxSelected13 = 1;
} else {
    [btn13lbl setTitleColor:[UIColor colorWithRed:44/255.0 green:93/255.0 blue:205/255.0 alpha:1.0] forState:UIControlStateNormal];
    [btn13lbl setTitleColor:[UIColor colorWithRed:44/255.0 green:93/255.0 blue:205/255.0 alpha:1.0] forState:UIControlStateHighlighted];
    [btn13selc setSelected:NO];
    checkboxSelected13 = 0;
}
}

- (IBAction)btn14lbl:(id)sender {
if (checkboxSelected14 == 0){
    [btn14lbl setTitleColor:[UIColor magentaColor] forState:UIControlStateNormal];
    [btn14selc setSelected:YES];
    checkboxSelected14 = 1;
} else {
    [btn14lbl setTitleColor:[UIColor colorWithRed:44/255.0 green:93/255.0 blue:205/255.0 alpha:1.0] forState:UIControlStateNormal];
    [btn14lbl setTitleColor:[UIColor colorWithRed:44/255.0 green:93/255.0 blue:205/255.0 alpha:1.0] forState:UIControlStateHighlighted];
    [btn14selc setSelected:NO];
    checkboxSelected14 = 0;
}
}

- (IBAction)btn15lbl:(id)sender {
if (checkboxSelected15 == 0){
    [btn15lbl setTitleColor:[UIColor magentaColor] forState:UIControlStateNormal];
    [btn15selc setSelected:YES];
    checkboxSelected15 = 1;
} else {
    [btn15lbl setTitleColor:[UIColor colorWithRed:44/255.0 green:93/255.0 blue:205/255.0 alpha:1.0] forState:UIControlStateNormal];
    [btn15lbl setTitleColor:[UIColor colorWithRed:44/255.0 green:93/255.0 blue:205/255.0 alpha:1.0] forState:UIControlStateHighlighted];
    [btn15selc setSelected:NO];
    checkboxSelected15 = 0;
}
}

- (IBAction)btn16lbl:(id)sender {
if (checkboxSelected16 == 0){
    [btn16lbl setTitleColor:[UIColor magentaColor] forState:UIControlStateNormal];
    [btn16selc setSelected:YES];
    checkboxSelected16 = 1;
} else {
    [btn16lbl setTitleColor:[UIColor colorWithRed:44/255.0 green:93/255.0 blue:205/255.0 alpha:1.0] forState:UIControlStateNormal];
    [btn16lbl setTitleColor:[UIColor colorWithRed:44/255.0 green:93/255.0 blue:205/255.0 alpha:1.0] forState:UIControlStateHighlighted];
    [btn16selc setSelected:NO];
    checkboxSelected16 = 0;
}
}

- (IBAction)btn17lbl:(id)sender {
if (checkboxSelected17 == 0){
    [btn17lbl setTitleColor:[UIColor magentaColor] forState:UIControlStateNormal];
    [btn17selc setSelected:YES];
    checkboxSelected17 = 1;
} else {
    [btn17lbl setTitleColor:[UIColor colorWithRed:44/255.0 green:93/255.0 blue:205/255.0 alpha:1.0] forState:UIControlStateNormal];
    [btn17lbl setTitleColor:[UIColor colorWithRed:44/255.0 green:93/255.0 blue:205/255.0 alpha:1.0] forState:UIControlStateHighlighted];
    [btn17selc setSelected:NO];
    checkboxSelected17 = 0;
}
}

- (IBAction)btn18lbl:(id)sender {
if (checkboxSelected18 == 0){
    [btn18lbl setTitleColor:[UIColor magentaColor] forState:UIControlStateNormal];
    [btn18selc setSelected:YES];
    checkboxSelected18 = 1;
} else {
    [btn18lbl setTitleColor:[UIColor colorWithRed:44/255.0 green:93/255.0 blue:205/255.0 alpha:1.0] forState:UIControlStateNormal];
    [btn18lbl setTitleColor:[UIColor colorWithRed:44/255.0 green:93/255.0 blue:205/255.0 alpha:1.0] forState:UIControlStateHighlighted];
    [btn18selc setSelected:NO];
    checkboxSelected18 = 0;
}
}

- (IBAction)btn19lbl:(id)sender {
if (checkboxSelected19 == 0){
    [btn19lbl setTitleColor:[UIColor magentaColor] forState:UIControlStateNormal];
    [btn19selc setSelected:YES];
    checkboxSelected19 = 1;
} else {
    [btn19lbl setTitleColor:[UIColor colorWithRed:44/255.0 green:93/255.0 blue:205/255.0 alpha:1.0] forState:UIControlStateNormal];
    [btn19lbl setTitleColor:[UIColor colorWithRed:44/255.0 green:93/255.0 blue:205/255.0 alpha:1.0] forState:UIControlStateHighlighted];
    [btn19selc setSelected:NO];
    checkboxSelected19 = 0;
}
}

- (IBAction)btn20lbl:(id)sender {
if (checkboxSelected20 == 0){
    [btn20lbl setTitleColor:[UIColor magentaColor] forState:UIControlStateNormal];
    [btn20selc setSelected:YES];
    checkboxSelected20 = 1;
} else {
    [btn20lbl setTitleColor:[UIColor colorWithRed:44/255.0 green:93/255.0 blue:205/255.0 alpha:1.0] forState:UIControlStateNormal];
    [btn20lbl setTitleColor:[UIColor colorWithRed:44/255.0 green:93/255.0 blue:205/255.0 alpha:1.0] forState:UIControlStateHighlighted];
    [btn20selc setSelected:NO];
    checkboxSelected20 = 0;
}
}

- (IBAction)btn21lbl:(id)sender {
if (checkboxSelected21 == 0){
    [btn21lbl setTitleColor:[UIColor magentaColor] forState:UIControlStateNormal];
    [btn21selc setSelected:YES];
    checkboxSelected21 = 1;
} else {
    [btn21lbl setTitleColor:[UIColor colorWithRed:44/255.0 green:93/255.0 blue:205/255.0 alpha:1.0] forState:UIControlStateNormal];
    [btn21lbl setTitleColor:[UIColor colorWithRed:44/255.0 green:93/255.0 blue:205/255.0 alpha:1.0] forState:UIControlStateHighlighted];
    [btn21selc setSelected:NO];
    checkboxSelected21 = 0;
}
}

- (IBAction)btn22lbl:(id)sender {
if (checkboxSelected22 == 0){
    [btn22lbl setTitleColor:[UIColor magentaColor] forState:UIControlStateNormal];
    [btn22selc setSelected:YES];
    checkboxSelected22 = 1;
} else {
    [btn22lbl setTitleColor:[UIColor colorWithRed:44/255.0 green:93/255.0 blue:205/255.0 alpha:1.0] forState:UIControlStateNormal];
    [btn22lbl setTitleColor:[UIColor colorWithRed:44/255.0 green:93/255.0 blue:205/255.0 alpha:1.0] forState:UIControlStateHighlighted];
    [btn22selc setSelected:NO];
    checkboxSelected22 = 0;
}             
}

- (IBAction)btn23lbl:(id)sender {
if (checkboxSelected23 == 0){
    [btn23lbl setTitleColor:[UIColor magentaColor] forState:UIControlStateNormal];
    [btn23selc setSelected:YES];
    checkboxSelected23 = 1;
} else {
    [btn23lbl setTitleColor:[UIColor colorWithRed:44/255.0 green:93/255.0 blue:205/255.0 alpha:1.0] forState:UIControlStateNormal];
    [btn23lbl setTitleColor:[UIColor colorWithRed:44/255.0 green:93/255.0 blue:205/255.0 alpha:1.0] forState:UIControlStateHighlighted];
    [btn23selc setSelected:NO];
    checkboxSelected23 = 0;
}
}

- (IBAction)btn24lbl:(id)sender {
if (checkboxSelected24 == 0){
    [btn24lbl setTitleColor:[UIColor magentaColor] forState:UIControlStateNormal];
    [btn24selc setSelected:YES];
    checkboxSelected24 = 1;
} else {
    [btn24lbl setTitleColor:[UIColor colorWithRed:44/255.0 green:93/255.0 blue:205/255.0 alpha:1.0] forState:UIControlStateNormal];
    [btn24lbl setTitleColor:[UIColor colorWithRed:44/255.0 green:93/255.0 blue:205/255.0 alpha:1.0] forState:UIControlStateHighlighted];
    [btn24selc setSelected:NO];
    checkboxSelected24 = 0;
}
}

- (IBAction)btn25lbl:(id)sender {
if (checkboxSelected25 == 0){
    [btn25lbl setTitleColor:[UIColor magentaColor] forState:UIControlStateNormal];
    [btn25selc setSelected:YES];
    checkboxSelected25 = 1;
} else {
    [btn25lbl setTitleColor:[UIColor colorWithRed:44/255.0 green:93/255.0 blue:205/255.0 alpha:1.0] forState:UIControlStateNormal];
    [btn25lbl setTitleColor:[UIColor colorWithRed:44/255.0 green:93/255.0 blue:205/255.0 alpha:1.0] forState:UIControlStateHighlighted];
    [btn25selc setSelected:NO];
    checkboxSelected25 = 0;
}
}

- (IBAction)btn26lbl:(id)sender {
if (checkboxSelected26 == 0){
    [btn26lbl setTitleColor:[UIColor magentaColor] forState:UIControlStateNormal];
    [btn26selc setSelected:YES];
    checkboxSelected26 = 1;
} else {
    [btn26lbl setTitleColor:[UIColor colorWithRed:44/255.0 green:93/255.0 blue:205/255.0 alpha:1.0] forState:UIControlStateNormal];
    [btn26lbl setTitleColor:[UIColor colorWithRed:44/255.0 green:93/255.0 blue:205/255.0 alpha:1.0] forState:UIControlStateHighlighted];
    [btn26selc setSelected:NO];
    checkboxSelected26 = 0;
}
}

- (IBAction)btn27lbl:(id)sender {
if (checkboxSelected27 == 0){
    [btn27lbl setTitleColor:[UIColor magentaColor] forState:UIControlStateNormal];
    [btn27selc setSelected:YES];
    checkboxSelected27 = 1;
} else {
    [btn27lbl setTitleColor:[UIColor colorWithRed:44/255.0 green:93/255.0 blue:205/255.0 alpha:1.0] forState:UIControlStateNormal];
    [btn27lbl setTitleColor:[UIColor colorWithRed:44/255.0 green:93/255.0 blue:205/255.0 alpha:1.0] forState:UIControlStateHighlighted];
    [btn27selc setSelected:NO];
    checkboxSelected27 = 0;
}
}

- (IBAction)btn28lbl:(id)sender {
if (checkboxSelected28 == 0){
    [btn28lbl setTitleColor:[UIColor magentaColor] forState:UIControlStateNormal];
    [btn28selc setSelected:YES];
    checkboxSelected28 = 1;
} else {
    [btn28lbl setTitleColor:[UIColor colorWithRed:44/255.0 green:93/255.0 blue:205/255.0 alpha:1.0] forState:UIControlStateNormal];
    [btn28lbl setTitleColor:[UIColor colorWithRed:44/255.0 green:93/255.0 blue:205/255.0 alpha:1.0] forState:UIControlStateHighlighted];
    [btn28selc setSelected:NO];
    checkboxSelected28 = 0;
}
}

- (IBAction)btn29lbl:(id)sender {
if (checkboxSelected29 == 0){
    [btn29lbl setTitleColor:[UIColor magentaColor] forState:UIControlStateNormal];
    [btn29selc setSelected:YES];
    checkboxSelected29 = 1;
} else {
    [btn29lbl setTitleColor:[UIColor colorWithRed:44/255.0 green:93/255.0 blue:205/255.0 alpha:1.0] forState:UIControlStateNormal];
    [btn29lbl setTitleColor:[UIColor colorWithRed:44/255.0 green:93/255.0 blue:205/255.0 alpha:1.0] forState:UIControlStateHighlighted];
    [btn29selc setSelected:NO];
    checkboxSelected29 = 0;
}
}

- (IBAction)btn30lbl:(id)sender {
if (checkboxSelected30 == 0){
    [btn30lbl setTitleColor:[UIColor magentaColor] forState:UIControlStateNormal];
    [btn30selc setSelected:YES];
    checkboxSelected30 = 1;
} else {
    [btn30lbl setTitleColor:[UIColor colorWithRed:44/255.0 green:93/255.0 blue:205/255.0 alpha:1.0] forState:UIControlStateNormal];
    [btn30lbl setTitleColor:[UIColor colorWithRed:44/255.0 green:93/255.0 blue:205/255.0 alpha:1.0] forState:UIControlStateHighlighted];
    [btn30selc setSelected:NO];
    checkboxSelected30 = 0;
}
}

- (IBAction)btn31lbl:(id)sender {
if (checkboxSelected31 == 0){
    [btn31lbl setTitleColor:[UIColor magentaColor] forState:UIControlStateNormal];
    [btn31selc setSelected:YES];
    checkboxSelected31 = 1;
} else {
    [btn31lbl setTitleColor:[UIColor colorWithRed:44/255.0 green:93/255.0 blue:205/255.0 alpha:1.0] forState:UIControlStateNormal];
    [btn31lbl setTitleColor:[UIColor colorWithRed:44/255.0 green:93/255.0 blue:205/255.0 alpha:1.0] forState:UIControlStateHighlighted];
    [btn31selc setSelected:NO];
    checkboxSelected31 = 0;
}
}

- (IBAction)btn32lbl:(id)sender {
if (checkboxSelected32 == 0){
    [btn32lbl setTitleColor:[UIColor magentaColor] forState:UIControlStateNormal];
    [btn32selc setSelected:YES];
    checkboxSelected32 = 1;
} else {
    [btn32lbl setTitleColor:[UIColor colorWithRed:44/255.0 green:93/255.0 blue:205/255.0 alpha:1.0] forState:UIControlStateNormal];
    [btn32lbl setTitleColor:[UIColor colorWithRed:44/255.0 green:93/255.0 blue:205/255.0 alpha:1.0] forState:UIControlStateHighlighted];
    [btn32selc setSelected:NO];
    checkboxSelected32 = 0;
}
}

- (IBAction)btn33lbl:(id)sender {
if (checkboxSelected33 == 0){
    [btn33lbl setTitleColor:[UIColor magentaColor] forState:UIControlStateNormal];
    [btn33selc setSelected:YES];
    checkboxSelected33 = 1;
} else {
    [btn33lbl setTitleColor:[UIColor colorWithRed:44/255.0 green:93/255.0 blue:205/255.0 alpha:1.0] forState:UIControlStateNormal];
    [btn33lbl setTitleColor:[UIColor colorWithRed:44/255.0 green:93/255.0 blue:205/255.0 alpha:1.0] forState:UIControlStateHighlighted];
    [btn33selc setSelected:NO];
    checkboxSelected33 = 0;
}
}

- (IBAction)btn34lbl:(id)sender {
if (checkboxSelected34 == 0){
    [btn34lbl setTitleColor:[UIColor magentaColor] forState:UIControlStateNormal];
    [btn34selc setSelected:YES];
    checkboxSelected34 = 1;
} else {
    [btn34lbl setTitleColor:[UIColor colorWithRed:44/255.0 green:93/255.0 blue:205/255.0 alpha:1.0] forState:UIControlStateNormal];
    [btn34lbl setTitleColor:[UIColor colorWithRed:44/255.0 green:93/255.0 blue:205/255.0 alpha:1.0] forState:UIControlStateHighlighted];
    [btn34selc setSelected:NO];
    checkboxSelected34 = 0;
}
}

- (IBAction)btn35lbl:(id)sender {
if (checkboxSelected35 == 0){
    [btn35lbl setTitleColor:[UIColor magentaColor] forState:UIControlStateNormal];
    [btn35selc setSelected:YES];
    checkboxSelected35 = 1;
} else {
    [btn35lbl setTitleColor:[UIColor colorWithRed:44/255.0 green:93/255.0 blue:205/255.0 alpha:1.0] forState:UIControlStateNormal];
    [btn35lbl setTitleColor:[UIColor colorWithRed:44/255.0 green:93/255.0 blue:205/255.0 alpha:1.0] forState:UIControlStateHighlighted];
    [btn35selc setSelected:NO];
    checkboxSelected35 = 0;
}
}

- (IBAction)newbornbagchecklistinfoView:(id)sender {
    [self Storedata];
newbornchecklistinfoViewController *newborncheckinfoViewController = [[newbornchecklistinfoViewController alloc] initWithNibName:@"newbornchecklistinfoViewController" bundle:nil];
newborncheckinfoViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
[self presentModalViewController:newborncheckinfoViewController animated:YES];

}

- (IBAction)Showbirthplan:(id)sender {
    [self Storedata];
BirthplanViewController *BirthplanView = [[BirthplanViewController alloc] initWithNibName:@"BirthplanViewController" bundle:nil];
BirthplanView.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
[self presentModalViewController:BirthplanView animated:YES];
}

- (IBAction)Toolsview:(id)sender {
    [self Storedata];
ToolsViewController *ToolsView = [[ToolsViewController alloc] initWithNibName:@"ToolsViewController" bundle:nil];
ToolsView.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
[self presentModalViewController:ToolsView animated:YES];

}

- (IBAction)Fun:(id)sender {
    [self Storedata];
FunViewController *FunView = [[FunViewController alloc] initWithNibName:@"FunViewController" bundle:nil];
FunView.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
[self presentModalViewController:FunView animated:YES];
}

- (IBAction)Help:(id)sender {
    [self Storedata];
HelpViewController *HelpView = [[HelpViewController alloc] initWithNibName:@"HelpViewController" bundle:nil];
HelpView.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
[self presentModalViewController:HelpView animated:YES];
}
@end
