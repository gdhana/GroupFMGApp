//
//  WeekView.h
//  Gurgle
//
//  Created by Madhumathi Karthikeyan on 05/09/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WeekView : UIView
{
    UIImageView *bgImageView;
    UILabel *ContentLabel;
    UILabel *WeekLabel;
    UIImageView *prevArrow,*nextArrow;
    UIButton *mPrevBtn,*mNextBtn;
    int index;
}
@property (nonatomic,retain) NSArray* plusArray;
@end
