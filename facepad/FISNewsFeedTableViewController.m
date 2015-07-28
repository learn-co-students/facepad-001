//
//  FISNewsFeedTableViewController.m
//  facepad
//
//  Created by Joe Burgess on 10/16/14.
//  Copyright (c) 2014 The Flatiron School. All rights reserved.
//

#import "FISNewsFeedTableViewController.h"
#import "FISUser.h"
#import "FISTextPost.h"
#import "FISImagePost.h"
#import "FISTextTableViewCell.h"
#import "FISCoverImageTableViewCell.h"
#import "FISImageTableViewCell.h"

@interface FISNewsFeedTableViewController ()
@end

@implementation FISNewsFeedTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = self.user.username;
}

#pragma mark - Table view data source

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return 110;
    }

    id thisPost = self.user.posts[indexPath.row-1];
    if ([thisPost isKindOfClass:[FISTextPost class]]) {
        return 110;
    }
    else
    {
        return 261;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.user.posts count]+1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    if (indexPath.row==0) {
        FISCoverImageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"coverCell"];
        cell.cover.image = self.user.cover;
        return cell;
    }

    id thisPost = self.user.posts[indexPath.row-1];

    if ([thisPost isKindOfClass:[FISTextPost class]]) {
        FISTextPost *thisTextPost = thisPost;
        FISTextTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"textCell"];
        cell.profilePic.image = self.user.profilePic;
        cell.profileUsername.text = self.user.username;
        cell.postContent.text = thisTextPost.textContent;
        return cell;
    }
    else
    {
        FISImagePost *thisImagePost = thisPost;
        FISImageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"imageCell"];
        cell.profilePic.image = self.user.profilePic;
        cell.profileUsername.text = self.user.username;
        cell.contentImage.image = thisImagePost.imageContent;
        return cell;
    }
}

@end
