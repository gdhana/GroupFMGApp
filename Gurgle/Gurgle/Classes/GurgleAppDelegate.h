//
//  GurgleAppDelegate.h
//  Gurgle
//
//  Created by Dhanasekar Gunabalan on 5/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SKPSMTPMessage.h"
#import <CoreLocation/CoreLocation.h>

@class IntroScreenViewController;
@class MainmenuViewController;

@interface GurgleAppDelegate : UIResponder <UIApplicationDelegate, SKPSMTPMessageDelegate, CLLocationManagerDelegate>
{
    UITabBarController *gurgleTabBar;
    
    SKPSMTPState HighestState;
    CLLocationManager *locationManager;
}

@property (strong, nonatomic) UIWindow *window;
//@property (strong, nonatomic) UITabBarController *gurgleTabBar;
@property (strong, nonatomic) IntroScreenViewController *IntroScreenViewController;
@property (strong, nonatomic) MainmenuViewController *mainmenu;

- (void)messageSent:(SKPSMTPMessage *)SMTPmessage;
- (void)messageFailed:(SKPSMTPMessage *)SMTPmessage error:(NSError *)error;

@end


//sachin_bat2001@yahoo.co.in  kishore.mib@gmail.com Abc@1234