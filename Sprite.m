//
//  Sprite.m
//  CogEngine
//
//  Created by Minh Nguyen on 7/31/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Sprite.h"

#import "Matrix.h"
#import "Engine.h"

@implementation Sprite

@synthesize bounds;

- (id)init
{
	if ((self = [super init])) {
		
		vertices[0] = 0.0f;
		vertices[1] = 0.0f;
		vertices[2] = 1.0f;
		//vertices[3] = 0.0f;
		
		
		vertices[3] = 1.0f;
		vertices[4] = 0.0f;
		vertices[5] = 1.0f;
		//vertices[7] = 0.0f;
		
		vertices[6] = 1.0f;
		vertices[7] = 1.0f;
		vertices[8] = 1.0f;
		//vertices[11] = 0.0f;
		
		vertices[9] = 0.0f;
		vertices[10] = 1.0f;
		vertices[11] = 1.0f;
		//vertices[15] = 0.0f;
		
		[transform translateWithX:-0.0f Y:-0.0f Z:-5.0f];
	}
	
	return self;
}

- (void)update:(NSObject *)dt{
	NSLog(@"Sprite Update");
}

- (void)render:(NSObject *)dt{
	NSLog(@"Sprite Render");
	
	[[Engine sharedEngine] setModelMatrix:transform];
	
	float trans = (rand()%20 - 10)/ 1000.0f;
	[transform translateWithX:trans Y:trans Z:trans];
		
    static const GLubyte squareColors[] = {
        255, 255,   0, 255,
        0,   255, 255, 255,
        0,     0,   0,   0,
        255, 255,   0, 255,
        0,   255, 255, 255,
        0,     0,   0,   0
    };
	
	static const GLushort indices[] = {
        0,3,1,
		1,3,2
    };
	
    static float transY = 100.0f;
	
    // Update uniform value
    glUniform1f(0, (GLfloat)transY);
    transY += 0.075f;	
	
    // Update attribute values
    glVertexAttribPointer(0, 3, GL_FLOAT, GL_FALSE, 0, vertices);
    glEnableVertexAttribArray(0);
    glVertexAttribPointer(1, 4, GL_UNSIGNED_BYTE, 1, 0, squareColors);
    glEnableVertexAttribArray(1);
	
    // Draw
    //glDrawArrays(GL_TRIANGLE_STRIP, 0, 4);
	
	//
	glDrawElements (GL_TRIANGLES, 6, GL_UNSIGNED_SHORT, indices );
}


@end
