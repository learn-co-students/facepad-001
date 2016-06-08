//
//  FISFeedPost.h
//  facepad
//
//  Created by John Richardson on 6/8/16.
//  Copyright © 2016 The Flatiron School. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FISUser.h"

@interface FISFeedPost : NSObject

@property (nonatomic) FISUser *user;
@property (nonatomic) NSString *date;

@end
