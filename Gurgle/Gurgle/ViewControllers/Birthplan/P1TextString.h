//
//  P1TextString.h
//  Gurgle
//
//  Created by Dhanasekar Gunabalan on 8/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface P1TextString : NSObject <NSCoding, NSCopying> {

    NSString *Nametxt;
    NSString *T2;
    NSString *T3;
    NSString *T4;
    
}

@property (nonatomic,retain) NSString *Nametxt;
@property (nonatomic,retain) NSString *T2;
@property (nonatomic,retain) NSString *T3;
@property (nonatomic,retain) NSString *T4;

@end
