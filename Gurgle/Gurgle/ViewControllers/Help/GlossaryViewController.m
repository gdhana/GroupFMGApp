//
//  GlossaryViewController.m
//  Gurgle
//
//  Created by Dhanasekar Gunabalan on 5/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GlossaryViewController.h"
#import "HelpinfoViewController.h"

#import "MutableDeepCopy.h"
#import "GlossaryDetailViewController.h"

#import "BirthplanViewController.h"
#import "ToolsViewController.h"
#import "FunViewController.h"
#import "HelpViewController.h"
#import "GurgleAdViewController.h"

@interface GlossaryViewController ()
{
    NSMutableArray *wordArray,*defArray;
    NSArray *sortedArray;
    NSMutableArray *keys,*mainSectionKeys;
    NSMutableDictionary *contents,*mainSectionContents;
}
@end

@implementation GlossaryViewController

@synthesize glossaryTableView,glossaryArray,searchBar,sectionKeys,sectionContents;
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
    
    searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 82, 320, 44)];
    searchBar.barStyle = UIBarStyleDefault;
    searchBar.delegate = self;
    [self.view addSubview:searchBar];
    
    
    wordArray = [[NSMutableArray alloc] initWithObjects:@"After pains",@"Antenatal",@"Breech Position",@"Caesarean section",@"Cephalopelvic Disproportion",@"Contraction",@"Cord prolapse",@"Crowning",@"Dilation",@"Doula",@"EDD",@"Epidural",@"Episiotomy",@"Foetus",@"Foetal distress",@"FM",@"Forceps",@"Induced labour",@"Lochia",@"Macrosomia",@"Meconium",@"Obstetrician",@"Placenta Previa",@"Retained placenta",@"Ruptured membranes",@"Shoulder dystocia",@"Syntocinon",@"Timing contractions",@"Umbilical cord",@"Uterine Rupture",@"VBAC",nil];
    
    defArray = [[NSMutableArray alloc] initWithObjects:@"These are mild contractions or cramps that signal your uterus' return to its non-pregnant size and shape. They are caused by the release of the hormone oxytocin during breastfeeding. They typically occur in the days immediately following the birth.",@"This is simply the time before the birth.A medical abbreviation for the condition antepartum hemorrhage. This means bleeding before the birth. It isn't always serious, but should always be investigated immediately.",@" Rather than being positioned with their head first, the foetus is positioned head up to be born buttock first, or with one or both feet first.",@"Instead of being born vaginally, if your baby is to be born via c-section an incision is made through the abdominal and uterine walls for extraction of the foetus. This incision is generally horizontal across the abdomen, and delivered under local anaesthetic.",@"This is when the baby's head is too large to pass through the mother's pelvic opening. The reasons behind it vary - either because the baby is disproportionately large, the baby is not in the best position for birth resulting in a larger head diameter than normal, the mother's pelvis is small, or as a result of other abnormalities of the birth canal.",@"The regular tightening of the uterus, working to push the baby down the birth canal. The more intense and closer together your contractions are, the closer you are to delivering your baby.",@"Premature expulsion of the umbilical cord in labour before the foetus is delivered. Women who experience this should seek urgent medical attention.",@"The midwife will say your baby is crowning when the baby's head has passed through the birth canal, and the top of the head is visible in the vaginal opening.",@"The extent to which your cervix is open. You cannot start pushing until you are fully dilated  this is when you are 10cm dilated.",@"A professional labour assistant - usually a woman - who provides emotional, physical and sometimes spiritual support to the mother during labour and birth. Doulas are hired privately by the mother, and are not available on the NHS.",@"This is simply short hand for your expected date of delivery. This is your due date; the date your midwife would expect your baby to arrive. Bear in mind most babies do not arrive on their due date.",@"This is a common anaesthetic used during labour. An epidural is inserted through a catheter which is threaded through a needle, into the dura space near the spinal cord.",@"An incision made to the perineum to widen the vaginal opening for delivery. This is usually given if the woman is struggling to deliver due to a lack of space for the baby's head to emerge.",@"The medical name for the baby before it is born",@"This means the baby is not getting enough oxygen or is experiencing another complication. If you hear the term 'foetal distress' in the delivery room try not to panic and listen to advice from your midwife.",@"This is medical shorthand for Foetal Movement. It may say “FM Felt' or “FMF” on your medical notes  this means that your midwife or doctor has felt your baby moving and is happy with their level of activity.",@"These are a tong shaped device that may be used to guide your baby's head out of the birth canal if pushing if not creating enough force to guide the head down naturally.",@"Labour is started artificially, either by breaking the waters, or by using drugs to bring on contractions.",@"The vaginal discharge of mucus, blood, and tissue. This will begin during labour, and may continue for up to six weeks after the birth of your baby.",@"Babies weighing more than 9 pounds and 15 ounces are considered macrosomic. This literally means 'of large body' and isn't a complication; it just means you have a big baby. About 5 to 10 percent of babies are considered macrosomic.",@"This is effectively your baby's first bowel movement. It is a greenish substance that is released shortly after birth.",@"A specialist doctor or surgeon who deals only with pregnancy, childbirth and the immediate post/neo-natal period.",@"When the placenta partially or completely covers the cervix. If you have placenta previa when it's time to deliver your baby, you'll need to have a c-section.",@"Retained placenta means that all or part of the placenta or membranes are left behind in the uterus (womb) during the third stage of labour. You'll be treated for a retained placenta if the third stage takes longer than usual or if there are signs that any of the placenta or membrane is still attached to the uterus.",@"This is more often referred to as 'broken waters'. It refers to the breaking of the fluid filled sac surrounding the baby. The fluid may come as a gush of water or as a slow leak.",@"Shoulder dystocia is a rare emergency that can happen during the end of the second stage of labour. It's all to do with how your baby moves down through your vagina and out into the world.  Shoulder dystocia happens when your baby's head has been born, but one of her shoulders becomes stuck.",@"This is a drug that can be given to help with the third stage of labour  the delivery of the placenta. This will happen shortly after your baby is born. The drug can help speed up this process.",@"Contractions are measured from the beginning of one until the beginning of the next. The more intense and closer together the contractions are, the closer you are to being able to deliver your baby.",@"The cord that transports blood, oxygen and nutrients to the baby from the placenta. After the delivery this can often be cut by the birth partner.",@"A uterine rupture is a tear in the wall of the uterus, most often at the site of a previous c-section incision. In a complete rupture, the tear goes through all layers of the uterine wall and the consequences can be dire for mother and baby. Fortunately these are very rare events.",@"This is an abbreviation (often pronounced 'veeback') which stands for Vaginal Birth After Caesarean. Women having a VBAC are often examined and monitored more closely during their labour.",nil];
    
    mainSectionKeys = [[NSMutableArray alloc] init];
    mainSectionContents = [[NSMutableDictionary alloc] init];
    
    [self SetDictionaryArray]; ///  to set the dictionary and keys for section & rows
    
    
    /// initialize the dictionary to main reference objects
    mainSectionKeys = sectionKeys;
    mainSectionContents = sectionContents;
    
    glossaryTableView = [[UITableView alloc] initWithFrame:CGRectMake(0,126, 320, 261)];
    glossaryTableView.delegate=self;
    glossaryTableView.dataSource=self;
    [self.view addSubview:glossaryTableView];                                         
}
-(void) SetDictionaryArray
{
    // to get the first letter and to form a key array from the present word arraylist
    NSMutableSet* existingNames = [NSMutableSet set];
    NSMutableArray* uniquearray = [NSMutableArray array];
    NSMutableArray* filteredArray = [NSMutableArray array];
    for(int i =0;i<[wordArray count];i++)
    {
        [uniquearray addObject:[[wordArray objectAtIndex:i] substringToIndex:1]];
    }
    
    for (id object in uniquearray) {
        if (![existingNames containsObject:object]) {
            [existingNames addObject:object];
            [filteredArray addObject:object];            
        }
    }
    /// to get the sorted array of characters
    sortedArray = [filteredArray sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
    
    keys=nil;
    contents=nil;
    keys = [[NSMutableArray alloc] init];
    contents = [[NSMutableDictionary alloc] init];
    
    // adding keys and glossary objects to the dictionary.
    for (id str in sortedArray) {
        NSMutableArray *contentArray = [NSMutableArray array]; /// for each key - assign the array of glossary objects
        for ( int i = 0; i< [wordArray count]; i++){
            if ([[[wordArray objectAtIndex:i] substringToIndex:1] isEqualToString:str]) {
                Glossary *obj = [[Glossary alloc] init];
                obj.word = [wordArray objectAtIndex:i];
                obj.definition = [defArray objectAtIndex:i];
                [contentArray addObject:obj];
            }
        }
        [contents setObject:contentArray forKey:str];          
        [keys addObject:str];
    }
    
    [self setSectionKeys:keys];
	[self setSectionContents:contents];
    
}
- (void)viewDidUnload
{
    table = nil;
    search = nil;
    Topbanner = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
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

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
	NSInteger sections = [[self sectionKeys] count];
	return sections;
    
    
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    // Return the header of sections.
	NSString *key = [[self sectionKeys] objectAtIndex:section];
    return key;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    NSString *key = [[self sectionKeys] objectAtIndex:section];
	NSArray *content = [[self sectionContents] objectForKey:key];
	NSInteger rows = [content count];
	return rows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSString *key = [[self sectionKeys] objectAtIndex:[indexPath section]];
	NSArray *content = [[self sectionContents] objectForKey:key];
	Glossary *obj = [content objectAtIndex:[indexPath row]];
	
	static NSString *CellIdentifier = @"CellIdentifier";
	
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	if (cell == nil)
	{
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
	}
	
	[[cell textLabel] setText:obj.word]; /// the title from glossary object
	
	return cell;
    
}

- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar{             // return NO to not become first responder
    NSLog(@"searchBarShouldBeginEditing");
    return YES;
}
- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar{            // called when text starts editing
    NSLog(@"searchBarTextDidBeginEditing");
    
}
- (BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar{               // return NO to not resign first responder
    NSLog(@"searchBarShouldEndEditing");
    
    return YES;
}
- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar{              // called when text ends editing
    NSLog(@"searchBarTextDidEndEditing");
    
}
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{  // called when text changes 
    NSLog(@"textDidChange");
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)aSearchBar {// called when keyboard search button pressed
    
    [searchBar resignFirstResponder];
    NSString *searchString = aSearchBar.text;
    Glossary *obj;
    
    // remove all the objects from the existing array
    [wordArray removeAllObjects];
    [defArray removeAllObjects];
    
    for (int i=0; i<[mainSectionKeys count]; i++) {
        NSString *key = [mainSectionKeys objectAtIndex:i];
        NSArray *content = [mainSectionContents objectForKey:key];
        for (int j=0; j<[content count]; j++) {
            obj = [content objectAtIndex:j];  
            NSRange wordrange = [obj.word rangeOfString:searchString options:NSCaseInsensitiveSearch];
            NSRange defrange = [obj.definition rangeOfString:searchString options:NSCaseInsensitiveSearch];
            if (wordrange.length>0||defrange.length>0){
                NSLog(@" %@ found ",obj.word);
                // add new searched objects to the array
                [wordArray addObject:obj.word];
                [defArray addObject:obj.definition];
            }
        }
    }
    // again call the below function to reset the dictionary objects
    [self SetDictionaryArray];
    [glossaryTableView reloadData];// reload table
}


/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 { 
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }   
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }   
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

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
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
//    NSString *name = [[dao libraryItemAtIndex:indexPath.row] valueForKey:@"name"];
//    NSString *description = [[dao libraryItemAtIndex:indexPath.row] valueForKey:@"description"];
//    NSLog(@"Name: %@",name);
//    NSLog(@"Name: %@",description);
    NSString *key = [[self sectionKeys] objectAtIndex:[indexPath section]];
	NSArray *content = [[self sectionContents] objectForKey:key];
	Glossary *obj = [content objectAtIndex:[indexPath row]];
    
    NSString *name = obj.word;
    NSString *description = obj.definition;
    
    //[[cell textLabel] setText:obj.word];
    
    GlossaryDetailViewController *controller = [[GlossaryDetailViewController alloc] initWithglossarydata:name: description: [content objectAtIndex:[indexPath row]]];
    controller.title = obj.word;
    controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentModalViewController:controller animated:YES];

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