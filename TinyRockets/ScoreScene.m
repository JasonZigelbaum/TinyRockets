//
//  ScoreScene.m
//  pocketrocketdev
//
//  Created by Jason on 3/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ScoreScene.h"
#import "TitleLayer.h"
#import "ControlsScene.h"
#import "HighScoresViewController.h"
#import "OpenGL_Internal.h"

@implementation ScoreScene

+ (id)scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	// Be sure to specify the "ScoresLayer" class in "ScoresScene.m", etc.
	ScoreScene *layer = [ScoreScene node];
	
	// add layer as a child to scene
	[scene addChild:layer];
	
	// return the scene
	return scene;
}

- (id)init
{
	if ((self = [super init]))
	{
		
        HighScoresViewController * hsv = [[HighScoresViewController alloc] initWithNibName:@"HighScoresViewController" bundle:[NSBundle mainBundle]];
        [[[[CCDirector sharedDirector] openGLView] window] addSubview:hsv.view];
        [hsv release];
        
	}
	return self;
}

- (void)backButtonAction
{
	NSLog(@"Switch to TitleScene");
	[[CCDirector sharedDirector] replaceScene:[TitleLayer scene]];
}

@end
