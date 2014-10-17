//
//  FISImageTableViewCell.h
//  facepad
//
//  Created by Joe Burgess on 10/16/14.
//  Copyright (c) 2014 The Flatiron School. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FISImageTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *profilePic;
@property (strong, nonatomic) IBOutlet UILabel *profileUsername;
@property (strong, nonatomic) IBOutlet UIImageView *contentImage;

@end
