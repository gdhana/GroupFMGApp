//
//  MyDelegateHelper.h
//  Gurgle
//
//  Created by Dhanasekar Gunabalan on 6/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//


#import <UIKit/UIKit.h>


@interface MyDelegateHelper : NSObject
{
    NSArray * images;
    CGRect  LayerFrame;
}
@property(nonatomic,assign)int FlipNr;
- (id)initWithImages:(NSArray*)_images frame:(CGRect)_LayerFrame;
@end
