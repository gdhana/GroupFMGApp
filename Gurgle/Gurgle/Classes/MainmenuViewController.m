//
//  MainmenuViewController.m
//  Gurgle
//
//  Created by Dhanasekar Gunabalan on 6/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MainmenuViewController.h"

#import "BirthplanViewController.h"
#import "ToolsViewController.h"
#import "FunViewController.h"
#import "HelpViewController.h"
#import "InfoViewController.h"
#import "IntroScreenViewController.h"
#import "GurgleAdViewController.h"

@interface MainmenuViewController ()

@end

@implementation MainmenuViewController

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
//    NSArray *myImageNames = [NSArray arrayWithObjects:@"huggies_banner.png", @"huggies_banner2.png", @"huggies_banner3.png", @"huggies_banner4.png", @"huggies_banner5.png", nil];
//    int index = arc4random() % [myImageNames count]; 
//    
//    UIImage *myImage = [UIImage imageNamed:[myImageNames objectAtIndex:index]];
//     bottombanner.image = myImage;

    
//    NSArray *myImageNames = [NSArray arrayWithObjects: 
//                                 [UIImage imageNamed:@"huggies_banner.png"],                              
//                                 [UIImage imageNamed:@"Banner1.jpg"],[UIImage imageNamed:@"Banner2.jpg"],[UIImage imageNamed:@"Banner3.jpg"],[UIImage imageNamed:@"Banner4.jpg"],[UIImage imageNamed:@"Banner5.jpg"], nil];
////    int index = arc4random() % [myImageNames count];
//    //UIImage *myImage = [UIImage imageNamed:[myImageNames objectAtIndex:index]];
//    bottombanner.animationImages = myImageNames;
//    bottombanner.animationDuration = 25.0; // seconds
//    bottombanner.animationRepeatCount = 0; //0 loops for ever/noted
//    [bottombanner startAnimating];

    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    bottombanner = nil;
    Topbanner = nil;
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
//        UIWebView* testWebView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
//        
//        [self.view addSubview:testWebView];
//        [testWebView setDelegate:(id)self];
//        [testWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://google.com"]]];
//        UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//        [button addTarget:self 
//                   action:@selector(closemethod:)
//         forControlEvents:UIControlEventTouchDown];
//        [button setTitle:@"Show View" forState:UIControlStateNormal];
//        button.frame = CGRectMake(80.0, 210.0, 160.0, 40.0);
//        [testWebView addSubview:button];

//[self dismissModalViewControllerAnimated:YES];
       // [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.huggiesclub.co.uk/products/nappies/newborn"]];
        //http://www.huggiesclub.co.uk/products/nappies/newborn
        //www.cordcare.com
        //http://www.huggiesclub.co.uk/products/nappies/newborn
        
        //A bottom of each page Find our more by visiting 
       // Huggies® Club website www.huggiesclub.co.uk, Twitter @HuggiesClubUK, or Facebook www.facebook.com/HuggiesclubUK.
    }
    if ([touch view] == Topbanner){
        GurgleAdViewController *GurgleAdView = [[GurgleAdViewController alloc] initWithNibName:@"GurgleAdViewController" bundle:nil urlString:@"http://www.gurgle.com" title:@"Gurgle"];
        GurgleAdView.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        [self presentModalViewController:GurgleAdView animated:NO];
    }
}

- (IBAction)BirthplanView:(id)sender
{
    BirthplanViewController *BirthplanView = [[BirthplanViewController alloc] initWithNibName:@"BirthplanViewController" bundle:nil];
    BirthplanView.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentModalViewController:BirthplanView animated:YES];
    //[self.view addSubview:questionnaire.view];
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
- (IBAction)InfoView:(id)sender
{
    InfoViewController *InfoView = [[InfoViewController alloc] initWithNibName:@"InfoViewController" bundle:nil];
    InfoView.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentModalViewController:InfoView animated:YES];
    
}

- (IBAction)ShowIntroscreenView:(id)sender
{
    IntroScreenViewController *IntroScreenView = [[IntroScreenViewController alloc] initWithNibName:@"IntroScreenViewController" bundle:nil];
    IntroScreenView.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentModalViewController:IntroScreenView animated:YES];
}
//For Testing
//- (IBAction)sendMail:(id)sender {
//    
//    NSString *t1 = @"T1Test"; NSString *t2 = @"T2";
//    NSString *emailBody =[NSString stringWithFormat:@"Your birth plan:\nYour name: %@        What you liked to be called : %@\n \"Success\".\n\n",t1,t2]; 
//    SKPSMTPMessage *test_smtp_message = [[SKPSMTPMessage alloc] init];
//    test_smtp_message.fromEmail = @"dhanasekar.gunabalan@groupfmg.com";
//    test_smtp_message.toEmail = @"dhanasekar.gunabalan@groupfmg.com";
//    test_smtp_message.relayHost = @"email.wearefmg.net";
//    test_smtp_message.requiresAuth = 0;
//    test_smtp_message.login = @"dhanasekar.gunabalan";
//    test_smtp_message.pass =@"roja@1234";
//    test_smtp_message.wantsSecure = 1; // smtp.gmail.com doesn't work without TLS!
//    test_smtp_message.subject = @"My birth plan part1";
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
////    Spinner.hidden = NO;
////    [Spinner startAnimating];
////    ProgressBar.hidden = NO;
//    HighestState = 0;
//    
//    [test_smtp_message send];
//    ToolsViewController *ToolsView = [[ToolsViewController alloc] initWithNibName:@"ToolsViewController" bundle:nil];
//    ToolsView.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
//    [self presentModalViewController:ToolsView animated:YES];
//}
//
//- (IBAction)switchSSL:(UISwitch *)sender;
//{
//    
//}
//- (IBAction)switchSendImage:(UISwitch *)sender;
//{
//    
//}
//- (IBAction)switchSendVCF:(UISwitch *)sender;
//{
//    
//}
//- (IBAction)switchUseAuth:(UISwitch *)sender;
//{
//    
//}
//
//#pragma mark SKPSMTPMessage Delegate Methods
//- (void)messageState:(SKPSMTPState)messageState;
//{
//    NSLog(@"HighestState:%d", HighestState);
//    if (messageState > HighestState)
//        HighestState = messageState;
//    
//   // ProgressBar.progress = (float)HighestState/(float)kSKPSMTPWaitingSendSuccess;
//    
//}
//- (void)messageSent:(SKPSMTPMessage *)SMTPmessage
//{
//   // [SMTPmessage release];
//    
////    Spinner.hidden = YES;
////    [Spinner stopAnimating];
////    ProgressBar.hidden = YES;
//    
////    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Success" message:@"Sent!"
////                                                   delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
////    [alert show];    
//  //  [alert release];
//    // DEBUGLOG(@"delegate - message sent");
//    
//}
//- (void)messageFailed:(SKPSMTPMessage *)SMTPmessage error:(NSError *)error
//{
//   // [SMTPmessage release];
//    
////    Spinner.hidden = YES;
////    [Spinner stopAnimating];
////    ProgressBar.hidden = YES;
//    
////    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:[error localizedDescription]
////                                                   delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
////    [alert show];    
//   // [alert release];
//    //  DEBUGLOG(@"delegate - error(%d): %@", [error code], [error localizedDescription]);
//}
@end
