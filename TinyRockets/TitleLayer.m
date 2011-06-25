//
//  TitleLayer.m
//  pocketrocketdev
//
//  Created by Jason on 3/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TitleLayer.h"
#import "ControlsScene.h"
#import "ScoreScene.h"
#import "sideGameScene.h"

@implementation TitleLayer

+ (id)scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	// Be sure to specify the "ScoresLayer" class in "ScoresScene.m", etc.
	TitleLayer *layer = [TitleLayer node];
	
	// add layer as a child to scene
	[scene addChild:layer];
	
	// return the scene
	return scene;
}

- (id)init
{
	if ((self = [super init]))
	{
		// Get window size
		CGSize windowSize = [CCDirector sharedDirector].winSize;
		
		// Create text label for title of game - "@stroids" - don't sue me Atari!
		CCLabelTTF *title = [CCLabelTTF labelWithString:@"Pocket Rockets!" fontName:@"Helvetica" fontSize:54.0];
		
		// Position title at center of screen
		[title setPosition:ccp(windowSize.width / 2, windowSize.height / 2)];
		
		// Add to layer
		[self addChild:title z:1];
		
		// Set the default CCMenuItemFont font
		[CCMenuItemFont setFontName:@"Courier"];
		
		// Create "play," "scores," and "controls" buttons - when tapped, they call methods we define: playButtonAction and scoresButtonAction
		CCMenuItemFont *playButton = [CCMenuItemFont itemFromString:@"play" target:self selector:@selector(playButtonAction)];
		CCMenuItemFont *scoresButton = [CCMenuItemFont itemFromString:@"scores" target:self selector:@selector(scoresButtonAction)];
		CCMenuItemFont *controlsButton = [CCMenuItemFont itemFromString:@"controls" target:self selector:@selector(controlsButtonAction)];
		
		// Create menu that contains our buttons
		CCMenu *menu = [CCMenu menuWithItems:playButton, scoresButton, controlsButton, nil];
		
		// Align buttons horizontally
		[menu alignItemsHorizontallyWithPadding:20.0];
		
		// Set position of menu to be below the title text
		[menu setPosition:ccp(windowSize.width / 2, title.position.y - title.contentSize.height / 1.5)];
		
		// Add menu to layer
		[self addChild:menu z:2];
		
		NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
		
		// Register default high scores - this could be more easily done by loading a .plist instead of manually creating this nested object
		NSDictionary *defaultDefaults = [NSDictionary dictionaryWithObject:[NSArray arrayWithObjects:[NSNumber numberWithInt:0], [NSNumber numberWithInt:0], [NSNumber numberWithInt:0], [NSNumber numberWithInt:0], [NSNumber numberWithInt:0], nil] forKey:@"scores"];
		
		[defaults registerDefaults:defaultDefaults];
		[defaults synchronize];
		
		
	}
	return self;
}

- (void)playButtonAction
{
	NSLog(@"Switch to GameScene");
	[[CCDirector sharedDirector] replaceScene:[sideGameScene scene]];
}

- (void)scoresButtonAction
{
	NSLog(@"Switch to ScoresScene");
	[[CCDirector sharedDirector] replaceScene:[ScoreScene scene]];
}

- (void)controlsButtonAction
{
	NSLog(@"Switch to ControlsScene");
	[[CCDirector sharedDirector] replaceScene:[ControlsScene scene]];
}


@end
