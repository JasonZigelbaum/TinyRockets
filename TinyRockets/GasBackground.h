//
//  GasBackground.h
//  pocketRocketVertical
//
//  Created by Jason on 3/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface GasBackground : CCSprite {
	float acceleration;

}

@property float acceleration;

-(id)initWithTexture:(CCTexture2D*)texture rect:(CGRect)rect;

-(void)update:(ccTime)dt;

@end
