//
//  CoreObject.m
//  CogEngine
//
//  Created by Minh Nguyen on 7/29/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "CoreObject.h"


@implementation CoreObject

@synthesize visible;

- (id)init
{
	if ((self = [super init])) {
		children = [[NSMutableArray alloc] initWithCapacity:INITIAL_CAPACITY];
		
		visible = NO;
	}
	
	return self;
}

- (void)dealloc
{
	[children release];
	
	[super dealloc];
}

- (void)addChild:(id)child
{
	if ([children containsObject:child]) {
		return;
	}
	
	[children addObject:child];
}

- (void)removeChild:(id)child
{
	[children removeObject:child];
}


- (void)visit:(SEL)action withObject:(NSObject *)object
{
	if (!visible) {
		return;
	}
	
	for (id child in children) {
		[child visit:action withObject:object];
	}
	
	if ([self respondsToSelector:action]) {
		[self performSelector:action withObject:object];
	}
}

- (void)update:(NSObject *)dt{
	NSLog(@"CoreObject Update");
}

- (void)render:(NSObject *)dt{
	NSLog(@"CoreObject Render");
}

@end
