//
//  Texture.m
//  CogEngine
//
//  Created by Minh Nguyen on 8/21/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Texture.h"

static Texture * _sharedTexture = nil;


@implementation Texture

+ (Texture *) sharedTexture{
	if (!_sharedTexture) {
		_sharedTexture = [[Texture alloc] init];
	}
	
	return _sharedTexture;
}

- (id) getTexture:(NSString *)texture{
	return nil;
}

@end
