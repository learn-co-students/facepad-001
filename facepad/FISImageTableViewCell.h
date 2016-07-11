//
//  FISImageTableViewCell.h
//  facepad
//
//  Created by John Richardson on 6/8/16.
//  Copyright © 2016 The Flatiron School. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FISImageTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *profilePic;
@property (weak, nonatomic) IBOutlet UITextView *profileUsername;
@property (weak, nonatomic) IBOutlet UIImageView *contentImage;

@end
