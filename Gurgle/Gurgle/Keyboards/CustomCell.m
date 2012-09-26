//
//  CustomCell.m
//  Gurgle
//
//  Created by Dhanasekar Gunabalan on 6/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CustomCell.h"

@implementation CustomCell

@synthesize checked, title,checkButton,textField;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
	{
		//self.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
		
		// cell's title label
		self.textLabel.backgroundColor = self.backgroundColor;
		self.textLabel.opaque = NO;
		self.textLabel.textColor = [UIColor blackColor];
		self.textLabel.highlightedTextColor = [UIColor whiteColor];
		self.textLabel.font = [UIFont boldSystemFontOfSize:18.0];
		self.textLabel.lineBreakMode = UILineBreakModeWordWrap;
        self.textLabel.numberOfLines = 4;  // 0 means no max.
        
		// cell's check button
		checkButton = [UIButton buttonWithType:UIButtonTypeCustom];
		checkButton.frame = CGRectZero;
		checkButton.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
		checkButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
		[checkButton addTarget:self action:@selector(checkAction:) forControlEvents:UIControlEventTouchDown];
		checkButton.backgroundColor = self.backgroundColor;
		[self.contentView addSubview:checkButton];
        
        textField = [[UITextField alloc]init];
        textField.text=@"abc";
        textField.textColor=[UIColor blackColor];
		textField.backgroundColor = [UIColor whiteColor];
		[self.contentView addSubview:textField];
        textField.hidden = YES;
        
	}
	return self;
}

- (void)layoutSubviews
{
	[super layoutSubviews];
	
    CGRect contentRect = [self.contentView bounds];
	
	CGRect frame = CGRectMake(contentRect.origin.x + 40.0, 8.0, 195, 30.0);
	self.textLabel.frame = frame;
	
	// layout the check button image
	UIImage *checkedImage = [UIImage imageNamed:@"checked.png"];
	frame = CGRectMake(contentRect.origin.x + 235.0, 12.0, checkedImage.size.width, checkedImage.size.height);
	checkButton.frame = frame;
	
    frame = CGRectMake(contentRect.origin.x + 10.0, 12.0, 200, 25);
	textField.frame = frame;

    
	UIImage *image = (self.checked) ? checkedImage: [UIImage imageNamed:@"unchecked.png"];
	UIImage *newImage = [image stretchableImageWithLeftCapWidth:12.0 topCapHeight:0.0];
	[checkButton setBackgroundImage:newImage forState:UIControlStateNormal];
}

// called when the checkmark button is touched 
- (void)checkAction:(id)sender
{
	// note: we don't use 'sender' because this action method can be called separate from the button (i.e. from table selection)
	self.checked = !self.checked;
	UIImage *checkImage = (self.checked) ? [UIImage imageNamed:@"checked.png"] : [UIImage imageNamed:@"unchecked.png"];
	[checkButton setImage:checkImage forState:UIControlStateNormal];
    textField.textColor = [UIColor magentaColor];
}

@end
