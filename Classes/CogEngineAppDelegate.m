//
//  CogEngineAppDelegate.m
//  CogEngine
//
//  Created by Minh Nguyen on 7/25/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "CogEngineAppDelegate.h"
#import "EAGLView.h"

#import "Engine.h"
#import "MenuScene.h"

@implementation CogEngineAppDelegate

@synthesize window;
@synthesize glView;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
	NSLog(@"app didfinish launch glcount %d", [glView retainCount]);

	[Engine sharedEngine].glView = glView;
	
	[Engine sharedEngine].currentScene = [[[MenuScene alloc] init] autorelease];
	
	NSLog(@"after setting glView glcount %d", [glView retainCount]);

	
    [[Engine sharedEngine] startAnimation];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    [[Engine sharedEngine] stopAnimation];
	NSLog(@"app before cleanup launch glcount %d", [glView retainCount]);

	[[Engine sharedEngine] cleanup];
	
	NSLog(@"app after cleanup launch glcount %d", [glView retainCount]);

}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    [[Engine sharedEngine] startAnimation];
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    [[Engine sharedEngine] stopAnimation];
	
	[[Engine sharedEngine] cleanup];
}

- (void)dealloc
{
    [window release];
	
	NSLog(@"in dealloc setting glView glcount %d", [glView retainCount]);
    [glView release];
	NSLog(@"in dealloc after setting glView glcount %d", [glView retainCount]);

    [super dealloc];
}

@end
