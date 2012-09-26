//
//  AddressBookViewController.h
//  Gurgle VIP Community
//
//  Created by Ravi Ramamrutham on 20/08/2012.
//  Copyright (c) 2012 Ravi Ramamrutham. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AddressBook/AddressBook.h>
#import "AddressBookDetailViewController.h"
@interface AddressBookViewController : UIViewController
<UITableViewDataSource, UITableViewDelegate, AddressBookDetailDelegate>
{
    IBOutlet UITableView *contactsTable;
    CFArrayRef allPeople;
    NSMutableArray *selectedPeople;
    ABAddressBookRef appAddressBook;
    
}

@property (nonatomic, retain) NSArray *peopleArray;
@end
