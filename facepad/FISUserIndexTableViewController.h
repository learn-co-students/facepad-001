//
//  FISUserIndexTableViewController.h
//  facepad
//
//  Created by John Richardson on 6/8/16.
//  Copyright © 2016 The Flatiron School. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FISUser.h"

@interface FISUserIndexTableViewController : UITableViewController

@property (nonatomic) NSArray *users;
@property (nonatomic) FISUser *user;

@end
