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

- (void)orthoWithLeft:(float)left right:(float)right bottom:(float)bottom top:(float)top nearZ:(float)nearZ farZ:(float)farZ
{
    float       deltaX = right - left;
    float       deltaY = top - bottom;
    float       deltaZ = farZ - nearZ;
    
	
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

- (void)perspectiveWithFOV:(float)fov aspect:(float)aspect ZNear:(float)znear ZFar:(float)zfar
{
	float tfov2 = tanf(fov * M_PI / 360.0f);
	float tfov2_asp = tfov2/aspect;
	float tfov2_inv = 1.0f/tfov2;
	float npf = znear + zfar;
	float nmf = znear - zfar;
	float nf2 = 2.0f * znear * zfar;
	
	[self zero];
	
	mat.mat[0][0] = tfov2_asp;
	mat.mat[1][1] = tfov2_inv;
	mat.mat[2][2] = npf/nmf;
	mat.mat[2][3] = -1.0f;
	mat.mat[3][2] = nf2/nmf;
}

- (void)perspectiveWithFOVY:(float)fovy aspect:(float)aspect nearZ:(float)nearZ farZ:(float)farZ
{
	GLfloat frustumW, frustumH;
	
	frustumH = tanf( fovy / 360.0f * M_PI ) * nearZ;
	frustumW = frustumH * aspect;
	
	[self frustumWithLeft:-frustumW right:frustumW bottom:-frustumH top:frustumH nearZ:nearZ farZ:farZ];
	//-frustumW, frustumW, -frustumH, frustumH, nearZ, farZ );
}

- (void)frustumWithLeft:(float)left right:(float)right bottom:(float)bottom top:(float)top nearZ:(float)nearZ farZ:(float)farZ
{
    float       deltaX = right - left;
    float       deltaY = top - bottom;
    float       deltaZ = farZ - nearZ;
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

- (void)translateWithX:(GLfloat)dx Y:(GLfloat)dy Z:(GLfloat)dz
{
	//Matrix is represented as column order, thus translation vector is like this
	mat.mat[3][0] += dx;
	mat.mat[3][1] += dy;
	mat.mat[3][2] += dz;
}

@end
