//
//  Matrix.h
//  CogEngine
//
//  Created by Minh Nguyen on 7/31/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#include "Constants.h"

typedef struct matrix {
	cgfloat mat[4][4];
} CMatrix;


@interface Matrix : NSObject {
	CMatrix mat;
}


- (void)setMatrix:(Matrix *)matrix;
- (CMatrix)getMatrix;

- (void)orthoWithLeft:(cgfloat)left right:(cgfloat)right bottom:(cgfloat)bottom top:(cgfloat)top nearZ:(cgfloat)nearZ farZ:(cgfloat)farZ;
- (void)perspectiveWithFOV:(cgfloat)fov aspect:(cgfloat)aspect ZNear:(cgfloat)znear ZFar:(cgfloat)zfar;

- (void)perspectiveWithFOVY:(cgfloat)fovy aspect:(cgfloat)aspect nearZ:(cgfloat)nearZ farZ:(cgfloat)farZ;
- (void)frustumWithLeft:(cgfloat)left right:(cgfloat)right bottom:(cgfloat)bottom top:(cgfloat)top nearZ:(cgfloat)nearZ farZ:(cgfloat)farZ;

- (void)identity;
- (void)zero;
- (void)multiply:(Matrix *)matrix;

- (void)translateWithX:(cgfloat)dx Y:(cgfloat)dy Z:(cgfloat)dz;

@end
