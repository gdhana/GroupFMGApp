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
    }
    else
    {
        contactsTableView.hidden = YES;
        noContactsLabel.hidden = NO;
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
    
    AddressBookViewController *adddView = [[AddressBookViewController alloc] initWithNibName:@"AddressBookViewController" bundle:nil];
    UINavigationController *addressNav = [[UINavigationController alloc] initWithRootViewController:adddView];
    [self presentModalViewController:addressNav animated:YES];
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark - Table view data source

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
        NSLog(@"%@",contactGroupPeople);
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
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
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

- (IBAction)Edit:(id)sender {
    if(self.editing)
	{
		[super setEditing:NO animated:NO]; 
		[contactsTableView setEditing:NO animated:NO];
		[contactsTableView reloadData];
        Edit.title = @"Edit";
        Edit.style = UIBarButtonSystemItemEdit;
		//[self.navigationItem.leftBarButtonItem setTitle:@"Edit"];
		//[self.navigationItem.leftBarButtonItem setStyle:UIBarButtonItemStylePlain];
	}
	else
	{
		[super setEditing:YES animated:YES]; 
		[contactsTableView setEditing:YES animated:YES];
		[contactsTableView reloadData];
        Edit.title = @"Done";
        Edit.style = UIBarButtonSystemItemDone;
		//[self.navigationItem.leftBarButtonItem setTitle:@"Done"];
		//[self.navigationItem.leftBarButtonItem setStyle:UIBarButtonItemStyleDone];
	}

}
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

@end
