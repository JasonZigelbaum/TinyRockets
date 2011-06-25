//
//  ControlsScene.m
//  pocketrocketdev
//
//  Created by Jason on 3/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ControlsScene.h"
#import "TitleLayer.h"

@implementation ControlsScene

+ (id)scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	// Be sure to specify the "ScoresLayer" class in "ScoresScene.m", etc.
	ControlsScene *layer = [ControlsScene node];
	
	// add layer as a child to scene
	[scene addChild:layer];
	
	// return the scene
	return scene;
}

- (id)init
{
	if ((self = [super init]))
	{
		// Goes in the init method of ControlsScene.m
		
		// Get window size
		CGSize windowSize = [CCDirector sharedDirector].winSize;
		
		// Create title label
		CCLabelTTF *title = [CCLabelTTF labelWithString:@"how to play" fontName:@"Helvetica" fontSize:32.0];
		[title setPosition:ccp(windowSize.width / 2, windowSize.height - title.contentSize.height)];
		[self addChild:title];
		
		// Create label that will display the controls - manually set the dimensions due to multi-line content
		CCLabelTTF *controlsLabel = [CCLabelTTF labelWithString:@"One finger Tap or Hold = gas\n Two finger Tap = Fire!" dimensions:CGSizeMake(windowSize.width, windowSize.height / 3) alignment:CCTextAlignmentCenter fontName:@"Courier" fontSize:16.0];
		[controlsLabel setPosition:ccp(windowSize.width / 2, windowSize.height / 2)];
		[self addChild:controlsLabel];
		
		// Create button that will take us back to the title screen
		CCMenuItemFont *backButton = [CCMenuItemFont itemFromString:@"back" target:self selector:@selector(backButtonAction)];
		
		// Create menu that contains our buttons
		CCMenu *menu = [CCMenu menuWithItems:backButton, nil];
		
		// Set position of menu to be below the scores
		[menu setPosition:ccp(windowSize.width / 2, controlsLabel.position.y - controlsLabel.contentSize.height)];
		
		// Add menu to layer
		[self addChild:menu z:2];
	}
	return self;
}

- (void)backButtonAction
{
	NSLog(@"Switch to TitleScene");
	[[CCDirector sharedDirector] replaceScene:[TitleLayer scene]];
}


@end
