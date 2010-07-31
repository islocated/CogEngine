//
//  Engine.h
//  CogEngine
//
//  Created by Minh Nguyen on 7/25/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class EAGLView;
@class Scene;

@interface Engine : NSObject {
	EAGLView *glView;
	
	BOOL animating;
    BOOL displayLinkSupported;
    NSInteger animationFrameInterval;
    // Use of the CADisplayLink class is the preferred method for controlling your animation timing.
    // CADisplayLink will link to the main display and fire every vsync when added to a given run-loop.
    // The NSTimer class is used only as fallback when running on a pre 3.1 device where CADisplayLink
    // isn't available.
    id displayLink;
    NSTimer *animationTimer;
	
	
	float dt;
	
	Scene *currentScene;
}

+ (Engine *) sharedEngine;

- (void) cleanup;

- (void) startAnimation;
- (void) stopAnimation;

@property (nonatomic, retain) EAGLView *glView;
@property (nonatomic, retain) Scene *currentScene;

@property (readonly, nonatomic, getter=isAnimating) BOOL animating;
@property (nonatomic) NSInteger animationFrameInterval;

@property (readonly) float dt;


@end
