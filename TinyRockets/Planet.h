//
//  Planet.h
//  TinyRockets
//
//  Created by Jason on 6/1/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface Planet : CCSprite {
	int size;
	CCSprite *planetAnimation;
	NSMutableArray *planetAnimationFrames;
    
}

@property int size;
@property NSMutableArray* planetAnimationFrames;

-(id)initWithTexture:(CCTexture2D *)texture rect:(CGRect)rect;
-(void)update:(ccTime)dt;
-(bool)collidesWith:(CCSprite*) obj;
-(void)animate;

@end
