//
//  EAGLView.m
//  CogEngine
//
//  Created by Minh Nguyen on 7/25/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "EAGLView.h"

#import "ES1Renderer.h"
#import "ES2Renderer.h"

@implementation EAGLView

// You must implement this method
+ (Class)layerClass
{
    return [CAEAGLLayer class];
}

//The EAGL view is stored in the nib file. When it's unarchived it's sent -initWithCoder:
- (id)initWithCoder:(NSCoder*)coder
{    
    if ((self = [super initWithCoder:coder]))
    {
        // Get the layer
        CAEAGLLayer *eaglLayer = (CAEAGLLayer *)self.layer;

        eaglLayer.opaque = TRUE;
        eaglLayer.drawableProperties = [NSDictionary dictionaryWithObjectsAndKeys:
                                        [NSNumber numberWithBool:FALSE], kEAGLDrawablePropertyRetainedBacking, kEAGLColorFormatRGBA8, kEAGLDrawablePropertyColorFormat, nil];

        renderer = [[ES2Renderer alloc] init];

        if (!renderer)
        {
            renderer = [[ES1Renderer alloc] init];

            if (!renderer)
            {
                [self release];
                return nil;
            }
        }
    }

    return self;
}

- (void)drawVertices:(cgfloat *)vertices size:(cgint)size indices:(cgushort *)indices count:(cgint)count
{
	[renderer drawVertices:vertices size:size indices:indices count:count];
}

- (void)setModelMatrix:(Matrix *)transform
{
	[renderer setModelMatrix:transform];
}

- (void)beginRender:(id)sender
{
	[renderer beginRender];
}

- (void)drawView:(id)sender
{
    [renderer render];
}

- (void)endRender:(id)sender
{
	[renderer endRender];
}

- (void)layoutSubviews
{
    [renderer resizeFromLayer:(CAEAGLLayer*)self.layer];
    [self drawView:nil];
}

- (void)dealloc
{
    [renderer release];

    [super dealloc];
}

@end
