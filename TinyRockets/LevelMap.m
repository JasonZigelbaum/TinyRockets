//
//  LevelMap.m
//  pocketrocketdev
//
//  Created by Jason on 3/18/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "LevelMap.h"
#import "obstacle.h"
#import "Planet.h"
#import "GameConfig.h"

@implementation LevelMap
@synthesize planets, obstacles;

-(id)init
{
	if ((self = [super init])) 
	{
		planets = [[NSMutableArray alloc] init];
		obstacles = [[NSMutableArray alloc] init];
	}
	return self;
}

- (void) createObstacleAt:(CGPoint)position withSize:(int)size
{

    //UNDERSTAND the obstacles and how you are implementing them... make it more simple if possible.
	
	obstacle *a = [obstacle spriteWithFile:@"shipAlpha.png"];
	
    switch (size) 
	{
		case Large:
            a.scale = .75;
            break;
		case Medium:
			a.scale = .5;
			break;
		case Small:
			a.scale = .25;
			break;
	}
    
	a.size = size;
	a.position = position;
	
	[self.obstacles addObject:a];

}

- (void) createPlanetAt:(CGPoint)position withSize:(int)size
{
    	
    Planet *p = [Planet spriteWithFile:@"shipAlpha.png"];

    switch (size) 
	{
		case Large:
            p.scale = 1;
            break;
		case Medium:
            p.scale = .75;
			break;
		case Small:
            p.scale = .5;
			break;
	}
		
	p.size = size;
	p.position = position;
	
	[self.planets addObject:p];
    
}


- (void) dealloc
{
	[obstacles release];
	[planets release];
	[super dealloc];
}

@end
