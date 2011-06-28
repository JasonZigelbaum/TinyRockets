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
    int layer;
    int row;
    bool keepScore;
    bool canMove;
	CCSprite *rocketAnimation;
	NSMutableArray *rocketAnimationFrames;
    CCParticleMeteor *fire;
	
}

@property NSMutableArray* rocketAnimationFrames;
@property float acceleration;
@property int score;
@property int layer;
@property int row;
@property bool canMove;
@property bool keepScore;

-(id)initWithTexture:(CCTexture2D*)texture rect:(CGRect)rect;

-(void)update:(ccTime)dt;

@end
