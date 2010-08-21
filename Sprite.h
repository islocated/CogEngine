//
//  Sprite.h
//  CogEngine
//
//  Created by Minh Nguyen on 7/31/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CoreObject.h"

@interface Sprite : CoreObject {
	CGRect bounds;
	
	cgfloat vertices[12];
	cgushort indices[6];
	cgfloat colors[8];
	
	int indicesCount;
	int verticesSize;
	
	NSString *texture;
}

@property (nonatomic, assign) CGRect bounds;
@property (nonatomic, retain) NSString *texture;

@end
