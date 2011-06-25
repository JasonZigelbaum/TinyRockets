//
//  obstacle.m
//  pocketrocketdev
//
//  Created by Jason on 3/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "obstacle.h"


@implementation obstacle
@synthesize size, velocity, starAnimationFrames;

-(id)initWithTexture:(CCTexture2D *)texture rect:(CGRect)rect
{
	if((self == [super initWithTexture:texture rect:rect]))
	{        
        starAnimationFrames = [[NSMutableArray alloc] init];

        //SET UP ROCKET ANIMATION
		// Create a SpriteSheet -- just a big image which is prepared to 
        // be carved up into smaller images as needed
        CCSpriteBatchNode *starSheet = [CCSpriteBatchNode batchNodeWithFile:@"starAnimation.png" capacity:50];
		
        // Add sprite sheet to parent (it won't draw anything itself, but 
        // needs to be there so that it's in the rendering pipeline)
        [self addChild:starSheet];
		
		[[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"starAnimation.plist"];
		
        // Finally, create a sprite, using the name of a frame in our frame cache.
        starAnimation = [CCSprite spriteWithSpriteFrameName:@"1.png"];
		
        // Add the sprite as a child of the sheet, so that it knows where to get its image data.
        [starSheet addChild:starAnimation];
        
        for(int i = 1; i <= 20; i++) {
            
            CCSpriteFrame *starFrame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"%d.png",i]];
            [starAnimationFrames addObject:starFrame];
        }
        
        CCAnimation *starAnim = [CCAnimation animationWithFrames:starAnimationFrames delay:0.05f];
        [starAnimation runAction:[CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation:starAnim restoreOriginalFrame:NO]]];
        
    }
	return self;
}
		
-(void)update:(ccTime)dt{
    
}

-(void)animate {
    
    //If you want to change animation at some point...

}
- (bool)collidesWith:(CCSprite *)obj
{
	// Create two rectangles with CGRectMake, using each sprite's x/y position and width/height
	CGRect ownRect = CGRectMake(self.position.x - (self.contentSize.width / 2), self.position.y - (self.contentSize.height / 2), self.contentSize.width, self.contentSize.height);
	//I think I changed this to be a triangle and I subtracted the width of the base I think (for the ship) but double-check it.
	CGRect otherRect = CGRectMake(obj.position.x - ((obj.contentSize.width / 2) - 5), obj.position.y - ((obj.contentSize.height / 2) - 5), obj.contentSize.height/2,  obj.contentSize.height/2);

	// Feed the results into CGRectIntersectsRect() which tells if the rectangles intersect (obviously)
	return CGRectIntersectsRect(ownRect, otherRect);	
}

@end
