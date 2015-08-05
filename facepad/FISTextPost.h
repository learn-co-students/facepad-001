//
//  FISTextPost.h
//  facepad
//
//  Created by Tom OMalley on 7/22/15.
//  Copyright (c) 2015 The Flatiron School. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FISUser.h"

@interface FISTextPost : NSObject

@property (strong, nonatomic) NSString *textContent;
@property (strong, nonatomic) FISUser *user;

@end
