//
//  LabelFont.m
//  Gurgle
//
//  Created by Dhanasekar Gunabalan on 6/19/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LabelFont.h"

@implementation LabelFont

////- (id)initWithFrame:(CGRect)frame
////{
////    self = [super initWithFrame:frame];
////    if (self) {
////        // Initialization code
////    }
////    return self;
////}
//
///*
//// Only override drawRect: if you perform custom drawing.
//// An empty implementation adversely affects performance during animation.
//- (void)drawRect:(CGRect)rect
//{
//    // Drawing code
//}
//*/
//
//- (id)initWithCoder:(NSCoder *)decoder {
//    
//    if (self = [super initWithCoder: decoder]) {
//        [self setFont: [UIFont fontWithName: @"Cooper Black" size: self.font.pointSize]];
//    }
//    
//    return self;
//}

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self setFont:[UIFont fontWithName:@"Cooper Black" size:112.0]];
}

-(id)initWithFrame:(CGRect)frame
{
    id result = [super initWithFrame:frame];
    if (result) {
        [self setFont:[UIFont fontWithName:@"Cooper Black" size:112.0]];
    }
    return result;
}

@end
