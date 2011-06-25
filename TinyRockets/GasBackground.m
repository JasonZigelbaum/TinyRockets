//
//  GasBackground.m
//  pocketRocketVertical
//
//  Created by Jason on 3/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "GasBackground.h"


@implementation GasBackground
@synthesize acceleration;

-(id)initWithTexture:(CCTexture2D *)texture rect:(CGRect)rect
{
	if((self = [super initWithTexture:texture rect:rect]))
	{
		[self scheduleUpdate];
	}
	return self;
}

//Entire acceleration system should be replaced. 

-(void)update:(ccTime)dt
{

}


@end
