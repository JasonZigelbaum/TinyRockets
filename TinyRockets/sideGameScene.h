//
//  sideGameScene.h
//  pocketrocketdev
//
//  Created by Jason on 3/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Ship.h"
#import "GasBackground.h"
#import "EasyLevelFrames.h"
#import "LevelMap.h"

@interface sideGameScene : CCLayer {
	Ship *ship;
	GasBackground *_background;
	EasyLevelFrames *easyLevelGenerator;
	LevelMap *levelMap;
    CCMotionStreak *motionStreak;
	CCLabelTTF *scoresTotal;
    int _iterator;
    float _totalAcceleration;
	NSMutableString *scoresString;
	int currentLevel;
	int score;
    bool _boostGiven;
    CCParticleFire *particleFire;
    
}

+(id)scene;
-(void)startLevel;
-(void)resetShip;
-(void)hitDetected;
-(void)gameOver;
-(void)moveShip:(float)acceleration;
-(void)moveBackground:(float)acceleration;
-(void)moveObstacles:(float)acceleration;
-(void)rotateShip:(float)acceleration rate:(int)rate min:(int)min max:(int)max;
-(void)stabalizeShip;

-(NSString*) submitScore:(NSString *) theScore username:(NSString *) username;

@end
