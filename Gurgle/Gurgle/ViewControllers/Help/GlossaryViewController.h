//
//  GlossaryViewController.h
//  Gurgle
//
//  Created by Dhanasekar Gunabalan on 5/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Glossary.h"

@interface GlossaryViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate> {
    
    IBOutlet UIImageView *bottombanner;
    IBOutlet UIImageView *Topbanner;
    
    IBOutlet UITableView *table;
    IBOutlet UISearchBar *search;
    
//	UITableView *table;
//	UISearchBar *search;
//	NSMutableDictionary *names;
//	NSMutableArray *keys;
//	NSDictionary *allNames;
}

@property(nonatomic,retain) UITableView *glossaryTableView; //
@property(nonatomic,retain) NSMutableArray *glossaryArray;
@property(nonatomic,retain) UISearchBar *searchBar; // 
@property (nonatomic, retain) NSMutableArray *sectionKeys;
@property (nonatomic, retain) NSMutableDictionary *sectionContents;

//@property (nonatomic, retain) IBOutlet UITableView *table;
//@property (nonatomic, retain) IBOutlet UISearchBar *search;
//@property (nonatomic, retain) NSMutableDictionary *names;
//@property (nonatomic, retain) NSMutableArray *keys;
//@property (nonatomic, retain) NSDictionary *allNames;
//
//- (void)resetSearch;
//- (void)handleSearchForTerm:(NSString *) searchTerm;


- (IBAction)showHelpinfoView:(id)sender;
- (IBAction)GlossaryViewdone:(id)sender;

- (IBAction)showBirthplanView:(id)sender;
- (IBAction)ToolsView:(id)sender;
- (IBAction)FunView:(id)sender;
- (IBAction)HelpView:(id)sender;

@end
