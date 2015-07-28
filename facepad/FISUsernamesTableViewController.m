//
//  FISUsernamesTableViewController.m
//  
//
//  Created by Tom OMalley on 7/22/15.
//
//

#import "FISUsernamesTableViewController.h"
#import "FISUser.h"
#import "FISTextPost.h"
#import "FISImagePost.h"
#import "FISNewsFeedTableViewController.h"

@interface FISUsernamesTableViewController ()

@property (strong, nonatomic) NSArray *users;

@end

@implementation FISUsernamesTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    FISUser *joe = [[FISUser alloc] init];
    joe.username = @"jmburges";
    joe.profilePic = [UIImage imageNamed:@"joe-burgess"];
    joe.cover = [UIImage imageNamed:@"coverimage"];
    
    FISTextPost *textPost1 = [[FISTextPost alloc] init];
    textPost1.textContent = @"Excited for the first day of school!";
    textPost1.user = joe;
    
    FISImagePost *imagePost1 = [[FISImagePost alloc] init];
    imagePost1.imageContent = [UIImage imageNamed:@"flying"];
    imagePost1.user = joe;
    
    joe.posts = [@[textPost1, imagePost1] mutableCopy];
    
    self.users = @[joe];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.users.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"userCell" forIndexPath:indexPath];
    
    FISUser *thisUser = self.users[indexPath.row];
    cell.textLabel.text = thisUser.username;
    
    return cell;
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    FISNewsFeedTableViewController *newsfeedTVC = [segue destinationViewController];
    NSIndexPath *selectedIP = [self.tableView indexPathForSelectedRow];
    newsfeedTVC.user = self.users[selectedIP.row];
}


@end
