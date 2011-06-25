//
//  obstacle.h
//  pocketrocketdev
//
//  Created by Jason on 3/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface obstacle : CCSprite {
	int size;
	float velocity;
    CCSprite *starAnimation;
	NSMutableArray *starAnimationFrames;

}

@property int size;
@property float velocity;
@property NSMutableArray* starAnimationFrames;

-(id)initWithTexture:(CCTexture2D *)texture rect:(CGRect)rect;
-(void)update:(ccTime)dt;
-(bool)collidesWith:(CCSprite*) obj;
-(void)animate;

@end
