//
//  Ship.m
//  pocketrocketdev
//
//  Created by Jason on 3/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Ship.h"


@implementation Ship
@synthesize acceleration, score, keepScore, rocketAnimationFrames;

-(id)initWithTexture:(CCTexture2D *)texture rect:(CGRect)rect
{
	if((self = [super initWithTexture:texture rect:rect]))
	{
		
		
		
		rocketAnimationFrames = [[NSMutableArray alloc] init];
		
		//SET UP ROCKET ANIMATION
		// Create a SpriteSheet -- just a big image which is prepared to 
        // be carved up into smaller images as needed
        CCSpriteBatchNode *rocketSheet = [CCSpriteBatchNode batchNodeWithFile:@"_rocketRepeatAnim.png" capacity:50];
		
        // Add sprite sheet to parent (it won't draw anything itself, but 
        // needs to be there so that it's in the rendering pipeline)
        [self addChild:rocketSheet];
		
		[[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"_rocketRepeatAnim.plist"];
		
        // Finally, create a sprite, using the name of a frame in our frame cache.
        rocketAnimation = [CCSprite spriteWithSpriteFrameName:@"1.png"];
		rocketAnimation.position = ccp(100,0);
		
        // Add the sprite as a child of the sheet, so that it knows where to get its image data.
        [rocketSheet addChild:rocketAnimation];
        
        for(int i = 1; i <= 40; i++) {
			
			CCSpriteFrame *rocketFrame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"%d.png",i]];
			[rocketAnimationFrames addObject:rocketFrame];
			
		}
        
		CCAnimation *rocketAnim = [CCAnimation animationWithFrames:rocketAnimationFrames delay:0.05f];
		[rocketAnimation runAction:[CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation:rocketAnim restoreOriginalFrame:NO]]];
                
		acceleration = -2.0;
		keepScore = TRUE;
        
    }
	return self;
}

-(void)update:(ccTime)dt
{	
    
}

@end
