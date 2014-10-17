//
//  FISContent.h
//  facepad
//
//  Created by Joe Burgess on 10/16/14.
//  Copyright (c) 2014 The Flatiron School. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FISUser;

@interface FISContent : NSObject

@property (strong, nonatomic) NSString *textContent;
@property (strong, nonatomic) UIImage *imageContent;
@property (strong, nonatomic) FISUser *user;

@end
