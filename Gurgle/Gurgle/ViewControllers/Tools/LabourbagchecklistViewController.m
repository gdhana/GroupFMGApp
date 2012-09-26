//
//  LabourbagchecklistViewController.m
//  
//
//  Created by Dhanasekar Gunabalan on 6/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LabourbagchecklistViewController.h"

#import "LabourbagchecklistinfoViewController.h"

#import "BirthplanViewController.h"
#import "ToolsViewController.h"
#import "FunViewController.h"
#import "HelpViewController.h"

#import "MultiSelectTableViewCell.h"
//#import "CustomCell.h"

static const int CELLS_NUM = 20;

@interface LabourbagchecklistViewController ()
@property (nonatomic, retain) NSMutableArray *dataArray;
@end

@implementation LabourbagchecklistViewController
@synthesize tableview1;
@synthesize dataArray;
@synthesize tableData;

static NSString * const kCellTextKey = @"CellTextKey";
static NSString * const kCellStateKey = @"CellStateKey";



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
    //[self.tableview1 setBackgroundColor:[UIColor clearColor]];
    self.tableview1.allowsSelectionDuringEditing = YES;
   // self.tableview1.frame = CGRectMake(17,99 , 284, 630);
    _selFlags = [[NSMutableArray alloc] initWithCapacity:CELLS_NUM];
    for (int i = 0; i < CELLS_NUM; i++)
    {
        [_selFlags addObject:[NSNumber numberWithBool:NO]];
    }
    
    [super viewDidLoad];
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    tableview1 = nil;
    [self setTableview1:nil];
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
	//return 3;
    return (nil == _selFlags) ? 0 : _selFlags.count;
}

// Section Titles
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
	switch (section) 
	{
		case 0:
			return @"for your labour bag...";
		case 1:
			return @"for your newborn...";
        case 2:
			return @"Nice to have...";
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
			return 17;
		case 1:
			return 12;
        case 2:
			return 6;
		default:
			return 0;
	}
}

// Heights per row
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	int section = [indexPath section];
	int row = [indexPath row];
	
	switch (section) 
	{
		case 0:
			//if (row == 0) return 80.0f;
			return 44.0f;
		case 1:
			return 44.0f;
        case 2:
            if(row == 5) {return 140.0f;}
            else if(row == 4) {return 70.0f;}
            else { return 44.0f;}
			
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
//	cell = [tableView dequeueReusableCellWithIdentifier:@"checkCell1"];
//	if (!cell) 
//	{
//	    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"checkCell1"];
//	    cell.accessoryType = UITableViewCellAccessoryNone;
//	}

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
			if(row == 0){
                cell.textLabel.text = [NSString stringWithFormat:@"Your birth plan and maternity notes"];
                cell.textLabel.numberOfLines =2;
            }else if(row == 1)
            {
                cell.textLabel.text = [NSString stringWithFormat:@"Dressing gown"];
            }else if(row == 2)
            {
                cell.textLabel.text = [NSString stringWithFormat:@"A night dress or T shirt to wear during labour"];
                cell.textLabel.numberOfLines =2;
            }else if(row == 3)
            {
                cell.textLabel.text = [NSString stringWithFormat:@"Another night dress to wear after labour"];
                cell.textLabel.numberOfLines =2;
            }else if(row == 4)
            {
                cell.textLabel.text = [NSString stringWithFormat:@"Loose comfortable clothes to wear to go home in"];
                cell.textLabel.numberOfLines =2;
            }else if(row == 5)
            {
                cell.textLabel.text = [NSString stringWithFormat:@"Massage oil or lotion"];
            }else if(row == 6)
            {
                cell.textLabel.text = [NSString stringWithFormat:@"A birth ball"];
            }else if(row == 7)
            {
                cell.textLabel.text = [NSString stringWithFormat:@"Snacks and drinks"];
            }else if(row == 8)
            {
                cell.textLabel.text = [NSString stringWithFormat:@"Hair bands or hair clips"];
            }else if(row == 9)
            {
                cell.textLabel.text = [NSString stringWithFormat:@"Nursing bras"];
            }else if(row == 10)
            {
                cell.textLabel.text = [NSString stringWithFormat:@"Nipple cream"];
                cell.textLabel.numberOfLines =2;
            }else if(row == 11)
            {
                cell.textLabel.text = [NSString stringWithFormat:@"Breast pads"];
            }else if(row == 12)
            {
                cell.textLabel.text = [NSString stringWithFormat:@"Maternity pads"];
            }else if(row == 13)
            {
                cell.textLabel.text = [NSString stringWithFormat:@"Toiletries"];
            }else if(row == 14)
            {
                cell.textLabel.text = [NSString stringWithFormat:@"Knickers – disposable or large cotton ones are best"];
                cell.textLabel.numberOfLines =2;
            }else if(row == 15)
            {
                cell.textLabel.text = [NSString stringWithFormat:@"Towels, hair brush, tooth brush and tooth paste"];
                cell.textLabel.numberOfLines =2;
            }else if(row == 16)
            {
                cell.textLabel.text = [NSString stringWithFormat:@"Warm socks"];
            }			return cell;
			break;
        case 1:
			
			if(row == 0){
                cell.textLabel.text = [NSString stringWithFormat:@"Two or three sleepsuits and vests"];
                cell.textLabel.numberOfLines =2;
            }else if(row == 1)
            {
                cell.textLabel.text = [NSString stringWithFormat:@"A baby blanket"];
            }else if(row == 2)
            {
                cell.textLabel.text = [NSString stringWithFormat:@"Nappies"];
            }else if(row == 3)
            {
                cell.textLabel.text = [NSString stringWithFormat:@"Cotton wool balls"];
            }else if(row == 4)
            {
                cell.textLabel.text = [NSString stringWithFormat:@"Nappy sacks"];
            }else if(row == 5)
            {
                cell.textLabel.text = [NSString stringWithFormat:@"Nappy cream"];
            }else if(row == 6)
            {
                cell.textLabel.text = [NSString stringWithFormat:@"Two pairs of socks or booties"];
                cell.textLabel.numberOfLines =2;
            }else if(row == 7)
            {
                cell.textLabel.text = [NSString stringWithFormat:@"Hat"];
            }else if(row == 8)
            {
                cell.textLabel.text = [NSString stringWithFormat:@"Jacket or snowsuit for winter babies"];
                cell.textLabel.numberOfLines =2;
            }else if(row == 9)
            {
                cell.textLabel.text = [NSString stringWithFormat:@"Muslin squares"];
            }else if(row == 10)
            {
                cell.textLabel.text = [NSString stringWithFormat:@"A baby car seat"];
            }else if(row == 11)
            {
                cell.textLabel.text = [NSString stringWithFormat:@"One outfit for the trip home"];
                cell.textLabel.numberOfLines =2;
            }
			return cell;
            break;
        case 2:
			// Create cells with accessory checking
			if(row == 0){
                cell.textLabel.text = [NSString stringWithFormat:@"Camera"];
            }else if(row == 1)
            {
                cell.textLabel.text = [NSString stringWithFormat:@"Magazines, books"];
            }else if(row == 2)
            {
                cell.textLabel.text = [NSString stringWithFormat:@"Music (either CDS or your iPod/MP3 player)"];
                cell.textLabel.numberOfLines =2;
            }else if(row == 3)
            {
                cell.textLabel.text = [NSString stringWithFormat:@"Phone and phone charger"];
            }else if(row == 4)
            {
                cell.textLabel.lineBreakMode = UILineBreakModeWordWrap;
                cell.textLabel.numberOfLines = 3;
                cell.textLabel.autoresizesSubviews = YES;
                cell.textLabel.text = [NSString stringWithFormat:@"A treat for after you’ve given birth (chocolate usually works)"];
            }else if(row == 5)
            {
                cell.textLabel.lineBreakMode = UILineBreakModeWordWrap;
                cell.textLabel.numberOfLines = 7;
                cell.textLabel.autoresizesSubviews = YES;
                cell.textLabel.text = [NSString stringWithFormat:@"A shawl/scarf/pashmina for if it gets cold, or for throwing over yourself when you’re first getting the hang of breastfeeding during visitor hours"];
            }
			return cell;
            break;
            
        default:
			break;
	}
	
	return cell;
}

// Respond to user selection based on the cell type
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

//	int section = [newIndexPath section];
//	//int row = [newIndexPath row];
//	UITableViewCell *cell = [self.tableview1 cellForRowAtIndexPath:newIndexPath];
//    //cell.textLabel.text = [UIColor magentaColor];
//   // [tableView cellForRowAtIndexPath:newIndexPath].accessoryType = UITableViewCellAccessoryNone;
//	switch (section) 
//	{
//		case 0:
//            //			if (row == 0)
//            //			{
//            //				//[self notify:[NSString stringWithFormat:@"Hello %@", [[[cell subviews] lastObject] text]]];
//            //			}
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
//           
//			break;
//        case 2:
//			if (cell.accessoryType == UITableViewCellAccessoryNone){
//				cell.accessoryType = UITableViewCellAccessoryCheckmark;
//                cell.textLabel.textColor = [UIColor magentaColor];
//			}
//            else{
//				cell.accessoryType = UITableViewCellAccessoryNone;
//                cell.textLabel.textColor = [UIColor blackColor];
//            }
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

- (IBAction)LabourbagchecklistinfoView:(id)sender;
{
    LabourbagchecklistinfoViewController *LabourbagchecklistinfoView = [[LabourbagchecklistinfoViewController alloc] initWithNibName:@"LabourbagchecklistinfoViewController" bundle:nil];
    LabourbagchecklistinfoView.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentModalViewController:LabourbagchecklistinfoView animated:YES];
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
