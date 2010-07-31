//
//  CoreObject.h
//  CogEngine
//
//  Created by Minh Nguyen on 7/29/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#define INITIAL_CAPACITY 10

@interface CoreObject : NSObject {
	NSMutableArray * children;
	
	BOOL visible;
}

- (void)addChild:(id)child;
- (void)removeChild:(id)child;

- (void)update:(NSObject *)dt;
- (void)render:(NSObject *)dt;

- (void)visit:(SEL)action withObject:(NSObject *)object;

@property (assign) BOOL visible;

@end
