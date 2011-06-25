//
//  Ship.h
//  pocketrocketdev
//
//  Created by Jason on 3/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface Ship : CCSprite {

	float acceleration;
	int score;
    bool keepScore;
	CCSprite *rocketAnimation;
	NSMutableArray *rocketAnimationFrames;
	
}

@property NSMutableArray* rocketAnimationFrames;
@property float acceleration;
@property int score;
@property bool keepScore;

-(id)initWithTexture:(CCTexture2D*)texture rect:(CGRect)rect;

-(void)update:(ccTime)dt;

@end
