//
//  ESRenderer.h
//  CogEngine
//
//  Created by Minh Nguyen on 7/25/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

#import <OpenGLES/EAGL.h>
#import <OpenGLES/EAGLDrawable.h>

@protocol ESRenderer <NSObject>

- (void)render;
- (void)beginRender;
- (void)endRender;

- (BOOL)resizeFromLayer:(CAEAGLLayer *)layer;

@end
