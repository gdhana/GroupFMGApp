//
//  AddressBookDetailViewController.m
//  Gurgle VIP Community
//
//  Created by Ravi Ramamrutham on 27/08/2012.
//  Copyright (c) 2012 Ravi Ramamrutham. All rights reserved.
//

#import "AddressBookDetailViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface AddressBookDetailViewController ()

@end

@implementation AddressBookDetailViewController
@synthesize person, delegate, isEditing, personDetails, contactGroupRecordID;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        emailAddressArray = [[NSMutableArray alloc]init];
        emailLabelsArray = [[NSMutableArray alloc] init];
        phoneLabelsArray = [[NSMutableArray alloc] init];
        phoneNumbersArray = [[NSMutableArray alloc] init];
        //personDetails = [[NSMutableDictionary alloc] init];
//        selectedEmailAddress = @"";
//        selectedPhoneNumber = @"";
    }
    return self;
}
- (UIBezierPath *)bezierPathWithCurvedShadowForRect:(CGRect)rect
{
	UIBezierPath *path = [UIBezierPath bezierPath];
    
	CGPoint topLeft = rect.origin;
	CGPoint bottomLeft = CGPointMake(0.0, CGRectGetHeight(rect) + 2);
	CGPoint bottomMiddle = CGPointMake(CGRectGetWidth(rect)/2, CGRectGetHeight(rect) - 2);
	CGPoint bottomRight = CGPointMake(CGRectGetWidth(rect), CGRectGetHeight(rect) + 2);
	CGPoint topRight = CGPointMake(CGRectGetWidth(rect), 0.0);    
	[path moveToPoint:topLeft];
	[path addLineToPoint:bottomLeft];
	[path addQuadCurveToPoint:bottomRight controlPoint:bottomMiddle];
	[path addLineToPoint:topRight];
	[path addLineToPoint:topLeft];
	[path closePath];
    
	return path;
}
- (void)cancel:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)savePerson
{
    personDetails = [[NSMutableDictionary alloc] init];
    ABAddressBookRef addressBook = ABAddressBookCreate();
    ABRecordRef recordRef = ABAddressBookGetPersonWithRecordID(addressBook, person);
    NSString *personName = (__bridge NSString *)ABRecordCopyCompositeName(recordRef);
    [personDetails setObject:personName forKey:@"compositeName"];
    [personDetails setObject:firstName forKey:@"firstName"];
    [personDetails setObject:lastName forKey:lastName];
    
    
    if (selectedPhoneNumber)
    {
        [personDetails setObject:selectedPhoneNumber forKey:@"phoneNumber"];
    }
    if (selectedEmailAddress)
    {
        [personDetails setObject:selectedEmailAddress forKey:@"emailAddress"];
    }
    [personDetails setObject: [NSString stringWithFormat:@"%d",person] forKey:@"personRecord"];
}
- (void)done:(id)sender
{
    [self savePerson];
    [delegate addPersonToCommunity:personDetails];
    [self.navigationController popViewControllerAnimated:YES];
    
}
- (void)cancelEdit:(id)sender
{
    [self dismissModalViewControllerAnimated:YES];
}
- (void)saveEdit:(id)sender
{
    [self savePerson];
    [delegate storeEditedDetailsForPerson:personDetails atLocation:contactGroupRecordID];
}
- (void)viewDidLoad
{
    if (isEditing)
    {
        
        UIBarButtonItem *done = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(saveEdit:)];
        UIBarButtonItem *cancel = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStyleBordered target:self action:@selector(cancelEdit:)];
        self.navigationItem.leftBarButtonItem = cancel;
        self.navigationItem.rightBarButtonItem = done;
        if ([personDetails objectForKey:@"emailAddress"])
        {
            selectedEmailAddress = [personDetails objectForKey:@"emailAddress"];
        }
        if ([personDetails objectForKey:@"phoneNumber"])
        {
            selectedPhoneNumber = [personDetails objectForKey:@"phoneNumber"];
        }
        
    }
    ABAddressBookRef addressBook = ABAddressBookCreate();
    ABRecordRef recordRef = ABAddressBookGetPersonWithRecordID(addressBook, person);
    NSString *personName = (__bridge NSString *)ABRecordCopyCompositeName(recordRef);
    firstName = (__bridge NSString*)ABRecordCopyValue(recordRef, kABPersonFirstNameProperty);
    lastName = (__bridge NSString *)ABRecordCopyValue(recordRef, kABPersonLastNameProperty);
    UIImageView *personImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 80, 80)];
    personImageView.layer.borderColor = [[UIColor whiteColor] CGColor];
    personImageView.layer.borderWidth = 4.0;
    personImageView.layer.shadowOffset = CGSizeMake(0.0, 0.0);
    personImageView.layer.shadowOpacity = 1.0;
    personImageView.layer.shadowRadius = 2.0;
    UIBezierPath *path = [self bezierPathWithCurvedShadowForRect:personImageView.frame];
    personImageView.layer.shadowPath = [path CGPath];
    
    NSData *imageData = (__bridge NSData *)ABPersonCopyImageDataWithFormat(recordRef, kABPersonImageFormatThumbnail);
    if (!imageData)
    {
        personImageView.image = [UIImage imageNamed:@"nophoto.png"];
    }
    else
    {
    personImageView.image = [UIImage imageWithData:imageData];
    }

    [mainScroller addSubview:personImageView];
    
    UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(98, 39, 202, 30)];
    nameLabel.backgroundColor = [UIColor clearColor];
    nameLabel.font = [UIFont boldSystemFontOfSize:20];
    nameLabel.shadowOffset = CGSizeMake(0, 1);
    nameLabel.shadowColor = [UIColor whiteColor];
    nameLabel.text = personName;
    [mainScroller addSubview:nameLabel];
    
        emails = ABRecordCopyValue(recordRef, kABPersonEmailProperty);
        phones = ABRecordCopyValue(recordRef, kABPersonPhoneProperty);
    for (int i=0; i < ABMultiValueGetCount(phones); i++)
    {
        [phoneLabelsArray addObject:(__bridge NSString *)(ABAddressBookCopyLocalizedLabel(ABMultiValueCopyLabelAtIndex(phones, i)))];
        [phoneNumbersArray addObject:(__bridge NSString *)(ABAddressBookCopyLocalizedLabel(ABMultiValueCopyValueAtIndex(phones, i)))];
    }
    for (int i=0; i < ABMultiValueGetCount(emails); i++)
    {
        [emailLabelsArray addObject:(__bridge NSString *)(ABAddressBookCopyLocalizedLabel(ABMultiValueCopyLabelAtIndex(emails, i)))];
        [emailAddressArray addObject:(__bridge NSString *)(ABAddressBookCopyLocalizedLabel(ABMultiValueCopyValueAtIndex(emails, i)))];
    }
    int height = 80 + [emailAddressArray count] * 44 + [phoneNumbersArray count] * 44;
    
    contactsTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 110, 320, height) style:UITableViewStyleGrouped];
    contactsTable.scrollEnabled = NO;
    contactsTable.delegate = self;
    contactsTable.dataSource = self;
    [mainScroller addSubview:contactsTable];
    if ([phoneNumbersArray count] > 0 || [emailAddressArray count] > 0)
    {
        contactsTable.hidden = NO;
    }
    else
    {
        contactsTable.hidden = YES;
    }
    mainScroller.contentSize = CGSizeMake(320, 200 + height);
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
#pragma mark - Table view data source
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0 && [phoneNumbersArray count] > 0)
    {
        return @"Select a phone number";
    }
    else if (section == 1 && [emailAddressArray count] > 0)
    {
        return @"Select an email address";
    }
    return nil;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    int retValue = 0;
    if ([phoneNumbersArray count] > 0)
    {
        retValue++;
    }
    if ([emailAddressArray count] > 0)
    {
        retValue++;
    }
        return retValue;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0)
    {
        return [phoneNumbersArray count];
    }
    else if (section == 1)
    {
        return [emailAddressArray count];
    }
    return 0;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:CellIdentifier];
    }
    if (indexPath.section == 0)
    {
        if ([[phoneNumbersArray objectAtIndex:indexPath.row] isEqualToString:selectedPhoneNumber])
        {
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
        }
        else
        {
            cell.accessoryType = UITableViewCellAccessoryNone;
        }
        cell.textLabel.text = [phoneLabelsArray objectAtIndex:indexPath.row];
        cell.detailTextLabel.text = [phoneNumbersArray objectAtIndex:indexPath.row];
    }
    else if (indexPath.section == 1)
    {
        if ([[emailAddressArray objectAtIndex:indexPath.row] isEqualToString:selectedEmailAddress])
        {
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
        }
        else
        {
            cell.accessoryType = UITableViewCellAccessoryNone;
        }
        cell.textLabel.text = [emailLabelsArray objectAtIndex:indexPath.row];
        cell.detailTextLabel.text = [emailAddressArray objectAtIndex:indexPath.row];
        
        
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    // Configure the cell...

    return cell;
}



#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    if (indexPath.section == 0)
    {
        if ([selectedPhoneNumber isEqualToString:(__bridge NSString*)ABMultiValueCopyValueAtIndex(phones, indexPath.row)])
        {
            selectedPhoneNumber = @"";
        }
        else
        {
            selectedPhoneNumber = (__bridge NSString*)ABMultiValueCopyValueAtIndex(phones, indexPath.row);
        }
    }
    else if (indexPath.section == 1)
    {
        if ([selectedEmailAddress isEqualToString:(__bridge NSString *)ABMultiValueCopyValueAtIndex(emails, indexPath.row)])
        {
            selectedEmailAddress = @"";
        }
        else
        {
        selectedEmailAddress = (__bridge NSString *)ABMultiValueCopyValueAtIndex(emails, indexPath.row);            
        }

    }
    [tableView reloadData];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
