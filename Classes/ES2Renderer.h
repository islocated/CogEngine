//
//  ES2Renderer.h
//  CogEngine
//
//  Created by Minh Nguyen on 7/25/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "ESRenderer.h"

#import <OpenGLES/ES2/gl.h>
#import <OpenGLES/ES2/glext.h>

#import "Matrix.h"

@interface ES2Renderer : NSObject <ESRenderer>
{
@private
    EAGLContext *context;

    // The pixel dimensions of the CAEAGLLayer
    GLint backingWidth;
    GLint backingHeight;

    // The OpenGL ES names for the framebuffer and renderbuffer used to render to this view
    GLuint defaultFramebuffer, colorRenderbuffer;

    GLuint program;
}

- (void)setModelMatrix:(Matrix *)transform;

- (void)render;
- (void)beginRender;
- (void)endRender;

- (BOOL)resizeFromLayer:(CAEAGLLayer *)layer;

@end

