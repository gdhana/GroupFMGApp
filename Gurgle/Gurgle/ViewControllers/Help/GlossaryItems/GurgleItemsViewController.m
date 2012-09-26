//
//  GurgleItemsViewController.m
//  Gurgle
//
//  Created by Dhanasekar Gunabalan on 7/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GurgleItemsViewController.h"
#import "HelpinfoViewController.h"
#import "GlossaryDetailViewController.h"

#import "BirthplanViewController.h"
#import "ToolsViewController.h"
#import "FunViewController.h"
#import "HelpViewController.h"

@interface GurgleItemsViewController ()

@end

@implementation GurgleItemsViewController

@synthesize tableview;

- (void)viewWillAppear:(BOOL)animated {
    dao = [[Dfetch alloc] initWithLibraryName:@"Glossaryitems"];
    self.title = @"Data List";
    [self.tableview deselectRowAtIndexPath:[self.tableview indexPathForSelectedRow] animated:YES];
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidLoad {
   
    labels = [NSMutableArray new];
    values = [NSMutableArray new];
    
    // Set up labels which will become header titles
    [labels addObject:@"A"];
    [labels addObject:@"B"];
    [labels addObject:@"C"];

 [super viewDidLoad];
 
 // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
 // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
 
- (void)viewDidUnload {
    bottombanner = nil;
    [self setTableview:nil];
    tableview = nil;
	// Release anything that can be recreated in viewDidLoad or on demand.
	// e.g. self.myOutlet = nil;
}


#pragma mark Table view methods

//- (NSString *)tableView:(UITableView *)aTableView titleForHeaderInSection:(NSInteger)section {
//	return [labels objectAtIndex:section];
//    
//}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
    //return [labels count];
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [dao libraryCount];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"LibraryListingCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault 
                                       reuseIdentifier:CellIdentifier];
    }
    
	cell.textLabel.text = [[dao libraryItemAtIndex:indexPath.row] valueForKey:@"name"];
	//cell.textLabel.text = [[dao libraryItemAtIndex:indexPath.row] valueForKey:@"add"];
    
    return cell;
}



// Override to support row selection in the table view.
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    NSString *name = [[dao libraryItemAtIndex:indexPath.row] valueForKey:@"name"];
    NSString *description = [[dao libraryItemAtIndex:indexPath.row] valueForKey:@"description"];
    NSLog(@"Name: %@",name);
    NSLog(@"Name: %@",description);
    
    GlossaryDetailViewController *controller = [[GlossaryDetailViewController alloc] initWithglossarydata:name: description: [dao libraryItemAtIndex:indexPath.row]];
    controller.title = [[dao libraryItemAtIndex:indexPath.row] valueForKey:@"name"];
    controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentModalViewController:controller animated:YES];
}



- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    if ([touch view] == bottombanner){
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.huggiesclub.co.uk/products/nappies/newborn"]];
    }
}


- (IBAction)showHelpinfoView:(id)sender
{
    HelpinfoViewController *HelpinfoView = [[HelpinfoViewController alloc] initWithNibName:@"HelpinfoViewController" bundle:nil];
    HelpinfoView.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentModalViewController:HelpinfoView animated:YES];
}

- (IBAction)GlossaryViewdone:(id)sender
{
    [self dismissModalViewControllerAnimated:YES];
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

@end
