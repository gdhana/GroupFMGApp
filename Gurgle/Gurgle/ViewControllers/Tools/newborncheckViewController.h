//
//  newborncheckViewController.h
//  Gurgle
//
//  Created by Dhanasekar Gunabalan on 9/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface newborncheckViewController : UIViewController
{
    IBOutlet UIScrollView *scrollview;
    
    IBOutlet UIImageView *Topbanner;
    IBOutlet UIImageView *bottombanner;
    
    IBOutlet UIButton *btn1lbl;
    IBOutlet UIButton *btn1selc;
    IBOutlet UIButton *btn2lbl;
    IBOutlet UIButton *btn2selc;
    IBOutlet UIButton *btn3lbl;
    IBOutlet UIButton *btn3selc;
    IBOutlet UIButton *btn4lbl;
    IBOutlet UIButton *btn4selc;
    IBOutlet UIButton *btn5lbl;
    IBOutlet UIButton *btn5selc;
    IBOutlet UIButton *btn6lbl;
    IBOutlet UIButton *btn6selc;
    IBOutlet UIButton *btn7lbl;
    IBOutlet UIButton *btn7selc;
    IBOutlet UIButton *btn8lbl;
    IBOutlet UIButton *btn8selc;
    IBOutlet UIButton *btn9lbl;
    IBOutlet UIButton *btn9selc;
    IBOutlet UIButton *btn10lbl;
    IBOutlet UIButton *btn10selc;
    IBOutlet UIButton *btn11lbl;
    IBOutlet UIButton *btn11selc;
    IBOutlet UIButton *btn12lbl;
    IBOutlet UIButton *btn12selc;
    IBOutlet UIButton *btn13lbl;
    IBOutlet UIButton *btn13selc;
    IBOutlet UIButton *btn14lbl;
    IBOutlet UIButton *btn14selc;
    IBOutlet UIButton *btn15lbl;
    IBOutlet UIButton *btn15selc;
    IBOutlet UIButton *btn16lbl;
    IBOutlet UIButton *btn16selc;
    IBOutlet UIButton *btn17lbl;
    IBOutlet UIButton *btn17selc;
    IBOutlet UIButton *btn18lbl;
    IBOutlet UIButton *btn18selc;
    IBOutlet UIButton *btn19lbl;
    IBOutlet UIButton *btn19selc;
    IBOutlet UIButton *btn20lbl;
    IBOutlet UIButton *btn20selc;
    IBOutlet UIButton *btn21lbl;
    IBOutlet UIButton *btn21selc;
    IBOutlet UIButton *btn22lbl;
    IBOutlet UIButton *btn22selc;
    IBOutlet UIButton *btn23lbl;
    IBOutlet UIButton *btn23selc;
    IBOutlet UIButton *btn24lbl;
    IBOutlet UIButton *btn24selc;
    IBOutlet UIButton *btn25lbl;
    IBOutlet UIButton *btn25selc;
    IBOutlet UIButton *btn26lbl;
    IBOutlet UIButton *btn26selc;
    IBOutlet UIButton *btn27lbl;
    IBOutlet UIButton *btn27selc;
    IBOutlet UIButton *btn28lbl;
    IBOutlet UIButton *btn28selc;
    IBOutlet UIButton *btn29lbl;
    IBOutlet UIButton *btn29selc;
    IBOutlet UIButton *btn30lbl;
    IBOutlet UIButton *btn30selc;
    IBOutlet UIButton *btn31lbl;
    IBOutlet UIButton *btn31selc;
    IBOutlet UIButton *btn32lbl;
    IBOutlet UIButton *btn32selc;
    IBOutlet UIButton *btn33lbl;
    IBOutlet UIButton *btn33selc;
    IBOutlet UIButton *btn34lbl;
    IBOutlet UIButton *btn34selc;
    IBOutlet UIButton *btn35lbl;
    IBOutlet UIButton *btn35selc;
    
    BOOL checkboxSelected1,checkboxSelected2,checkboxSelected3,checkboxSelected4,checkboxSelected5,checkboxSelected6,checkboxSelected7,checkboxSelected8,checkboxSelected9;
    BOOL checkboxSelected10,checkboxSelected11,checkboxSelected12,checkboxSelected13,checkboxSelected14,checkboxSelected15,checkboxSelected16,checkboxSelected17,checkboxSelected18,checkboxSelected19,checkboxSelected20;
    BOOL checkboxSelected21,checkboxSelected22,checkboxSelected23,checkboxSelected24,checkboxSelected25,checkboxSelected26,checkboxSelected27,checkboxSelected28,checkboxSelected29,checkboxSelected30,checkboxSelected31,checkboxSelected32,checkboxSelected33,checkboxSelected34,checkboxSelected35;
    
    NSMutableArray	*Clickbuttons;
}

- (IBAction)btn1lbl:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *btn1lbl;
- (IBAction)btn2lbl:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *btn2lbl;
- (IBAction)btn3lbl:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *btn3lbl;
- (IBAction)btn4lbl:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *btn4lbl;
- (IBAction)btn5lbl:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *btn5lbl;
- (IBAction)btn6lbl:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *btn6lbl;
- (IBAction)btn7lbl:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *btn7lbl;
- (IBAction)btn8lbl:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *btn8lbl;
- (IBAction)btn9lbl:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *btn9lbl;
- (IBAction)btn10lbl:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *btn10lbl;
- (IBAction)btn11lbl:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *btn11lbl;
- (IBAction)btn12lbl:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *btn12lbl;
- (IBAction)btn13lbl:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *btn13lbl;
- (IBAction)btn14lbl:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *btn14lbl;
- (IBAction)btn15lbl:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *btn15lbl;
- (IBAction)btn16lbl:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *btn16lbl;
- (IBAction)btn17lbl:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *btn17lbl;
- (IBAction)btn18lbl:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *btn18lbl;
- (IBAction)btn19lbl:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *btn19lbl;
- (IBAction)btn20lbl:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *btn20lbl;
- (IBAction)btn21lbl:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *btn21lbl;
- (IBAction)btn22lbl:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *btn22lbl;
- (IBAction)btn23lbl:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *btn23lbl;
- (IBAction)btn24lbl:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *btn24lbl;
- (IBAction)btn25lbl:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *btn25lbl;
- (IBAction)btn26lbl:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *btn26lbl;
- (IBAction)btn27lbl:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *btn27lbl;
- (IBAction)btn28lbl:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *btn28lbl;
- (IBAction)btn29lbl:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *btn29lbl;
- (IBAction)btn30lbl:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *btn30lbl;
- (IBAction)btn31lbl:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *btn31lbl;
- (IBAction)btn32lbl:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *btn32lbl;
- (IBAction)btn33lbl:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *btn33lbl;
- (IBAction)btn34lbl:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *btn34lbl;
- (IBAction)btn35lbl:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *btn35lbl;

@property (nonatomic, retain)	NSMutableArray	*Clickbuttons;

- (IBAction)newbornbagchecklistinfoView:(id)sender;

- (IBAction)Showbirthplan:(id)sender;
- (IBAction)Toolsview:(id)sender;
- (IBAction)Fun:(id)sender;
- (IBAction)Help:(id)sender;


@end


