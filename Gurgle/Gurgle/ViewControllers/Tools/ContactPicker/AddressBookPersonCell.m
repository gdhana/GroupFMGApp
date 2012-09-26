//
//  AddressBookPersonCell.m
//  Gurgle VIP Community
//
//  Created by Ravi Ramamrutham on 27/08/2012.
//  Copyright (c) 2012 Ravi Ramamrutham. All rights reserved.
//

#import "AddressBookPersonCell.h"

@implementation AddressBookPersonCell
@synthesize personNameLabel;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"AddressBookPersonCell" owner:self options:nil];
        [self addSubview:[nib objectAtIndex:0]];
    }
    return self;
}

//- (void)setSelected:(BOOL)selected animated:(BOOL)animated
//{
//    [super setSelected:selected animated:animated];
//
//    // Configure the view for the selected state
//}

@end
