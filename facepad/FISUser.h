//
//  FISUser.h
//  facepad
//
//  Created by Joe Burgess on 10/17/14.
//  Copyright (c) 2014 The Flatiron School. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FISUser : NSObject

@property (strong, nonatomic) NSString *username;
@property (strong, nonatomic) UIImage *profilePic;
@property (strong, nonatomic) UIImage *cover;
@property (strong, nonatomic) NSMutableArray *posts;
@end
