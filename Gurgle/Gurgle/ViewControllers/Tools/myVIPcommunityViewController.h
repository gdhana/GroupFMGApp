//
//  myVIPcommunityViewController.h
//  Gurgle
//
//  Created by Dhanasekar Gunabalan on 6/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AddressBookUI/AddressBookUI.h>
#import <MessageUI/MessageUI.h>
#import "AddressBookDetailViewController.h"

@interface myVIPcommunityViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, MFMessageComposeViewControllerDelegate, MFMailComposeViewControllerDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate, AddressBookDetailDelegate>
{
    IBOutlet UIImageView *bottombanner;
    IBOutlet UIImageView *Topbanner;
    
    IBOutlet UITextView *noContactsLabel;
    IBOutlet UITableView *contactsTableView;
    IBOutlet UIToolbar *contactsToolbar;
    IBOutlet UIBarButtonItem *sendSMS;
    IBOutlet UIBarButtonItem *sendMail;
    IBOutlet UIBarButtonItem *sendPhoto;
    IBOutlet UIBarButtonItem *editButton;
    
}
- (IBAction)myVIPcommunityinfoView:(id)sender;

- (IBAction)showBirthplanView:(id)sender;
- (IBAction)ToolsView:(id)sender;
- (IBAction)FunView:(id)sender;
- (IBAction)HelpView:(id)sender;



@property (nonatomic, retain) NSString *selectedContactMethod;
@property (nonatomic, retain) NSMutableArray *contactGroupPeople;


@end