//
//  AddressBookViewController.m
//  Gurgle VIP Community
//
//  Created by Ravi Ramamrutham on 20/08/2012.
//  Copyright (c) 2012 Ravi Ramamrutham. All rights reserved.
//

#import "AddressBookViewController.h"
#import "AddressBookPersonCell.h"

#import "NSAttributedString+Attributes.h"
@interface AddressBookViewController ()

@end

@implementation AddressBookViewController

@synthesize peopleArray;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        selectedPeople = [[NSMutableArray alloc] initWithArray:[[[NSUserDefaults standardUserDefaults] objectForKey:@"vipCommunity"] mutableCopy]];
    }
    return self;
}
- (void)addPersonToCommunity:(NSDictionary *)person
{
    [selectedPeople addObject:person];
    [contactsTable reloadData];
}
- (void)viewDidLoad
{
    appAddressBook = ABAddressBookCreate();

    
    
    ABAddressBookRef addressBook = ABAddressBookCreate();
    ABRecordRef source = ABAddressBookCopyDefaultSource(addressBook);
    allPeople = ABAddressBookCopyArrayOfAllPeopleInSourceWithSortOrdering(addressBook, source, kABPersonSortByLastName);    ;
    UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancel:)];
    self.navigationItem.leftBarButtonItem = cancelButton;
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(done:)];
    self.navigationItem.rightBarButtonItem = doneButton;
    self.title = @"Contacts";
    self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:63.0/255.0 green:205.0/255.0 blue:245.0/255.0 alpha:1.0];
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}
- (IBAction)cancel:(id)sender
{
    [self dismissModalViewControllerAnimated:YES];
}
- (IBAction)done:(id)sender
{
    [[NSUserDefaults standardUserDefaults] setObject:selectedPeople forKey:@"vipCommunity"];
    [self dismissModalViewControllerAnimated:YES];
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.

    return CFArrayGetCount(allPeople);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    AddressBookPersonCell *cell = (AddressBookPersonCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell)
    {
        cell = [[AddressBookPersonCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }

    ABRecordRef person = CFArrayGetValueAtIndex(allPeople, indexPath.row);
    ABRecordID personID = ABRecordGetRecordID(person);
    
    
    if ([selectedPeople containsObject:[NSNumber numberWithInt:personID]])
    {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    else
    {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    

    
    
    NSString *firstName = (__bridge NSString *)ABRecordCopyValue(person, kABPersonFirstNameProperty);
    NSString *lastName = (__bridge NSString*)ABRecordCopyValue(person, kABPersonLastNameProperty);
    NSMutableString *displayName;
    if (!firstName && !lastName)
    {
        lastName = (__bridge NSString*)ABRecordCopyValue(person, kABPersonOrganizationProperty);
    }    
    
    displayName = [NSString stringWithFormat:@"%@ %@",firstName ? firstName : @"",lastName ? lastName : @""];
    NSMutableAttributedString *display = [[NSMutableAttributedString alloc] initWithString:displayName];
    [display setFont:[UIFont systemFontOfSize:18]];
    if (lastName)
    {
    [display setTextBold:YES range:[displayName rangeOfString:lastName]];
    }
    for (NSDictionary *people in selectedPeople)
    {
        if ([[people objectForKey:@"compositeName"] isEqualToString:(__bridge NSString *)(ABRecordCopyCompositeName(person))])
        {
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
        }
    }
    cell.personNameLabel.attributedText = display;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44.0;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    AddressBookDetailViewController *personDetail = [[AddressBookDetailViewController alloc] initWithNibName:@"AddressBookDetailViewController" bundle:nil];
    personDetail.person = ABRecordGetRecordID(CFArrayGetValueAtIndex(allPeople, indexPath.row));
    personDetail.delegate = self;
    UIBarButtonItem *cancel = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:personDetail action:@selector(cancel:)];
    personDetail.navigationItem.leftBarButtonItem = cancel;
    
    UIBarButtonItem *done = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:personDetail action:@selector(done:)];
    personDetail.navigationItem.rightBarButtonItem = done;
    
    [self.navigationController pushViewController:personDetail animated:YES];
}

@end
