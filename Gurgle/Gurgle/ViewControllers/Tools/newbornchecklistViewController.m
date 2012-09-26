//
//  newbornchecklistViewController.m
//  Gurgle
//
//  Created by Dhanasekar Gunabalan on 6/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "newbornchecklistViewController.h"

#import "newbornchecklistinfoViewController.h"

#import "BirthplanViewController.h"
#import "ToolsViewController.h"
#import "FunViewController.h"
#import "HelpViewController.h"

#import "MultiSelectTableViewCell.h"

static const int CELLS_NUM = 36;

static NSString * const kCellTextKey = @"CellTextKey";
static NSString * const kCellStateKey = @"CellStateKey";

@interface newbornchecklistViewController ()
@property (nonatomic, retain) NSMutableArray *dataArray;
@end

@implementation newbornchecklistViewController
@synthesize tableview3;
@synthesize tableData;
@synthesize activityIndicator;
@synthesize dataArray;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    //NSDictionary *item = [dataArray objectAtIndex:indexPath.row];
	//NSString* title = [item objectForKey:@"text"];
//	cell.title = title;
//	cell.textLabel.text = title;
//	cell.checked = [[item objectForKey:@"checked"] boolValue];
    // Create the data to show in the table
//    NSInteger numberOfRows = 80;
//    
//    NSMutableArray *arr = [[NSMutableArray alloc] initWithCapacity:numberOfRows];
//    
//    NSString *path = [[NSBundle mainBundle] pathForResource:@"tableData" ofType:@"plist"];
//	self.dataArray = [NSMutableArray arrayWithContentsOfFile:path];
//    tableview3.backgroundColor = [UIColor clearColor];
//    NSMutableArray *arr1 = [[NSMutableArray alloc] initWithArray:dataArray];
//    
//   
//    
//    for (NSInteger idx = 0; idx < numberOfRows; idx++) {
//        NSString *text = [NSString stringWithFormat:@"%@",];
//         NSLog(@"Datas : %@",text);
//        NSNumber *state = [NSNumber numberWithBool:NO];
//        
//        NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:text, kCellTextKey, state, kCellStateKey, nil];
//        [arr1 addObject:dict];
//    }
//   
//    
//    tableData = [arr1 mutableCopy];
//    
//    
//    activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
//    activityIndicator.frame = CGRectMake(142, 50, 50, 50);

//    // Create the data to show in the table
//    NSInteger numberOfRows = 20;
//    
//    NSMutableArray *arr = [[NSMutableArray alloc] initWithCapacity:numberOfRows];
//    for (NSInteger idx = 0; idx < numberOfRows; idx++) {
//        NSString *text = [NSString stringWithFormat:@"Row number %lu", idx];
//        NSNumber *state = [NSNumber numberWithBool:NO];
//        
//        NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:text, kCellTextKey, state, kCellStateKey, nil];
//        [arr addObject:dict];
//    }
//    
//    tableData = [arr mutableCopy];
//
//    
//    activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
//    activityIndicator.frame = CGRectMake(142, 50, 50, 50);
    
    
    return self;
}

- (void)viewDidLoad
{
//    [self.view addSubview:activityIndicator];
//    [self.view bringSubviewToFront:activityIndicator];
//    
//    [activityIndicator startAnimating];
    //  [self.tableview1 setBackgroundColor:[UIColor clearColor]];
    self.tableview3.allowsSelectionDuringEditing = YES;
    
    _selFlags = [[NSMutableArray alloc] initWithCapacity:CELLS_NUM];
    for (int i = 0; i < CELLS_NUM; i++)
    {
        [_selFlags addObject:[NSNumber numberWithBool:NO]];
    }

    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    tableview3 = nil;
    [self setTableview3:nil];
    [activityIndicator stopAnimating];
    bottombanner = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

// Number of groups
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView 
{
//	return 2;
return (nil == _selFlags) ? 0 : _selFlags.count;
}

// Section Titles
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
	switch (section) 
	{
		case 0:
			return @"Newborn – checklist ";
		case 1:
			return @"Optional:";
		default:
			return @"";
	}
}

// Number of rows per section
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section 
{
	switch (section) 
	{
		case 0:
			return 27;
		case 1:
			return 8;
		default:
			return 0;
	}
}

// Heights per row
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	int section = [indexPath section];
	//int row = [indexPath row];
	
	switch (section) 
	{
		case 0:
			//if (row == 0) return 80.0f;
			return 44.0f;
		case 1:
			return 44.0f;
		default:
			return 44.0f;
	}
}

// Produce cells
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	NSInteger row = [indexPath row];
	NSInteger section = [indexPath section];
//	UITableViewCell *cell;
    static NSString *CellIdentifier = @"Cell";
    MultiSelectTableViewCell *cell = (MultiSelectTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[MultiSelectTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault 
                                               reuseIdentifier:CellIdentifier];
        
		cell.selectionStyle = UITableViewCellSelectionStyleNone;
		cell.backgroundView = [[UIView alloc] init];
    }
    
    cell.mSelected = [(NSNumber *)[_selFlags objectAtIndex:indexPath.row] boolValue];	
	switch (section) 
	{
		case 0:
			// Create cells with accessory checking
//			cell = [tableView dequeueReusableCellWithIdentifier:@"checkCell1"];
//			if (!cell) {
//				cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"checkCell1"];
//				cell.accessoryType = UITableViewCellAccessoryNone;
//			}
			if(row == 0){
                cell.textLabel.text = [NSString stringWithFormat:@"Cot with cot mattress"];
            }else if(row == 1)
            {
                cell.textLabel.text = [NSString stringWithFormat:@"Cot sheets and blankets"];
            }else if(row == 2)
            {
                cell.textLabel.text = [NSString stringWithFormat:@"Pram, buggy or travel system"];
                cell.textLabel.numberOfLines =2;
            }else if(row == 3)
            {
                cell.textLabel.text = [NSString stringWithFormat:@"Car seat"];
            }else if(row == 4)
            {
                cell.textLabel.text = [NSString stringWithFormat:@"Changing mat"];
            }else if(row == 5)
            {
                cell.textLabel.text = [NSString stringWithFormat:@"Nappies"];
            }else if(row == 6)
            {
                cell.textLabel.text = [NSString stringWithFormat:@"Nappy bags"];
            }else if(row == 7)
            {
                cell.textLabel.text = [NSString stringWithFormat:@"Nappy cream"];
            }else if(row == 8)
            {
                cell.textLabel.text = [NSString stringWithFormat:@"Cotton wool or other wipe product"];
                cell.textLabel.numberOfLines =2;
            }else if(row == 9)
            {
                cell.textLabel.text = [NSString stringWithFormat:@"If not breastfeeding: teats, bottles, bottle brush"];
                cell.textLabel.numberOfLines =2;
            }else if(row == 10)
            {
                cell.textLabel.text = [NSString stringWithFormat:@"If breastfeeding: nursing bra and breastpads"];
                cell.textLabel.numberOfLines =2;
            }else if(row == 11)
            {
                cell.textLabel.text = [NSString stringWithFormat:@"10 baby sleepsuits"];
            }else if(row == 12)
            {
                cell.textLabel.text = [NSString stringWithFormat:@"10 baby vests"];
            }else if(row == 13)
            {
                cell.textLabel.text = [NSString stringWithFormat:@"6 pairs of socks"];
            }else if(row == 14)
            {
                cell.textLabel.text = [NSString stringWithFormat:@"3 baby cardigans or jackets"];
            }else if(row == 15)
            {
                cell.textLabel.text = [NSString stringWithFormat:@"Shawl or snowsuit (for winter babies)"];
                cell.textLabel.numberOfLines =2;
            }else if(row == 16)
            {
                cell.textLabel.text = [NSString stringWithFormat:@"Hats"];
            }else if(row == 17)
            {
                cell.textLabel.text = [NSString stringWithFormat:@"Mittens"];
            }else if(row == 18)
            {
                cell.textLabel.text = [NSString stringWithFormat:@"Booties"];
            }else if(row == 19)
            {
                cell.textLabel.text = [NSString stringWithFormat:@"Plenty of bibs"];
            }else if(row == 20)
            {
                cell.textLabel.text = [NSString stringWithFormat:@"Plenty of muslin squares"];
            }else if(row == 21)
            {
                cell.textLabel.text = [NSString stringWithFormat:@"Plenty of towels for baths"];
            }else if(row == 22)
            {
                cell.textLabel.text = [NSString stringWithFormat:@"Baby brush and comb"];
            }else if(row == 23)
            {
                cell.textLabel.text = [NSString stringWithFormat:@"Nail scissors"];
            }else if(row == 24)
            {
                cell.textLabel.text = [NSString stringWithFormat:@"Changing bag"];
            }else if(row == 25)
            {
                cell.textLabel.text = [NSString stringWithFormat:@"Baby lotion and baby shampoo"];
                cell.textLabel.numberOfLines =2;
            }else if(row == 26)
            {
                cell.textLabel.text = [NSString stringWithFormat:@"A couple of small soft toys/rattles"];
                cell.textLabel.numberOfLines =2;
            }


			return cell;
			break;
        case 1:
			// Create cells with accessory checking
//			cell = [tableView dequeueReusableCellWithIdentifier:@"checkCell2"];
//			if (!cell) {
//				cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"checkCell2"];
//				cell.accessoryType = UITableViewCellAccessoryNone;
//			}
			if(row == 0){
                cell.textLabel.text = [NSString stringWithFormat:@"Moses basket or crib"];
            }else if(row == 1)
            {
                cell.textLabel.text = [NSString stringWithFormat:@"Baby bath"];
            }else if(row == 2)
            {
                cell.textLabel.text = [NSString stringWithFormat:@"Baby monitors"];
            }else if(row == 3)
            {
                cell.textLabel.text = [NSString stringWithFormat:@"If breast feeding: breast pump"];
                cell.textLabel.numberOfLines =2;
            }else if(row == 4)
            {
                cell.textLabel.text = [NSString stringWithFormat:@"If not breast feeding: steam steriliser"];
                cell.textLabel.numberOfLines =2;
            }else if(row == 5)
            {
                cell.textLabel.text = [NSString stringWithFormat:@"Bath thermometer"];
            }else if(row == 6)
            {
                cell.textLabel.text = [NSString stringWithFormat:@"Bouncer/bouncy chair"];
            }else if(row == 7)
            {
                cell.textLabel.text = [NSString stringWithFormat:@"Room thermometer"];
            }    
			return cell;
            break;
            
        default:
			break;
	}
//	
//	// Return a generic cell if all else fails
//	cell = [tableView dequeueReusableCellWithIdentifier:@"any-cell"];
//	if (cell == nil) {
//		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"any-cell"];
//	}
	
	return cell;
}

//// utility functions
//- (void) deselect
//{	
//	[self.tableview3 deselectRowAtIndexPath:[self.tableview3 indexPathForSelectedRow] animated:YES];
//}
//
//- (void) notify: (NSString *) aMessage
//{
//	UIAlertView *baseAlert = [[UIAlertView alloc] 
//							  initWithTitle:@"Alert" message:aMessage 
//							  delegate:self cancelButtonTitle:nil
//							  otherButtonTitles:@"Okay", nil];
//	[baseAlert show];
//}
//
//// TextField delegate handles return events and dismisses keyboard
//- (BOOL)textFieldShouldReturn:(UITextField *)textField
//{
//	[textField resignFirstResponder];
//	[self notify:[NSString stringWithFormat:@"Hello %@", [textField text]]];
//	return YES;
//}
//
// Respond to user selection based on the cell type
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	
//	int section = [newIndexPath section];
//	//int row = [newIndexPath row];
//	UITableViewCell *cell = [self.tableview3 cellForRowAtIndexPath:newIndexPath];
//    //cell.textLabel.text = [UIColor magentaColor];
//	switch (section) 
//	{
//		case 0:
////			if (row == 0)
////			{
////				//[self notify:[NSString stringWithFormat:@"Hello %@", [[[cell subviews] lastObject] text]]];
////			}
//            if (cell.accessoryType == UITableViewCellAccessoryNone){
//				cell.accessoryType = UITableViewCellAccessoryCheckmark;
//                cell.textLabel.textColor = [UIColor magentaColor];
//            }
//			else{
//				cell.accessoryType = UITableViewCellAccessoryNone;
//                cell.textLabel.textColor = [UIColor blackColor];
//			}
//            break;
//        case 1:
//			if (cell.accessoryType == UITableViewCellAccessoryNone){
//				cell.accessoryType = UITableViewCellAccessoryCheckmark;
//                cell.textLabel.textColor = [UIColor magentaColor];
//			}
//            else{
//				cell.accessoryType = UITableViewCellAccessoryNone;
//                cell.textLabel.textColor = [UIColor blackColor];
//            }
//            //break;
//			break;
//		default:
//			break;
//	}
//    
//	//[self performSelector:@selector(deselect) withObject:NULL afterDelay:0.5];
    MultiSelectTableViewCell *cell = (MultiSelectTableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
    [cell changeMSelectedState];
    [_selFlags replaceObjectAtIndex:indexPath.row withObject:[NSNumber numberWithBool:cell.mSelected]];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    if ([touch view] == bottombanner){
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.huggiesclub.co.uk/products/nappies/newborn"]];
    }
}

- (IBAction)newbornchecklistinfoView:(id)sender;
{
    newbornchecklistinfoViewController *newbornchecklistinfoView = [[newbornchecklistinfoViewController alloc] initWithNibName:@"newbornchecklistinfoViewController" bundle:nil];
    newbornchecklistinfoView.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentModalViewController:newbornchecklistinfoView animated:YES];
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
