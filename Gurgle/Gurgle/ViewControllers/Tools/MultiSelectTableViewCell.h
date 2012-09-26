//
//  MultiSelectTableViewCell.h
//  Gurgle
//
//  Created by Dhanasekar Gunabalan on 8/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface MultiSelectTableViewCell : UITableViewCell 
{
    UIImageView *  _mSelectedIndicator; //show the selected mark
    BOOL           _mSelected;        //differ from property selected
}

@property (nonatomic, assign) BOOL mSelected;


- (void)changeMSelectedState;

@end