//
//  Matrix.h
//  CogEngine
//
//  Created by Minh Nguyen on 7/31/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <OpenGLES/ES2/gl.h>
#import <OpenGLES/ES2/glext.h>


typedef struct matrix {
	GLfloat mat[4][4];
} CMatrix;


@interface Matrix : NSObject {
	CMatrix mat;
}


- (void)setMatrix:(Matrix *)matrix;
- (CMatrix)getMatrix;


- (void)orthoWithLeft:(float)left right:(float)right bottom:(float)bottom top:(float)top nearZ:(float)nearZ farZ:(float)farZ;
- (void)perspectiveWithFOV:(float)fov aspect:(float)aspect ZNear:(float)znear ZFar:(float)zfar;


- (void)perspectiveWithFOVY:(float)fovy aspect:(float)aspect nearZ:(float)nearZ farZ:(float)farZ;
- (void)frustumWithLeft:(float)left right:(float)right bottom:(float)bottom top:(float)top nearZ:(float)nearZ farZ:(float)farZ;

- (void)identity;
- (void)zero;
- (void)multiply:(Matrix *)matrix;

- (void)translateWithX:(GLfloat)dx Y:(GLfloat)dy Z:(GLfloat)dz;

@end
