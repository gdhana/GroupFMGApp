//
//  WeekDisplayCell.m
//  Gurgle
//
//  Created by Dhanasekar Gunabalan on 8/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "WeekDisplayCell.h"

@implementation WeekDisplayCell


@synthesize TitleLabel,DescLabel,FrontButton,PrevButton;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        TitleLabel = [[UILabel alloc]init];
        TitleLabel.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:TitleLabel];
        
        DescLabel = [[UILabel alloc]init];
        DescLabel.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:DescLabel];
        
        FrontButton = [[UIButton alloc]init];
        FrontButton.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:FrontButton];
        
        PrevButton = [[UIButton alloc]init];
        PrevButton.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:PrevButton];
          
    }
    return self;
}
-(void)layoutSubviews{
    
    
    [super layoutSubviews];
    CGRect contentRect = self.contentView.bounds;
    CGFloat boundsX = contentRect.origin.x;
    CGFloat boundsY = contentRect.origin.y;
    
    CGRect frame;
    
    frame= CGRectMake(boundsX+10 ,boundsY+3, 80, 15);
    TitleLabel.frame = frame;
    
    frame= CGRectMake(boundsX+35 ,boundsY+25, 191, 85);
    DescLabel.frame = frame;
    DescLabel.numberOfLines = 5;
    DescLabel.font = [UIFont systemFontOfSize:12.0];
    [DescLabel setLineBreakMode:UILineBreakModeWordWrap];
    
//    frame= CGRectMake(boundsX+238 ,boundsY+48, 18 , 28);
//    FrontButton.frame = frame;
//    FrontButton.backgroundColor = [UIColor clearColor];
//     UIImage *buttonImageNormal = [UIImage imageNamed:@"arrow_next.png"];
//     UIImage *strechableButtonImageNormal = [buttonImageNormal stretchableImageWithLeftCapWidth:12 topCapHeight:0];
//     [FrontButton setBackgroundImage:strechableButtonImageNormal forState:UIControlStateNormal];
    
//    frame= CGRectMake(boundsX+4 ,boundsY+48, 18, 28);
//    PrevButton.frame = frame;
//    PrevButton.backgroundColor = [UIColor clearColor];
//    UIImage *buttonImageNormal1 = [UIImage imageNamed:@"arrow_Prev.png"];
//    UIImage *strechableButtonImageNormal1 = [buttonImageNormal1 stretchableImageWithLeftCapWidth:12 topCapHeight:0];
//    [PrevButton setBackgroundImage:strechableButtonImageNormal1 forState:UIControlStateNormal];

    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end





//
//- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
//{
//    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
//    if (self) {
//        // Initialization code
//    }
//    return self;
//}
//
//- (void)setSelected:(BOOL)selected animated:(BOOL)animated
//{
//    [super setSelected:selected animated:animated];
//
//    // Configure the view for the selected state
//}
//
//@end
