//
//  GlossaryDetailViewController.h
//  Gurgle
//
//  Created by Dhanasekar Gunabalan on 5/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GlossaryData.h"

@interface GlossaryDetailViewController : UIViewController
{

    IBOutlet UIImageView *bottombanner;
    IBOutlet UIImageView *Topbanner;
    NSMutableArray *labels;
    NSMutableArray *values;
}

@property (strong, nonatomic) IBOutlet UINavigationItem *Glossarytitles;
@property (strong, nonatomic) IBOutlet UILabel *descript;

- (id)initWithglossarydata:(NSString *) title : (NSString *) descr : (NSDictionary *)dvdData;




- (IBAction)GlossaryDetailViewdone:(id)sender;
- (IBAction)showHelpinfoView:(id)sender;

- (IBAction)showBirthplanView:(id)sender;
- (IBAction)ToolsView:(id)sender;
- (IBAction)FunView:(id)sender;
- (IBAction)HelpView:(id)sender;

@end
