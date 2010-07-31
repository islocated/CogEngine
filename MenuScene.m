//
//  MenuScene.m
//  CogEngine
//
//  Created by Minh Nguyen on 7/27/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "MenuScene.h"

#import <OpenGLES/ES2/gl.h>
#import <OpenGLES/ES2/glext.h>

@implementation MenuScene

- (void)render:(NSObject *)dt {
	NSLog(@"Menu Scene render");
	
	
	// Replace the implementation of this method to do your own custom drawing
	
    static const GLfloat squareVertices[] = {
        -0.5f, -0.33f,
		0.5f, -0.33f,
        -0.5f,  0.33f,
		0.5f,  0.33f,
    };
	
    static const GLubyte squareColors[] = {
        255, 255,   0, 255,
        0,   255, 255, 255,
        0,     0,   0,   0,
        255,   0, 255, 255,
    };
	
    static float transY = 0.0f;
	
    // Update uniform value
    glUniform1f(0, (GLfloat)transY);
    transY += 0.075f;	
	
    // Update attribute values
    glVertexAttribPointer(0, 2, GL_FLOAT, 0, 0, squareVertices);
    glEnableVertexAttribArray(0);
    glVertexAttribPointer(1, 4, GL_UNSIGNED_BYTE, 1, 0, squareColors);
    glEnableVertexAttribArray(1);
	
    // Draw
    glDrawArrays(GL_TRIANGLE_STRIP, 0, 4);
}

@end
