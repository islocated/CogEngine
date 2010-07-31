//
//  Scene.m
//  CogEngine
//
//  Created by Minh Nguyen on 7/26/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Scene.h"


@implementation Scene

- (id)init
{
	if ((self = [super init])) {
		visible = YES;
	}
	
	return self;
}

- (void)update:(NSObject *)dt{
	NSLog(@"Scene Update");
}

- (void)render:(NSObject *)dt{
	NSLog(@"Scene Render");
}

@end
