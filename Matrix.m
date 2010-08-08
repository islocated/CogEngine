//
//  Matrix.m
//  CogEngine
//
//  Created by Minh Nguyen on 7/31/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Matrix.h"

@implementation Matrix

- (id)init
{
	if ((self = [super self])) {
		[self identity];
	}
	
	return self;
}

- (void)setMatrix:(Matrix *)matrix
{
	memcpy(mat.mat, [matrix getMatrix].mat, sizeof([matrix getMatrix].mat));
}

- (CMatrix)getMatrix
{
	return mat;
}

- (void)identity
{
	memset(mat.mat, 0, sizeof(mat.mat));
	
	for (int i = 0; i < 4; i++) {
		mat.mat[i][i] = 1.0f;
	}
}

- (void)zero
{
	memset(mat.mat, 0, sizeof(mat.mat));
}

- (void)orthoWithLeft:(cgfloat)left right:(cgfloat)right bottom:(cgfloat)bottom top:(cgfloat)top nearZ:(cgfloat)nearZ farZ:(cgfloat)farZ
{
    cgfloat       deltaX = right - left;
    cgfloat       deltaY = top - bottom;
    cgfloat       deltaZ = farZ - nearZ;
    
	
    if ( (deltaX == 0.0f) || (deltaY == 0.0f) || (deltaZ == 0.0f) )
        return;
	
	//ESMatrix    ortho;
	[self identity];
	
	mat.mat[0][0] = 2.0f / deltaX;
    mat.mat[3][0] = -(right + left) / deltaX;
    mat.mat[1][1] = 2.0f / deltaY;
    mat.mat[3][1] = -(top + bottom) / deltaY;
    mat.mat[2][2] = -2.0f / deltaZ;
    mat.mat[3][2] = -(nearZ + farZ) / deltaZ;
	
    //esMatrixMultiply(result, &ortho, result);
}

- (void)perspectiveWithFOV:(cgfloat)fov aspect:(cgfloat)aspect ZNear:(cgfloat)znear ZFar:(cgfloat)zfar
{
	cgfloat tfov2 = tanf(fov * M_PI / 360.0f);
	cgfloat tfov2_asp = tfov2/aspect;
	cgfloat tfov2_inv = 1.0f/tfov2;
	cgfloat npf = znear + zfar;
	cgfloat nmf = znear - zfar;
	cgfloat nf2 = 2.0f * znear * zfar;
	
	[self zero];
	
	mat.mat[0][0] = tfov2_asp;
	mat.mat[1][1] = tfov2_inv;
	mat.mat[2][2] = npf/nmf;
	mat.mat[2][3] = -1.0f;
	mat.mat[3][2] = nf2/nmf;
}

- (void)perspectiveWithFOVY:(cgfloat)fovy aspect:(cgfloat)aspect nearZ:(cgfloat)nearZ farZ:(cgfloat)farZ
{
	cgfloat frustumW, frustumH;
	
	frustumH = tanf( fovy / 360.0f * M_PI ) * nearZ;
	frustumW = frustumH * aspect;
	
	[self frustumWithLeft:-frustumW right:frustumW bottom:-frustumH top:frustumH nearZ:nearZ farZ:farZ];
}

- (void)frustumWithLeft:(cgfloat)left right:(cgfloat)right bottom:(cgfloat)bottom top:(cgfloat)top nearZ:(cgfloat)nearZ farZ:(cgfloat)farZ
{
    cgfloat       deltaX = right - left;
    cgfloat       deltaY = top - bottom;
    cgfloat       deltaZ = farZ - nearZ;
    //ESMatrix    frust;
	
    if ( (nearZ <= 0.0f) || (farZ <= 0.0f) ||
		(deltaX <= 0.0f) || (deltaY <= 0.0f) || (deltaZ <= 0.0f) )
		return;
	
	[self zero];
	
    mat.mat[0][0] = 2.0f * nearZ / deltaX;
    //frust.m[0][1] = frust.m[0][2] = frust.m[0][3] = 0.0f;
	
    mat.mat[1][1] = 2.0f * nearZ / deltaY;
    //frust.m[1][0] = frust.m[1][2] = frust.m[1][3] = 0.0f;
	
    mat.mat[2][0] = (right + left) / deltaX;
    mat.mat[2][1] = (top + bottom) / deltaY;
    mat.mat[2][2] = -(nearZ + farZ) / deltaZ;
    mat.mat[2][3] = -1.0f;
	
    mat.mat[3][2] = -2.0f * nearZ * farZ / deltaZ;
    //frust.m[3][0] = frust.m[3][1] = frust.m[3][3] = 0.0f;
	
    //esMatrixMultiply(result, &frust, result);
}

- (void)multiply:(Matrix *)matrix
{
	Matrix * result = [[Matrix alloc] init];
	[result zero];
	
	for (int i = 0; i < 4; i++) {
		for (int j = 0; j < 4; j++) {
			for (int k = 0; k < 4; k++) {
				[result getMatrix].mat[i][j] += mat.mat[i][k] * [matrix getMatrix].mat[j][k];
			}
		}
	}

	[self setMatrix:result];
	[result release];
}

- (void)translateWithX:(cgfloat)dx Y:(cgfloat)dy Z:(cgfloat)dz
{
	//Matrix is represented as column order, thus translation vector is like this
	mat.mat[3][0] += dx;
	mat.mat[3][1] += dy;
	mat.mat[3][2] += dz;
}

@end
