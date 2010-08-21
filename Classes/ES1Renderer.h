//
//  ES1Renderer.h
//  CogEngine
//
//  Created by Minh Nguyen on 7/25/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "ESRenderer.h"

#import "Constants.h"


@interface ES1Renderer : NSObject <ESRenderer>
{
@private
    EAGLContext *context;

    // The pixel dimensions of the CAEAGLLayer
    cgint backingWidth;
    cgint backingHeight;

    // The OpenGL ES names for the framebuffer and renderbuffer used to render to this view
    cguint defaultFramebuffer, colorRenderbuffer;
}

- (void)drawVertices:(cgfloat *)vertices size:(cgint)size indices:(cgushort *)indices count:(cgint)count;
- (void)setModelMatrix:(Matrix *)transform;

- (void)render;
- (void)beginRender;
- (void)endRender;

- (BOOL)resizeFromLayer:(CAEAGLLayer *)layer;

@end
