//
//  EasyLevelFrames.m
//  pocketrocketdev
//
//  Created by Jason on 3/18/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "EasyLevelFrames.h"
#import "obstacle.h"
#import "GameConfig.h"

@implementation EasyLevelFrames

/*
 
	Creating Levels : You have 2048 amount of width to consume. Place the obstacles in respectively in each frame. 
	Coordinates : X can range from 0 (closest), to 2048. Y can range from 0 (bottom) to 320 (top).
	Planet Points : One coordinate must be 0. (100, 0), (0, 100) <-- DEPRECATED NOT ANYMORE...
 
	NOT RELEVENT	- Planet Sizes : Small = 50 x 50, Medium = 100 x 100, Large = 200 x 200 SUBJECT TO CHANGE MAKE SURE YOU UPDATE.

	Asteroid Points : Can be anything So far as I can tell now.
 
 -(void) createPlanetAt:(CGPoint)position withSize:(int)size;
 
 
*/
 
- (LevelMap*) createLevel1
{
	
	LevelMap *levelMap = [[LevelMap alloc] init];
	
	CGPoint planetPoint1 = ccp(750,320);
	CGPoint planetPoint2 = ccp(500,0);
	CGPoint planetPoint3 = ccp(1000,320);

	CGPoint asteroidPoint1 = ccp(820,33);
	CGPoint asteroidPoint2 = ccp(490,100);
	CGPoint asteroidPoint3 = ccp(1000,50);
	CGPoint asteroidPoint4 = ccp(360,90);
	CGPoint asteroidPoint5 = ccp(490,20);
	CGPoint asteroidPoint6 = ccp(1000,100);
	
	[levelMap createPlanetAt:planetPoint1 withSize:Large];
	[levelMap createPlanetAt:planetPoint2 withSize:Medium];
	[levelMap createPlanetAt:planetPoint3 withSize:Small];

	[levelMap createObstacleAt:asteroidPoint1 withSize:Large];
	[levelMap createObstacleAt:asteroidPoint2 withSize:Medium];
	[levelMap createObstacleAt:asteroidPoint3 withSize:Small];
	[levelMap createObstacleAt:asteroidPoint4 withSize:Large];
	[levelMap createObstacleAt:asteroidPoint5 withSize:Medium];
	[levelMap createObstacleAt:asteroidPoint6 withSize:Small];
	
	return levelMap;
	
}

- (LevelMap*) createLevel2
{
	
	//YOUR LEAKING MEMORY WITH LEVELMAP - make it autoRelease somehow...
	
	LevelMap *levelMap = [[LevelMap alloc] init];
	
	CGPoint planetPoint1 = ccp(590,400);
	CGPoint planetPoint2 = ccp(460,0);
	CGPoint planetPoint3 = ccp(1000,0);
	
	CGPoint asteroidPoint1 = ccp(500,50);
	CGPoint asteroidPoint2 = ccp(640,300);
	CGPoint asteroidPoint3 = ccp(1000,230);
	
	[levelMap createPlanetAt:planetPoint1 withSize:Large];
	[levelMap createPlanetAt:planetPoint2 withSize:Medium];
	[levelMap createPlanetAt:planetPoint3 withSize:Small];
	
	[levelMap createObstacleAt:asteroidPoint1 withSize:Large];
	[levelMap createObstacleAt:asteroidPoint2 withSize:Medium];
	[levelMap createObstacleAt:asteroidPoint3 withSize:Small];
	
	return levelMap;
	
}

- (LevelMap*) createLevel3
{
	
	//YOUR LEAKING MEMORY WITH LEVELMAP - make it autoRelease somehow...
	
	LevelMap *levelMap = [[LevelMap alloc] init];
	
	CGPoint planetPoint1 = ccp(790,400);
	CGPoint planetPoint2 = ccp(560,0);
	CGPoint planetPoint3 = ccp(560,320);
	
	CGPoint asteroidPoint1 = ccp(550,300);
	CGPoint asteroidPoint2 = ccp(990,220);
	CGPoint asteroidPoint3 = ccp(800,100);
	
	[levelMap createPlanetAt:planetPoint1 withSize:Large];
	[levelMap createPlanetAt:planetPoint2 withSize:Medium];
	[levelMap createPlanetAt:planetPoint3 withSize:Small];
	
	[levelMap createObstacleAt:asteroidPoint1 withSize:Large];
	[levelMap createObstacleAt:asteroidPoint2 withSize:Large];
	[levelMap createObstacleAt:asteroidPoint3 withSize:Small];
	
	return levelMap;
	
}

- (LevelMap*) createLevel4
{
	
	//YOUR LEAKING MEMORY WITH LEVELMAP - make it autoRelease somehow...
	
	LevelMap *levelMap = [[LevelMap alloc] init];
	
	CGPoint planetPoint1 = ccp(590,400);
	CGPoint planetPoint2 = ccp(460,0);
	CGPoint planetPoint3 = ccp(1000,0);
	
	CGPoint asteroidPoint1 = ccp(500,50);
	CGPoint asteroidPoint2 = ccp(640,300);
	CGPoint asteroidPoint3 = ccp(1000,230);
	
	[levelMap createPlanetAt:planetPoint1 withSize:Large];
	[levelMap createPlanetAt:planetPoint2 withSize:Medium];
	[levelMap createPlanetAt:planetPoint3 withSize:Small];
	
	[levelMap createObstacleAt:asteroidPoint1 withSize:Small];
	[levelMap createObstacleAt:asteroidPoint2 withSize:Small];
	[levelMap createObstacleAt:asteroidPoint3 withSize:Small];
	
	return levelMap;
	
}

- (LevelMap*) createLevel5
{
	
	//YOUR LEAKING MEMORY WITH LEVELMAP - make it autoRelease somehow...
	
	LevelMap *levelMap = [[LevelMap alloc] init];
	
	CGPoint planetPoint1 = ccp(590,260);
	CGPoint planetPoint2 = ccp(860,0);
	CGPoint planetPoint3 = ccp(1000,0);
	
	CGPoint asteroidPoint1 = ccp(580,100);
	CGPoint asteroidPoint2 = ccp(740,150);
	CGPoint asteroidPoint3 = ccp(1000,330);
	
	[levelMap createObstacleAt:planetPoint1 withSize:Large];
	[levelMap createObstacleAt:planetPoint2 withSize:Medium];
	[levelMap createObstacleAt:planetPoint3 withSize:Small];
	
	[levelMap createObstacleAt:asteroidPoint1 withSize:Large];
	[levelMap createObstacleAt:asteroidPoint2 withSize:Medium];
	[levelMap createObstacleAt:asteroidPoint3 withSize:Small];
	
	return levelMap;
	
}

- (LevelMap*) createLevel6
{
	
	//YOUR LEAKING MEMORY WITH LEVELMAP - make it autoRelease somehow...
	
	LevelMap *levelMap = [[LevelMap alloc] init];
	
	CGPoint planetPoint1 = ccp(480,0);
	CGPoint planetPoint2 = ccp(500,20);
	CGPoint planetPoint3 = ccp(520,40);
	CGPoint planetPoint4 = ccp(540,60);
	CGPoint planetPoint5 = ccp(560,80);
	CGPoint planetPoint6 = ccp(580,100);
	CGPoint planetPoint7 = ccp(600,120);
	CGPoint planetPoint8 = ccp(620,140);
	CGPoint planetPoint9 = ccp(640,160);
	CGPoint planetPoint10 = ccp(660,180);
	CGPoint planetPoint11 = ccp(680,200);
	CGPoint planetPoint12 = ccp(700,220);
	
	[levelMap createPlanetAt:planetPoint1 withSize:Small];
	[levelMap createPlanetAt:planetPoint2 withSize:Small];
	[levelMap createPlanetAt:planetPoint3 withSize:Small];
	[levelMap createPlanetAt:planetPoint4 withSize:Small];
	[levelMap createPlanetAt:planetPoint5 withSize:Small];
	[levelMap createPlanetAt:planetPoint6 withSize:Small];
	[levelMap createPlanetAt:planetPoint7 withSize:Small];
	[levelMap createPlanetAt:planetPoint8 withSize:Small];
	[levelMap createPlanetAt:planetPoint9 withSize:Small];
	[levelMap createPlanetAt:planetPoint10 withSize:Small];
	[levelMap createPlanetAt:planetPoint11 withSize:Small];
	[levelMap createPlanetAt:planetPoint12 withSize:Small];
		
	return levelMap;
	
}



@end
