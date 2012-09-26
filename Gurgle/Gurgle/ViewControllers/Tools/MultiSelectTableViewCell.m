//
//  MultiSelectTableViewCell.m
//  Gurgle
//
//  Created by Dhanasekar Gunabalan on 8/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "MultiSelectTableViewCell.h"



@implementation MultiSelectTableViewCell


@synthesize mSelected = _mSelected;


#pragma mark -
#pragma mark UITableViewCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier 
{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) 
    {      
        _mSelected = NO;
        CGRect indicatorFrame = CGRectMake(-30, abs(self.frame.size.height - 30)/ 2, 30, 30);
        _mSelectedIndicator = [[UIImageView alloc] initWithFrame:indicatorFrame];
        _mSelectedIndicator.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleTopMargin;
        [self.contentView addSubview:_mSelectedIndicator];
    }
    return self;
}



- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationBeginsFromCurrentState:YES];
    
    if (_mSelected)
    {
        if (((UITableView *)self.superview).isEditing)
        {
            self.backgroundView.backgroundColor = [UIColor colorWithRed:223.0/255.0 green:230.0/255.0 blue:250.0/255.0 alpha:1.0];
        }
        else
        {
            self.backgroundView.backgroundColor = [UIColor clearColor];
        }
        
        self.textLabel.textColor = [UIColor magentaColor];
        [_mSelectedIndicator setImage:[UIImage imageNamed:@"icon_sel_mark.png"]];
        self.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    else
    {
        self.backgroundView.backgroundColor = [UIColor clearColor];
        self.textLabel.textColor = [UIColor blackColor];
        [_mSelectedIndicator setImage:[UIImage imageNamed:@"icon_unsel_mark.png"]];
        self.accessoryType = UITableViewCellAccessoryNone;
    }
    
    [UIView commitAnimations];
}



- (void)setEditing:(BOOL)editing animated:(BOOL)animated
{
    [super setEditing:editing animated:animated];
    //[self setNeedsLayout];
}



#pragma mark -
#pragma mark Public

- (void)changeMSelectedState
{
    _mSelected = !_mSelected;
    [self setNeedsLayout];
}



@end
