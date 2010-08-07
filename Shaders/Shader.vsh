//
//  Shader.vsh
//  CogEngine
//
//  Created by Minh Nguyen on 7/25/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

uniform mat4 cog_ModelViewMatrix;
uniform mat4 cog_ProjectionMatrix;

attribute vec4 position;
attribute vec4 color;

varying vec4 colorVarying;

uniform float translate;

void main()
{
    //gl_Position = position;
    //gl_Position.y += sin(translate) / 2.0;

    colorVarying = color;
	
	gl_Position = cog_ProjectionMatrix * cog_ModelViewMatrix * position;	//need model view matrix  cog_ModelViewMatrix * 
}
