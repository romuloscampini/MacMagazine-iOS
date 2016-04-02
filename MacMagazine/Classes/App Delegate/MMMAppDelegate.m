//
//  MMMAppDelegate.m
//  MacMagazine
//
//  Created by Fernando Saragoca on 6/14/15.
//  Copyright (c) 2015 made@sampa. All rights reserved.
//

#import <AFNetworking/AFNetworkActivityIndicatorManager.h>
#import <Tweaks/FBTweakShakeWindow.h>

#import "MMMAppDelegate.h"
#import "SUNCoreDataStore.h"

@interface MMMAppDelegate ()

@end

#pragma mark MMMAppDelegate

@implementation MMMAppDelegate

#pragma mark - Application Lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"MacMagazine" withExtension:@"momd"];
    [SUNCoreDataStore setupDefaultStoreWithModelURL:modelURL persistentStoreURL:nil];
    [AFNetworkActivityIndicatorManager sharedManager].enabled = YES;
    
    [self.window setTintColor:[UIColor colorWithRed:0.25 green:0.66 blue:0.96 alpha:1]];
    
    return YES;
}

#pragma mark FBTweaks UI Override

#ifdef DEBUG
- (UIWindow *)window {
    if (!_window) {
        _window = [[FBTweakShakeWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    }
    
    return _window;
}
#endif
@end