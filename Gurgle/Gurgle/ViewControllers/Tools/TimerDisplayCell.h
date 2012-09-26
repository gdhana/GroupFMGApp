//
//  TimerDisplayCell.h
//  Gurgle
//
//  Created by Dhanasekar Gunabalan on 8/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TimerDisplayCell : UITableViewCell

@property(nonatomic,retain) UILabel *startLabel;
@property(nonatomic,retain) UILabel *endLabel;
@property(nonatomic,retain) UILabel *durationLabel;
@property(nonatomic,retain) UILabel *frequencyLabel;

@end
