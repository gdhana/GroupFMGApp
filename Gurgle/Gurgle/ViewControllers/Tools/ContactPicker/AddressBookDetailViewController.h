//
//  AddressBookDetailViewController.h
//  Gurgle VIP Community
//
//  Created by Ravi Ramamrutham on 27/08/2012.
//  Copyright (c) 2012 Ravi Ramamrutham. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AddressBook/AddressBook.h>
@protocol AddressBookDetailDelegate <NSObject>
- (void)addPersonToCommunity:(NSDictionary *)person;
@end

@interface AddressBookDetailViewController : UIViewController
<UIScrollViewDelegate, UITableViewDataSource, UITableViewDelegate>
{
    IBOutlet UIScrollView *mainScroller;
    NSMutableArray *phoneLabelsArray;
    NSMutableArray *phoneNumbersArray;
    NSMutableArray *emailLabelsArray;
    NSMutableArray *emailAddressArray;
    IBOutlet UITableView *contactsTable;
    ABMultiValueRef emails;
    ABMultiValueRef phones;
    NSString *firstName;
    NSString *lastName;
    NSString *selectedPhoneNumber;
    NSString *selectedEmailAddress;
}
@property (nonatomic, retain) id<AddressBookDetailDelegate>delegate;
@property (assign) ABRecordID person;
@end
