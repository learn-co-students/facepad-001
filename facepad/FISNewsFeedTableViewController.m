//
//  FISNewsFeedTableViewController.m
//  facepad
//
//  Created by Joe Burgess on 10/16/14.
//  Copyright (c) 2014 The Flatiron School. All rights reserved.
//

#import "FISNewsFeedTableViewController.h"
#import "FISContent.h"
#import "FISUser.h"
#import "TextTableViewCell.h"
#import "FISCoverImageTableViewCell.h"
#import "FISImageTableViewCell.h"

@interface FISNewsFeedTableViewController ()
@property (strong, nonatomic) NSMutableArray *posts;
@property (strong, nonatomic) FISUser *user;
@end

@implementation FISNewsFeedTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;


    self.posts = [[NSMutableArray alloc] init];

    FISUser *joe = [[FISUser alloc] init];
    joe.username = @"jmburges";
    joe.profilePic = [UIImage imageNamed:@"joe-burgess"];
    joe.cover = [UIImage imageNamed:@"coverimage"];

    self.user = joe;

    FISContent *textPost1 = [[FISContent alloc] init];
    textPost1.textContent = @"Excited for the first day of school!";
    textPost1.user=joe;

    FISContent *imagePost1 = [[FISContent alloc] init];
    imagePost1.imageContent = [UIImage imageNamed:@"flying"];
    imagePost1.user=joe;

    [self.posts addObject:textPost1];
    [self.posts addObject:imagePost1];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return 110;
    }
    FISContent *content = self.posts[indexPath.row-1];
    if (content.textContent) {
        return 110;
    } else
    {
        return 261;
    }
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [self.posts count]+1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {


    if (indexPath.row==0) {
        FISCoverImageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"coverCell"];
        cell.cover.image = self.user.cover;
        return cell;
    }

    FISContent *content = self.posts[indexPath.row-1];

    if (content.textContent) {
        TextTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"textCell"];
        cell.profilePic.image = content.user.profilePic;
        cell.profileUsername.text = content.user.username;
        cell.postContent.text = content.textContent;
        return cell;
    } else
    {
        FISImageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"imageCell"];
        cell.profilePic.image = content.user.profilePic;
        cell.profileUsername.text = content.user.username;
        cell.contentImage.image = content.imageContent;
        return cell;
    }
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
