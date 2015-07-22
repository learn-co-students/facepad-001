//
//  FISUserSpec.m
//  facepad
//
//  Created by Tom OMalley on 7/21/15.
//  Copyright 2015 The Flatiron School. All rights reserved.
//

#import "Specta.h"
#import "FISUser.h"


SpecBegin(FISUser)

describe(@"FISUser", ^{
    
    __block FISUser *testUser;
    
    beforeAll(^{
        testUser = [[FISUser alloc] init];
        testUser.username = @"Joe Burgess";
        testUser.profilePic = [UIImage imageNamed:@"joe-burgess"];
        testUser.cover = [UIImage imageNamed:@"coverimage"];
    });
    
    it(@"has properties for the username, profile picture, and cover image",
       ^{
        expect([testUser respondsToSelector:@selector(username)]).to.beTruthy;
        expect(testUser.username).to.beKindOf([NSString class]);
        
        expect([testUser respondsToSelector:@selector(profilePic)]).to.beTruthy;
        expect(testUser.profilePic).to.beKindOf([UIImage class]);

        expect([testUser respondsToSelector:@selector(cover)]).to.beTruthy;
        expect(testUser.cover).to.beKindOf([UIImage class]);
    });
});

SpecEnd
