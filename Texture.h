//
//  Texture.h
//  CogEngine
//
//  Created by Minh Nguyen on 8/21/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Texture : NSObject {

}

+ (Texture *) sharedTexture;

- (id) getTexture:(NSString *)texture;

@end
