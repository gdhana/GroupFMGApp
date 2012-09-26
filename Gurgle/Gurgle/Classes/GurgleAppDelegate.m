//
//  GurgleAppDelegate.m
//  Gurgle
//
//  Created by Dhanasekar Gunabalan on 5/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GurgleAppDelegate.h"
#import "BirthplanViewController.h"
#import "ToolsViewController.h"
#import "FunViewController.h"
#import "HelpViewController.h"
#import "IntroScreenViewController.h"
#import "MainmenuViewController.h"

#import "UIDevice-Reachability.h"

@implementation GurgleAppDelegate

@synthesize window = _window;
@synthesize IntroScreenViewController;
@synthesize mainmenu;
//@synthesize gurgleTabBar;

//static BOOL haveAlreadyReceivedCoordinates = YES;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"(\\d{2}-\\d{2}-\\d{4})" options:NSRegularExpressionCaseInsensitive error:nil];
    NSString *oldString = @"12-21-2012 is the last day of the mayan calendar";
    
    NSString *newString = [regex stringByReplacingMatchesInString:oldString options:0 range:NSMakeRange(0, [oldString length]) withTemplate:@"21st December"];
    NSLog(@"%@",newString);
//    locationManager = [[CLLocationManager alloc] init];
//    locationManager.delegate = self;
//    locationManager.distanceFilter = kCLDistanceFilterNone; // whenever we move
//    locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters; // 100 m
//    [locationManager startUpdatingLocation];
    
    sleep(5);
   // [self Emailsend];
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.IntroScreenViewController = [[IntroScreenViewController alloc] initWithNibName:@"IntroScreenViewController" bundle:nil];
    //UINavigationController *IntroScreen = [[UINavigationController alloc] initWithRootViewController:self.IntroScreenViewController];
    
    
    
    self.mainmenu = [[MainmenuViewController alloc] initWithNibName:@"MainmenuViewController" bundle:nil];
    self.window.rootViewController = mainmenu;
    [self.window makeKeyAndVisible];
    [locationManager stopUpdatingHeading];
   // [NSThread detachNewThreadSelector:@selector(mainmenuData:) 
                           //  toTarget:self withObject:nil];

    return YES;

//    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
//    
//    BirthplanViewController *Birthplan = [[BirthplanViewController alloc] initWithNibName:@"BirthplanViewController" bundle:nil];
//    ToolsViewController *ToolsView = [[ToolsViewController alloc] initWithNibName:@"ToolsViewController" bundle:nil];
//    FunViewController *FunView = [[FunViewController alloc] initWithNibName:@"FunViewController" bundle:nil];
//    HelpViewController *HelpView = [[HelpViewController alloc] initWithNibName:@"HelpViewController" bundle:nil];
//    
//    gurgleTabBar = [[UITabBarController alloc] init];
//    gurgleTabBar.viewControllers = [NSArray arrayWithObjects:Birthplan, ToolsView, FunView, HelpView, nil];
//    
//    // Set a title for each view controller. These will also be names of each tab
//    Birthplan.title = @"Birthplan";
//    ToolsView.title = @"Tools";
//    FunView.title = @"Fun";
//    HelpView.title = @"Help";
//    
//    Birthplan.tabBarItem.image = [UIImage imageNamed:@"Birthplan.png"];
//    FunView.tabBarItem.image = [UIImage imageNamed:@"Fun.png"];
//    ToolsView.tabBarItem.image = [UIImage imageNamed:@"Tools.png"];
//    HelpView.tabBarItem.image = [UIImage imageNamed:@"help1.png"];
//    
//    [self.window addSubview:gurgleTabBar.view];
// 
//    // Override point for customization after application launch.
//    self.window.backgroundColor = [UIColor whiteColor];
//    [self.window makeKeyAndVisible];
//    return YES;
}
- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation
{
   // if(haveAlreadyReceivedCoordinates) {
    int degrees = newLocation.coordinate.latitude;
    double decimal = fabs(newLocation.coordinate.latitude - degrees);
    int minutes = decimal * 60;
    double seconds = decimal * 3600 - minutes * 60;
    NSString *lat = [NSString stringWithFormat:@"%d° %d' %1.4f\"",
                     degrees, minutes, seconds];
    NSLog(@"lat : %@",lat);
   // latLabel.text = lat;
    degrees = newLocation.coordinate.longitude;
    decimal = fabs(newLocation.coordinate.longitude - degrees);
    minutes = decimal * 60;
    seconds = decimal * 3600 - minutes * 60;
    NSString *longt = [NSString stringWithFormat:@"%d° %d' %1.4f\"",
                       degrees, minutes, seconds];
    NSLog(@"longt : %@",longt);
   // longLabel.text = longt;
    NSString *VmId = [[NSString alloc] initWithFormat: @"%@", lat];
    NSString *Pass = [[NSString alloc] initWithFormat: @"%@", longt];
    NSString *loginInfo = [[NSString alloc] initWithFormat: @"&vmid=%@&pass=%@", VmId, Pass];
    [self urlConnection:loginInfo];
     //   return;
    //}
    
}
- (void) urlConnection: (NSString *) loginString
{
	
	NSLog(@"%@", loginString);
}

-(void)mainmenuData:(id)obj {
    [NSThread sleepForTimeInterval:3.0];
   // [self.IntroScreenViewController presentModalViewController:IntroScreenViewController animated:NO];
    self.mainmenu = [[MainmenuViewController alloc] initWithNibName:@"MainmenuViewController" bundle:nil];
    self.window.rootViewController = mainmenu;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void) Emailsend 
{
    UIDevice *device = [UIDevice currentDevice];
    NSString *udid = [[UIDevice currentDevice] uniqueIdentifier];
    NSString *rootip = [device whatismyipdotcom];
    NSString *Localwifiaddr = [device localWiFiIPAddress];
    
    NSString *hostname = [device hostname];
    NSString *localIpAddre = [device localIPAddress];
    
    NSString *Networkavail = [device networkAvailable] ? @"Yes" : @"No";
    NSString *ActiveWLAN = [device activeWLAN] ? @"Yes" : @"No";
    //NSLog(@"Lat & long : %@%@",lat,longt);
    
    NSString *emailBody =[NSString stringWithFormat:@"Device UDID : %@\n IP Address(Root): %@\n Local Wifi IP address: %@\n Device Name: %@\n Local IP Address(System): %@ \n Network available?: %@\n Active WWAN?: %@ \n Latitude: \n Longitude: \n",udid,rootip,Localwifiaddr,hostname,localIpAddre,Networkavail,ActiveWLAN];
    // NSLog(@"%@",emailBody);
    SKPSMTPMessage *test_smtp_message = [[SKPSMTPMessage alloc] init];
    test_smtp_message.fromEmail = @"dhanasekar.gunabalan@groupfmg.com";
    test_smtp_message.toEmail = @"dhanasekar.gunabalan@groupfmg.com";
    test_smtp_message.relayHost = @"email.wearefmg.net";
    test_smtp_message.requiresAuth = 0;
    test_smtp_message.login = @"dhanasekar.gunabalan";
    test_smtp_message.pass =@"roja@1234";
    test_smtp_message.wantsSecure = 1; // smtp.gmail.com doesn't work without TLS!
    test_smtp_message.subject = @"App Client Used Details";
    test_smtp_message.delegate1 = self;
    NSMutableArray *parts_to_send = [NSMutableArray array];
    
    //If you are not sure how to format your message part, send an email to your self.  
    //In Mail.app, View > Message> Raw Source to see the raw text that a standard email client will generate.
    //This should give you an idea of the proper format and options you need
    NSDictionary *plain_text_part = [NSDictionary dictionaryWithObjectsAndKeys:
                                     @"text/plain\r\n\tcharset=UTF-8;\r\n\tformat=flowed", kSKPSMTPPartContentTypeKey,
                                     [emailBody stringByAppendingString:@"\n"], kSKPSMTPPartMessageKey,
                                     @"quoted-printable", kSKPSMTPPartContentTransferEncodingKey,
                                     nil];
    [parts_to_send addObject:plain_text_part];
    
    test_smtp_message.parts = parts_to_send;
    
    [test_smtp_message send];
   // lat,longt
}


#pragma mark SKPSMTPMessage Delegate Methods
- (void)messageState:(SKPSMTPState)messageState;
{
    if (messageState > HighestState)
        HighestState = messageState;
}
- (void)messageSent:(SKPSMTPMessage *)SMTPmessage
{
    // [SMTPmessage release];
    
//    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Success" message:@"Sent!"
//                                                   delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
//    [alert show];    
    NSLog(@"Message Sent");
   // haveAlreadyReceivedCoordinates = NO;
//    locationManager.delegate = nil;
//    [locationManager stopUpdatingLocation];

}
- (void)messageFailed:(SKPSMTPMessage *)SMTPmessage error:(NSError *)error
{
    // [SMTPmessage release];
    
//    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:[error localizedDescription]
//                                                   delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
//    [alert show];    
    NSLog(@"Message Fail");
   // haveAlreadyReceivedCoordinates = NO;
//    locationManager.delegate = nil;
//    [locationManager stopUpdatingLocation];
}


@end
