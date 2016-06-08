//
//  FISUser.h
//  facepad
//
//  Created by John Richardson on 6/8/16.
//  Copyright © 2016 The Flatiron School. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FISUser : NSObject

@property (nonatomic) NSString *username;
@property (nonatomic) UIImage *profilePic;
@property (nonatomic) UIImage *cover;
@property (nonatomic) NSArray *posts;

@end
