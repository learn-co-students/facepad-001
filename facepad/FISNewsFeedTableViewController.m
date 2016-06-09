//
//  FISNewsFeedTableViewController.m
//  facepad
//
//  Created by John Richardson on 6/8/16.
//  Copyright © 2016 The Flatiron School. All rights reserved.
//

#import "FISNewsFeedTableViewController.h"
#import "FISCoverImageTableViewCell.h"
#import "FISTextTableViewCell.h"
#import "FISImageTableViewCell.h"
#import "FISImageTableViewCell.h"
#import "FISTextPost.h"
#import "FISImagePost.h"

@interface FISNewsFeedTableViewController ()

@end

@implementation FISNewsFeedTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
//    return 0;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.user.posts count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        NSString *SimpleIdentifier = @"headerCell";
        FISCoverImageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:SimpleIdentifier];
        cell.cover.image = self.user.cover;

        if (cell == nil) {
            cell = [[FISCoverImageTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:SimpleIdentifier];
        }
        return cell;
    } else {
        id obj = self.user.posts[indexPath.row];
        if ([obj isKindOfClass:[FISTextPost class]]) {
            FISTextPost *post = self.user.posts[indexPath.row];
            NSString *SimpleIdentifier = @"textCell";
            FISTextTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:SimpleIdentifier];
            cell.profileUsername.text = self.user.username;
            cell.profilePic.image = self.user.profilePic;
            cell.postContent.text = post.textContent;
            return cell;
        } else if ([obj isKindOfClass:[FISImagePost class]]) {
            FISImagePost *post = self.user.posts[indexPath.row];
            NSString *SimpleIdentifier = @"imageCell";
            FISImageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:SimpleIdentifier];
            cell.profileUsername.text = self.user.username;
            cell.profilePic.image = self.user.profilePic;
            cell.contentImage.image = post.imageContent;
            return cell;
        }
    }
    return nil;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
