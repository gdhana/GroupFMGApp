//
//  LabourbirthtipsViewController.m
//  Gurgle
//
//  Created by Dhanasekar Gunabalan on 5/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LabourbirthtipsViewController.h"
#import "LabourbirthtipsinfoViewController.h"

#import "BirthplanViewController.h"
#import "ToolsViewController.h"
#import "FunViewController.h"
#import "HelpViewController.h"


//#import "WeeksDatabase.h"
#import "Weekinfo.h"
#import "WeekDetails.h"
#import "WeekDisplayCell.h"

#import "GurgleAdViewController.h"

@interface LabourbirthtipsViewController ()

@end

@implementation LabourbirthtipsViewController
@synthesize tableview;
@synthesize AllweekInfos = _AllweekInfos;
@synthesize weeknumberInfos = _weeknumberInfos;
@synthesize searchTextField;
//- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
//{
//    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
//    if (self) {
//        // Custom initialization
//    }
//    return self;
//}
- (void)viewDidLoad
{
//    bottombanner.animationImages = [NSArray arrayWithObjects: 
//                                    [UIImage imageNamed:@"huggies_banner.png"],                              
//                                    [UIImage imageNamed:@"Banner1.jpg"],[UIImage imageNamed:@"Banner2.jpg"],[UIImage imageNamed:@"Banner3.jpg"],[UIImage imageNamed:@"Banner4.jpg"],[UIImage imageNamed:@"Banner5.jpg"], nil];
//    bottombanner.animationDuration = 25.0; // seconds
//    bottombanner.animationRepeatCount = 0; //0 loops for ever/noted
//    [bottombanner startAnimating];
    
   // NSLog(@"Labour");
   // [self createDatabase];
    //[self storeTiming];
    
    searchTextField.delegate=self;
   // self.tableview.backgroundColor = [UIColor clearColor];
    self.AllweekInfos = [Weekinfo database].ShowWeekInfos;
    NSArray *showweeksinformarion = [Weekinfo database].ShowWeekDetailInfos;
   // NSLog(@"Show : %i",_AllweekInfos.count);
    for (WeekDetails *weekinfo in showweeksinformarion) {
       // NSLog(@"%d : %d,%d,%@",weekinfo.uniqueId,weekinfo.weekno,weekinfo.weekplus,weekinfo.weekdesc);
    }
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    bottombanner = nil;
    tableview = nil;
    [self setTableview:nil];
    self.AllweekInfos = nil;
    Topbanner = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
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
//
//
-(void)createDatabase
{
    //NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES); 
   // NSString *documentsDirectory = [paths objectAtIndex:0];
    
    databasePath = [[NSBundle mainBundle] pathForResource:@"GurgleDB" ofType:@"sqlite3"];
    
  //  databasePath = [[NSString alloc]initWithString:[documentsDirectory stringByAppendingPathComponent:@"GurgleDB.sqlite3"]];
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:databasePath] == FALSE)
    {
        if (sqlite3_open([databasePath UTF8String], &timingsDatabase) == SQLITE_OK)
        {
            const char *sqlStatement = "CREATE TABLE IF NOT EXISTS Labourbirthtips (id INTEGER PRIMARY KEY AUTOINCREMENT, weekno INTEGER, weekplus TEXT,weekdesc TEXT,updatedDate DATETIME);";
            
            char *error;
            sqlite3_exec(timingsDatabase, sqlStatement, NULL, NULL, &error);
            
            const char *sqlStatement2 = "CREATE TRIGGER UPDATE_Labourbirthtips BEFORE UPDATE ON Labourbirthtips BEGIN UPDATE Labourbirthtips SET updatedDate = datetime('now', 'localtime') WHERE rowid = new.rowid; END";
            
            sqlite3_exec(timingsDatabase, sqlStatement2, NULL, NULL, &error);
            
            sqlite3_close(timingsDatabase);
        }
    }
}

-(void)storeTiming
{
    if (sqlite3_open([databasePath UTF8String], &timingsDatabase) == SQLITE_OK)
    {
      
        NSString *insertStatement = [NSString stringWithFormat:@"INSERT INTO Labourbirthtips (weekno, weekplus, weekdesc, updatedDate) VALUES (\"%@\", \"%@\", \"%@\", \"%@\")", @"22", @"22+0", @"Have you chosen your birth partner? Now is the time to let them know, so they can prepare for your labour too.",@"datetime('now','localtime')"];
        
        //INSERT INTO Labourbirthtips (weekno, weekplus, weekdesc, updatedDate) VALUES (\"22\","22+1","Have you chosen your birth partner? Now is the time to let them know, so they can prepare for your labour too.",datetime('now','localtime'))
        char *error;
        sqlite3_exec(timingsDatabase, [insertStatement UTF8String], NULL, NULL, &error);
        sqlite3_close(timingsDatabase);
        
    }
}

#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // return [_failedBankInfos count];
    return [_AllweekInfos count];
    //return 1;
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
//        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
//        if (cell == nil) {
//            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
//        }
//       
//       // Set up the cell...
//         WeekDetails *info = [_AllweekInfos objectAtIndex:indexPath.row];
//    
//    NSString *twostring = [NSString stringWithFormat:@"Week %d", info.weekno];
//    cell.textLabel.textColor = [UIColor colorWithRed:223/255.0f green:96/255.0f blue:164/255.0f alpha:1];
//    
//    cell.textLabel.text = twostring;
//    cell.detailTextLabel.numberOfLines = 6;
//    cell.detailTextLabel.font=[UIFont systemFontOfSize:12.0];
//
//    //cell.detailTextLabel.
//    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@", info.weekdesc];
//        return cell;
    WeekDisplayCell *cell =  (WeekDisplayCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell==nil) 
    {
        cell=[[WeekDisplayCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
    }
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    
    WeekDetails *info = [_AllweekInfos objectAtIndex:indexPath.row];
    NSString *twostring = [NSString stringWithFormat:@"Week %d", info.weekno];
    cell.TitleLabel.textColor = [UIColor colorWithRed:223/255.0f green:96/255.0f blue:164/255.0f alpha:1];
    cell.TitleLabel.text = twostring;
    
    cell.DescLabel.text = [NSString stringWithFormat:@"%@", info.weekdesc];
    
//    [cell.FrontButton setTitle:@"Front" forState:UIControlStateNormal];
//    cell.FrontButton.backgroundColor = [UIColor clearColor];
//    [cell.FrontButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal ];
   /* UIImage *buttonImageNormal = [UIImage imageNamed:@"blueButton.png"];
    UIImage *strechableButtonImageNormal = [buttonImageNormal stretchableImageWithLeftCapWidth:12 topCapHeight:0];
    [playButton setBackgroundImage:strechableButtonImageNormal forState:UIControlStateNormal];
    UIImage *buttonImagePressed = [UIImage imageNamed:@"whiteButton.png"];
    UIImage *strechableButtonImagePressed = [buttonImagePressed stretchableImageWithLeftCapWidth:12 topCapHeight:0];
    [playButton setBackgroundImage:strechableButtonImagePressed forState:UIControlStateHighlighted];
    [playButton addTarget:self action:@selector(playAction:) forControlEvents:UIControlEventTouchUpInside];*/

   /* [cell.FrontButton addTarget: self action: @selector(Button1:) forControlEvents: UIControlEventTouchUpInside];
     cell.FrontButton.tag = indexPath.row;*/
//    
//    [cell.PrevButton setTitle:@"Prev" forState:UIControlStateNormal];
//    cell.PrevButton.backgroundColor = [UIColor clearColor];
//    [cell.PrevButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal ];
 /*   [cell.PrevButton addTarget: self action: @selector(Button2:) forControlEvents: UIControlEventTouchUpInside];
     cell.PrevButton.tag = indexPath.row;*/

    return cell;
    
    
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    
    [textField resignFirstResponder];
    
    int weekno = [searchTextField.text intValue];
    self.AllweekInfos = [[Weekinfo database] SearchWeek:weekno];

    if (wview) {
        [wview removeFromSuperview];
        wview=nil;
    }
   
    
    [self.tableview setHidden:NO];
    [self.tableview reloadData];
    
    return YES;
}
- (IBAction)Button1:(id)sender
{
    //NSLog(@"firstButton in row :%d", ((UIButton *)sender).tag);
}

- (IBAction)Button2: (id)sender
{
   // NSLog(@"secondButton in row :%d", ((UIButton *)sender).tag);
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    WeekDetails *info = [_AllweekInfos objectAtIndex:indexPath.row];
    
    NSArray *weekPlusArray = [[Weekinfo database] ShowWeekPlusInfos:info.weekno];
    searchTextField.text=[NSString stringWithFormat:@"%d",info.weekno];

    [self.tableview setHidden:YES];
    
    wview = [[WeekView alloc]initWithFrame:CGRectMake(40, 180,  240, 130)];
    wview.plusArray=weekPlusArray;
    wview.backgroundColor=[UIColor clearColor];
    [self.view addSubview:wview];
    
}

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
*/


/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:YES];
 }   
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }   
 }
 */


/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */


/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */



- (IBAction)Labourbirthtipsdone:(id)sender
{
    [self dismissModalViewControllerAnimated:YES];
}
- (IBAction)showLabourbirthtipsView:(id)sender
{
    LabourbirthtipsinfoViewController *LabourbirthtipsinfoView = [[LabourbirthtipsinfoViewController alloc] initWithNibName:@"LabourbirthtipsinfoViewController" bundle:nil];
    LabourbirthtipsinfoView.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentModalViewController:LabourbirthtipsinfoView animated:YES];
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
