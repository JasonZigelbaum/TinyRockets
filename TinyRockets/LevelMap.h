//
//  LevelMap.h
//  pocketrocketdev
//
//  Created by Jason on 3/18/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface LevelMap : NSObject {

	NSMutableArray *planets;
	NSMutableArray *obstacles;
	
}

@property(retain) NSMutableArray *planets;
@property(retain) NSMutableArray *obstacles;

-(id)init;
-(void)dealloc;
-(void) createPlanetAt:(CGPoint)position withSize:(int)size;
-(void) createObstacleAt:(CGPoint)position withSize:(int)size;

@end
