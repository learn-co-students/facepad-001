//
//  FISNewsFeedTableViewControllerSpec.m
//  facepad
//
//  Created by Tom OMalley on 7/21/15.
//  Copyright 2015 The Flatiron School. All rights reserved.
//

#import "Specta.h"
#define EXP_SHORTHAND
#import "Expecta.h"
#import "FISAppDelegate.h"
#import "FISUser.h"
#import "FISNewsFeedTableViewController.h"
#import "FISTextTableViewCell.h"
#import "FISCoverImageTableViewCell.h"
#import "FISImageTableViewCell.h"
#import "FISTextPost.h"
#import "FISImagePost.h"
#import "OCMockito.h"

SpecBegin(FISNewsFeedTableViewController)

describe(@"FISNewsFeedTableViewController", ^{
    
    __block UIWindow *mainWindow;
    __block FISNewsFeedTableViewController *fisTVC;
    __block FISUser *testUser;
    __block FISTextPost *textPost1;
    __block FISImagePost *imagePost1;
    
    beforeAll(^{
        // set up test user with posts
        testUser = [[FISUser alloc] init];
        
        testUser.username = @"Joe Burgess";
        testUser.profilePic = [UIImage imageNamed:@"joe-burgess"];
        testUser.cover = [UIImage imageNamed:@"coverimage"];
        
        textPost1 = [[FISTextPost alloc] init];
        textPost1.textContent = @"Excited for the first day of school!";
        textPost1.user = testUser;
        
        imagePost1 = [[FISImagePost alloc] init];
        imagePost1.imageContent = [UIImage imageNamed:@"flying"];
        imagePost1.user = testUser;
        
        testUser.posts = [@[textPost1, imagePost1] mutableCopy];
        
        // if it's breaking here, add this storyboardID to your tableViewController
        fisTVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"FISNewsFeedTableViewController"];
        
        // pass testUser to fisTVC and put it on the window
        fisTVC.user = testUser;
        mainWindow = ((FISAppDelegate*)[UIApplication sharedApplication].delegate).window;
        mainWindow.rootViewController = fisTVC;
        [mainWindow makeKeyAndVisible];
    });
    
    describe(@"has", ^{
        it(@"a public user property that takes an FISUser", ^{
            expect([fisTVC respondsToSelector:@selector(user)]).to.beTruthy;
            expect(fisTVC.user).to.equal(testUser);
            NSLog(@"%@", testUser);
        });
    });
    
    describe(@"FISCoverImageTableViewCell", ^{
        
        __block FISCoverImageTableViewCell *coverCell;
        
        beforeAll(^{
            NSIndexPath *ip = [NSIndexPath indexPathForRow:0 inSection:0];
            coverCell = (FISCoverImageTableViewCell*)[fisTVC.tableView cellForRowAtIndexPath:ip];
        });
        
        it(@"is the first cell", ^{
            expect(coverCell).to.beKindOf([FISCoverImageTableViewCell class]);
        });
        
        it(@"has a UIImageView property named cover", ^{
            expect(coverCell.cover).to.beKindOf([UIImageView class]);
            expect(coverCell.cover.image).to.equal(testUser.cover);
        });
    });
    
    describe(@"FISTextTableViewCell", ^{
        
        __block FISTextTableViewCell *textCell;
        __block FISTextPost *thisTextPost;
        
        beforeAll(^{
            NSIndexPath *ip = [NSIndexPath indexPathForRow:1 inSection:0];
            textCell = (FISTextTableViewCell*)[fisTVC.tableView cellForRowAtIndexPath:ip];
            thisTextPost = testUser.posts[ip.row-1];
        });
        
        it(@"is the next cell", ^{
            expect(textCell).to.beKindOf([FISTextTableViewCell class]);
        });
        
        it(@"has a profile picture and username", ^{
            expect(textCell.profilePic.image).to.equal(testUser.profilePic);
            expect(textCell.profileUsername.text).to.equal(testUser.username);
        });
        
        it(@"contains the appropriate text content", ^{
            expect(textCell.postContent.text).to.equal(thisTextPost.textContent);
        });
    });
    
    describe(@"FISImageTableViewCell", ^{
        
        __block FISImageTableViewCell *imageCell;
        __block FISImagePost *thisImagePost;
        
        beforeAll(^{
            NSIndexPath *ip = [NSIndexPath indexPathForRow:2 inSection:0];
            thisImagePost = testUser.posts[ip.row-1];
            imageCell = (FISImageTableViewCell*)[fisTVC.tableView cellForRowAtIndexPath:ip];
        });
        
        it(@"is the last cell", ^{
            expect(imageCell).to.beKindOf([FISImageTableViewCell class]);
        });
        
        it(@"has a profile picture and username", ^{
            expect(imageCell.profilePic.image).to.equal(testUser.profilePic);
            expect(imageCell.profileUsername.text).to.equal(testUser.username);
        });
        
        it(@"contains the appropriate image content", ^{
            expect(imageCell.contentImage.image).to.equal(thisImagePost.imageContent);
            
        });
    });
});

SpecEnd
