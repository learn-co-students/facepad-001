//
//  TextTableViewCell.h
//  
//
//  Created by Joe Burgess on 10/16/14.
//
//

#import <UIKit/UIKit.h>

@interface FISTextTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *profilePic;
@property (strong, nonatomic) IBOutlet UILabel *profileUsername;
@property (strong, nonatomic) IBOutlet UILabel *postContent;

@end
