//
//  myVIPcommunityViewController.m
//  Gurgle
//
//  Created by Dhanasekar Gunabalan on 6/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "myVIPcommunityViewController.h"
#import "AddressBookViewController.h"

#import "myVIPcommunityinfoViewController.h"

#import "BirthplanViewController.h"
#import "ToolsViewController.h"
#import "FunViewController.h"
#import "HelpViewController.h"
#import "GurgleAdViewController.h"

@interface myVIPcommunityViewController ()

@end

@implementation myVIPcommunityViewController

@synthesize contactGroupPeople, selectedContactMethod;
- (void)viewDidLoad
{
    contactGroupPeople = [[NSMutableArray alloc] init];
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    editButton = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}
- (void)viewWillAppear:(BOOL)animated
{
    contactGroupPeople = [[[NSUserDefaults standardUserDefaults] objectForKey:@"vipCommunity"] mutableCopy];
    [self checkContactAvailabilityity];
}
- (void)checkContactAvailabilityity
{
    
    BOOL shouldEnableSMS = NO;
    BOOL shouldEnableEmail = NO;
    sendMail.enabled = NO;
    sendPhoto.enabled = NO;
    sendSMS.enabled = NO;
    if ([contactGroupPeople count] > 0)
    {
        contactsTableView.hidden = NO;
        noContactsLabel.hidden = YES;
        editButton.enabled = YES;
        editButton.target = self;
        editButton.action = @selector(startEditing:);
    }
    else
    {
        contactsTableView.hidden = YES;
        noContactsLabel.hidden = NO;
        editButton.enabled = NO;
    }
    for (NSDictionary *contactPerson in contactGroupPeople)
    {
        if ([contactPerson objectForKey:@"emailAddress"])
        {
            shouldEnableEmail = YES;
        }
        if ([contactPerson objectForKey:@"phoneNumber"])
        {
            shouldEnableSMS = YES;
        }
    }
    
    if (shouldEnableEmail)
    {
        sendMail.enabled = YES;
        sendPhoto.enabled = YES;
    }
    if (shouldEnableSMS)
    {
        sendSMS.enabled = YES;
    }
    [contactsTableView reloadData];
}
- (IBAction)sendSMS:(id)sender
{
    if ([MFMessageComposeViewController canSendText])
    {
        MFMessageComposeViewController *smsSender = [[MFMessageComposeViewController alloc] init];
        NSMutableArray *recipients = [[NSMutableArray alloc] init];
        for (NSDictionary *person in contactGroupPeople)
        {
            if ([person objectForKey:@"phoneNumber"])
            {
                
                [recipients addObject:[person objectForKey:@"phoneNumber"]];
            }
        }
        smsSender.recipients = recipients;
        smsSender.messageComposeDelegate = self;
        [self presentModalViewController:smsSender animated:YES];
    }
}
- (void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result
{
    [self dismissModalViewControllerAnimated:YES];
    
    switch (result) {
        case MessageComposeResultSent:
        {
            UIAlertView *sentAlert = [[UIAlertView alloc] initWithTitle:@"Success" message:@"Your message has been queued to be sent" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            [sentAlert show];
        }
            break;
        case MessageComposeResultFailed:
        {
            UIAlertView *sentAlert = [[UIAlertView alloc] initWithTitle:@"Failure" message:@"Your message could not be sent at this time. Please try later" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            [sentAlert show];
        }
        default:
            break;
    }
    
}

- (IBAction)sendMail
{
    if ([MFMailComposeViewController canSendMail])
    {
        MFMailComposeViewController *mailSender = [[MFMailComposeViewController alloc] init];
        mailSender.delegate = self;
        NSMutableArray *recipients = [[NSMutableArray alloc] init];
        for (NSDictionary *person in contactGroupPeople)
        {
            if ([person objectForKey:@"emailAddress"])
            {
                [recipients addObject:[person objectForKey:@"emailAddress"]];
            }
        }
        [mailSender setToRecipients:recipients];
        mailSender.mailComposeDelegate = self;
        [self presentModalViewController:mailSender animated:YES];
        
    }
}

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    [self dismissModalViewControllerAnimated:YES];
}

- (IBAction)sendPhoto:(id)sender
{
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.delegate = self;
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary])
    {
        imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        [self presentModalViewController:imagePicker animated:YES];
    }
    
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [self dismissModalViewControllerAnimated:NO];
    UIImage *image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    //[self performSelector:@selector(sendMailWithAttachment:) withObject:image afterDelay:0.5];
    [self sendMailWithAttachment:image];
    
}
- (void)sendMailWithAttachment:(UIImage *)image
{
    if ([MFMailComposeViewController canSendMail])
    {
        MFMailComposeViewController *mailSender = [[MFMailComposeViewController alloc] init];
        mailSender.delegate = self;
        NSMutableArray *recipients = [[NSMutableArray alloc] init];
        for (NSDictionary *person in contactGroupPeople)
        {
            if ([person objectForKey:@"emailAddress"])
            {
                [recipients addObject:[person objectForKey:@"emailAddress"]];
            }
        }
        [mailSender addAttachmentData:UIImagePNGRepresentation(image) mimeType:@"image/png" fileName:@"gurgle.png"];
        [mailSender setToRecipients:recipients];
        mailSender.mailComposeDelegate = self;
        [self presentModalViewController:mailSender animated:YES];
        
    }
    
}
- (IBAction)addContacts:(id)sender
{
    if ([contactsTableView isEditing])
    {
        [self stopEditing:nil];
    }
    AddressBookViewController *adddView = [[AddressBookViewController alloc] initWithNibName:@"AddressBookViewController" bundle:nil];
    UINavigationController *addressNav = [[UINavigationController alloc] initWithRootViewController:adddView];
    [self presentModalViewController:addressNav animated:YES];
    
}
- (void)storeEditedDetailsForPerson:(NSDictionary *)person atLocation:(int)location
{
    if ([[person objectForKey:@"emailAddress"] isEqualToString:@""] && [[person objectForKey:@"phoneNumber"] isEqualToString:@""])
    {
        [contactGroupPeople removeObjectAtIndex:location];
    }
    else
    {
        [contactGroupPeople replaceObjectAtIndex:location
                                      withObject:person];
    }
    [[NSUserDefaults standardUserDefaults] setObject:contactGroupPeople forKey:@"vipCommunity"];
    [contactsTableView reloadData];
    [self dismissModalViewControllerAnimated:YES];
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark - Table view data source
- (IBAction)startEditing:(id)sender
{
    [contactsTableView setEditing:YES];
    editButton.style = UIBarButtonItemStyleDone;
    editButton.title = @"Done";
    editButton.action = @selector(stopEditing:);
}
- (IBAction)stopEditing:(id)sender
{
    [contactsTableView setEditing:NO];
    editButton.style = UIBarButtonItemStyleBordered;
    editButton.title = @"Edit";
    editButton.action = @selector(startEditing:);
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [contactGroupPeople count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%@",[[contactGroupPeople objectAtIndex:indexPath.row] objectForKey:@"compositeName"]];
    cell.textLabel.font = [UIFont boldSystemFontOfSize:17];
    cell.textLabel.textColor = [UIColor blueColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}



// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [contactGroupPeople removeObjectAtIndex:indexPath.row];
        [[NSUserDefaults standardUserDefaults] setObject:contactGroupPeople forKey:@"vipCommunity"];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [self checkContactAvailabilityity];
        
    }
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
}



#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    AddressBookDetailViewController *addressBookDetail = [[AddressBookDetailViewController alloc] initWithNibName:@"AddressBookDetailViewController" bundle:nil];
    addressBookDetail.person = [[[contactGroupPeople objectAtIndex:indexPath.row] objectForKey:@"personRecord"] intValue];
    addressBookDetail.isEditing = YES;
    addressBookDetail.personDetails = [contactGroupPeople objectAtIndex:indexPath.row];
    addressBookDetail.contactGroupRecordID = indexPath.row;
    addressBookDetail.delegate = self;
    UINavigationController *detailNav = [[UINavigationController alloc] initWithRootViewController:addressBookDetail];
    detailNav.navigationBar.tintColor = [UIColor colorWithRed:63.0/255.0 green:206.0/255.0 blue:245.0/255.0 alpha:1.0];
    [self presentModalViewController:detailNav animated:YES];
    
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

- (IBAction)myVIPcommunityinfoView:(id)sender;
{
    myVIPcommunityinfoViewController *myVIPcommunityinfoView = [[myVIPcommunityinfoViewController alloc] initWithNibName:@"myVIPcommunityinfoViewController" bundle:nil];
    myVIPcommunityinfoView.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentModalViewController:myVIPcommunityinfoView animated:YES];
}

- (IBAction)showBirthplanView:(id)sender
{
    BirthplanViewController *BirthplanView = [[BirthplanViewController alloc] initWithNibName:@"BirthplanViewController" bundle:nil];
    BirthplanView.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentModalViewController:BirthplanView animated:YES];
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

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

@end
