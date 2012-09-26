//
//  TimerDisplayCell.m
//  Gurgle
//
//  Created by Dhanasekar Gunabalan on 8/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TimerDisplayCell.h"

@implementation TimerDisplayCell

UIImageView *bgImageView;
@synthesize startLabel,endLabel,durationLabel,frequencyLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
       bgImageView= [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Clock_table.png"]];
        [self.contentView addSubview:bgImageView];
        
       durationLabel = [[UILabel alloc]init];
        durationLabel.backgroundColor = [UIColor clearColor];
        //durationLabel.text = @"11:11:11";
        [self.contentView addSubview:durationLabel];
        
        frequencyLabel = [[UILabel alloc]init];
        frequencyLabel.backgroundColor = [UIColor clearColor];
        //frequencyLabel.text = @"11:11:12";
        [self.contentView addSubview:frequencyLabel];
        
        startLabel = [[UILabel alloc]init];
        startLabel.backgroundColor = [UIColor clearColor];
        //startLabel.text = @"11:11:13";
        [self.contentView addSubview:startLabel];
        
        endLabel = [[UILabel alloc]init];
        endLabel.backgroundColor = [UIColor clearColor];
       // endLabel.text = @"11:11:14";
        [self.contentView addSubview:endLabel];
        
    
        
    }
    return self;
}
-(void)layoutSubviews{
    
    
    [super layoutSubviews];
    CGRect contentRect = self.contentView.bounds;
    CGFloat boundsX = contentRect.origin.x;
    CGFloat boundsY = contentRect.origin.y;
    
    CGRect frame;
    
    
    frame= CGRectMake(boundsX ,boundsY, 278, 95);
    bgImageView.frame = frame;
    
    frame= CGRectMake(boundsX+13 ,boundsY+10, 100, 45);
    durationLabel.frame = frame;
    
    frame= CGRectMake(boundsX+153 ,boundsY+10, 100, 45);
    frequencyLabel.frame = frame;
    
    frame= CGRectMake(boundsX+13 ,boundsY+55, 100, 45);
    startLabel.frame = frame;
    
    frame= CGRectMake(boundsX+153 ,boundsY+55, 100, 45);
    endLabel.frame = frame;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end

