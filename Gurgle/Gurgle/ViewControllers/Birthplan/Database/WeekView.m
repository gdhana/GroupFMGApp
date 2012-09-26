//
//  WeekView.m
//  Gurgle
//
//  Created by Madhumathi Karthikeyan on 05/09/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "WeekView.h"
#import "WeekDetails.h"
@implementation WeekView
@synthesize plusArray;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    
    self.backgroundColor=[UIColor clearColor];
    
    index = 1;
    
    
    WeekDetails *info = [plusArray objectAtIndex:index];
    
    bgImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"weekBG.png"]];
    bgImageView.frame=CGRectMake(0, 0, 240, 130);
    bgImageView.userInteractionEnabled=YES;
    [self addSubview:bgImageView];
    
    CGRect contentRect = self.bounds;
    CGFloat boundsX = contentRect.origin.x;
    CGFloat boundsY = contentRect.origin.y;
    
    WeekLabel=[[UILabel alloc]initWithFrame:CGRectMake(boundsX+15 ,boundsY+10,  110, 15)];
    WeekLabel.font=[UIFont fontWithName:@"Helvetica-Bold" size:14];
    WeekLabel.backgroundColor=[UIColor clearColor];
    WeekLabel.text = [NSString stringWithFormat:@"Week %d Tip %d",info.weekno,info.weekplus];
    WeekLabel.textColor = [UIColor colorWithRed:223/255.0f green:96/255.0f blue:164/255.0f alpha:1];
    [self addSubview:WeekLabel];
    
    ContentLabel=[[UILabel alloc]initWithFrame:CGRectMake(boundsX+15 ,boundsY+22, 210, 100)];
    ContentLabel.font=[UIFont fontWithName:@"Helvetica" size:12];
    ContentLabel.numberOfLines = 10;
    ContentLabel.backgroundColor=[UIColor clearColor];
    ContentLabel.text = [NSString stringWithFormat:@"%@",info.weekdesc];
    ContentLabel.textColor = [UIColor blackColor];
    [self addSubview:ContentLabel];

    prevArrow= [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"prev.png"]];
    prevArrow.frame=CGRectMake(boundsX+5,boundsY+12, 6, 10);
    prevArrow.userInteractionEnabled=YES;
    [self addSubview:prevArrow];
    
    nextArrow= [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"next.png"]];
    nextArrow.frame=CGRectMake(boundsX+225,boundsY+12, 6, 10);
    nextArrow.userInteractionEnabled=YES;
    [self addSubview:nextArrow];

    mPrevBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 20, 100)];
    mPrevBtn.backgroundColor = [UIColor clearColor];
    [mPrevBtn addTarget:self action:@selector(weekChange:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:mPrevBtn];
    
    mNextBtn = [[UIButton alloc]initWithFrame:CGRectMake(225, 0, 20, 100)];
    mNextBtn.backgroundColor = [UIColor clearColor];
    [mNextBtn addTarget:self action:@selector(weekChange:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:mNextBtn];

}
-(void) weekChange:(id)sender
{
    WeekDetails *info;
    
    if (sender == mPrevBtn&&index>=1) {
        index--;
       // NSLog(@"1:%d",index);
    }
    else if(sender == mNextBtn&&index<[plusArray count]-1) {
        index++;
        //NSLog(@"2:%d",index);
    }
    info = [plusArray objectAtIndex:index];
    if (index==0) {
        mNextBtn.hidden = NO;
        mPrevBtn.hidden = YES;
        nextArrow.hidden = NO;
        prevArrow.hidden = YES;
        WeekLabel.text = [NSString stringWithFormat:@"Week %d",info.weekno];}
    else   {
        WeekLabel.text = [NSString stringWithFormat:@"Week %d Tip %d",info.weekno,info.weekplus]; 
    }
    if (index==6) 
    {   mNextBtn.hidden = YES;
        mPrevBtn.hidden = NO;
        nextArrow.hidden = YES;
        prevArrow.hidden = NO;
      //  index = 0;
       // NSLog(@"3:%d",index);
    }
    ContentLabel.text = [NSString stringWithFormat:@"%@",info.weekdesc];
}
@end
