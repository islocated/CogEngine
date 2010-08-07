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
	
	GLfloat vertices[12];
	GLfloat colors[8];
}

@property (nonatomic, assign) CGRect bounds;

@end
