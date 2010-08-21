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
@synthesize texture;

- (id)init
{
	if ((self = [super init])) {
		
		cgfloat _vertices[] = {
			0.0f, 0.0f, 1.0f,
			1.0f, 0.0f, 1.0f,
			1.0f, 1.0f, 1.0f,
			0.0f, 1.0f, 1.0f
		};
		
		memcpy(vertices, _vertices, sizeof(_vertices));
		verticesSize = 3;	//size is number of components of vertices
		
		cgushort _indices[] = {
			0,3,1,
			1,3,2
		};
		
		memcpy(indices, _indices, sizeof(_indices));
		indicesCount = sizeof(indices)/sizeof(cgushort);
		
		[transform translateWithX:-0.0f Y:-0.0f Z:-5.0f];
	}
	
	return self;
}

- (void)update:(NSObject *)dt{
	NSLog(@"Sprite Update");
	
	float trans = (rand()%20 - 10)/ 1000.0f;
	[transform translateWithX:trans Y:trans Z:trans];
}

- (void)render:(NSObject *)dt{
	NSLog(@"Sprite Render");
	
	[[Engine sharedEngine] setModelMatrix:transform];
	
	[[Engine sharedEngine] setTexture:texture];
	
	[[Engine sharedEngine] drawVertices:vertices size:verticesSize indices:indices count:indicesCount];
}


@end
