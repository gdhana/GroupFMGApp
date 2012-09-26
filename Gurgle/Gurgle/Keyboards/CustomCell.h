//
//  CustomCell.h
//  Gurgle
//
//  Created by Dhanasekar Gunabalan on 6/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCell : UITableViewCell
{
	BOOL checked;
	NSString *title;
	
	UIButton *checkButton;
}

@property (nonatomic, retain) NSString *title;
@property (nonatomic, assign) BOOL checked;
@property (nonatomic, retain) UIButton *checkButton;
@property (nonatomic, retain) UITextField *textField;

- (void)checkAction:(id)sender;


@end
