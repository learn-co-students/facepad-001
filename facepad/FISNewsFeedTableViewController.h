//
//  FISNewsFeedTableViewController.h
//  facepad
//
//  Created by Joe Burgess on 10/16/14.
//  Copyright (c) 2014 The Flatiron School. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FISUser;
@interface FISNewsFeedTableViewController : UITableViewController
@property (strong, nonatomic) FISUser *user;
@end
