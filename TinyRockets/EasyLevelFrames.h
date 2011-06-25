//
//  EasyLevelFrames.h
//  pocketrocketdev
//
//  Created by Jason on 3/18/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "obstacle.h"
#import "LevelMap.h"

@interface EasyLevelFrames : NSObject {
	
}

-(LevelMap*) createLevel1;
-(LevelMap*) createLevel2;
-(LevelMap*) createLevel3;
-(LevelMap*) createLevel4;
-(LevelMap*) createLevel5;
-(LevelMap*) createLevel6;
@end
