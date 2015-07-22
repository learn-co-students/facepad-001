//
//  FISNewsFeedTableViewControllerSpec.m
//  facepad
//
//  Created by Tom OMalley on 7/21/15.
//  Copyright 2015 The Flatiron School. All rights reserved.
//

#import "Specta.h"
#import "FISAppDelegate.h"
#import "FISUser.h"
#import "FISNewsFeedTableViewController.h"
#import "FISTextTableViewCell.h"
#import "FISCoverImageTableViewCell.h"
#import "FISImageTableViewCell.h"

SpecBegin(FISNewsFeedTableViewController)

describe(@"FISNewsFeedTableViewController", ^{
    
    __block UIWindow *mainWindow;
    __block FISNewsFeedTableViewController *fisTVC;
    __block FISUser *testUser;
    
    beforeAll(^{
        testUser = [[FISUser alloc] init];
        testUser.username = @"Joe Burgess";
        testUser.profilePic = [UIImage imageNamed:@"joe-burgess"];
        testUser.cover = [UIImage imageNamed:@"coverimage"];

        // if it's breaking here, add this storyboardID to your tableViewController
        fisTVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"FISNewsFeedTableViewController"];
        
        fisTVC.user = testUser;
        mainWindow = ((FISAppDelegate*)[UIApplication sharedApplication].delegate).window;
        mainWindow.rootViewController = fisTVC;
        [mainWindow makeKeyAndVisible];
    });
    
    describe(@"FISNewsFeedTableViewController", ^{
        it(@"has a public user property that takes an FISUser", ^{
            expect([fisTVC respondsToSelector:@selector(user)]).to.beTruthy;
            expect(fisTVC.user).to.beKindOf([FISUser class]);
        });
    });
    
    describe(@"TVC has different kinds of cells", ^{
        
        it(@"has an FISCoverImageTableViewCell as the first cell", ^{
            NSIndexPath *ip = [NSIndexPath indexPathForRow:0 inSection:0];
            FISCoverImageTableViewCell *cell = (FISCoverImageTableViewCell*)[fisTVC.tableView cellForRowAtIndexPath:ip];
            
            expect(cell).to.beKindOf([FISCoverImageTableViewCell class]);

            expect(cell.cover).to.beKindOf([UIImageView class]);
        });
        
        it(@"has an FISTextTableViewCell next (with appropriate properties)", ^{
            NSIndexPath *ip = [NSIndexPath indexPathForRow:1 inSection:0];
            FISTextTableViewCell *cell = (FISTextTableViewCell*)[fisTVC.tableView cellForRowAtIndexPath:ip];
            
            expect(cell).to.beKindOf([FISTextTableViewCell class]);
            
            expect(cell.profilePic).to.beKindOf([UIImageView class]);
            expect(cell.profileUsername).to.beKindOf([UILabel class]);
            expect(cell.postContent).to.beKindOf([UILabel class]);
        });
        
        it(@"has an FISImageTableViewCell last (with appropriate properties)", ^{
            NSIndexPath *ip = [NSIndexPath indexPathForRow:2 inSection:0];
            FISImageTableViewCell *cell = (FISImageTableViewCell*)[fisTVC.tableView cellForRowAtIndexPath:ip];
            
            expect(cell).to.beKindOf([FISImageTableViewCell class]);
            
            expect(cell.profilePic).to.beKindOf([UIImageView class]);
            expect(cell.profileUsername).to.beKindOf([UILabel class]);
            expect(cell.contentImage).to.beKindOf([UIImageView class]);
        });
    });
});

SpecEnd
