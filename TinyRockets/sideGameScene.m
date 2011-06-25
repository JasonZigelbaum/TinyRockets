//
//  sideGameScene.m
//  pocketrocketdev
//
//  Created by Jason on 3/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "sideGameScene.h"
#import "ship.h"
#import "obstacle.h"
#import "TitleLayer.h"
#import "GameConfig.h"
#import "GasBackground.h"
#import "EasyLevelFrames.h"
#import "LevelMap.h"

@implementation sideGameScene

+(id)scene
{
	//'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	//'layer' is an autorelease object.
	sideGameScene *layer = [sideGameScene node];
	
	//add layer is a child to scene.
	[scene addChild: layer];
        
	//return the scene
	return scene;
}

-(id)init
{
	if ((self = [super init])) 
	{
		//Get window size
		CGSize windowSize = [CCDirector sharedDirector].winSize;
		
		//set layer to respond to touches!
		[self setIsTouchEnabled:TRUE];
        
        //Set up the particle emitter for the fire trail
        particleFire = [[CCParticleFire alloc] initWithTotalParticles:40];
        particleFire.texture = [[CCTextureCache sharedTextureCache] addImage:@"fireparticle.png"];
        particleFire.startSpinVar = 20.0f;
        particleFire.posVar = ccp(15.0f, 5.0f);
        particleFire.rotation = 270;
        particleFire.scale = .5;
        particleFire.anchorPoint = ccp(.5,.5);

        // Set up the ship...
		ship = [Ship spriteWithFile:@"shipAlpha.png"];
		ship.rotation = 90; 
        ship.scale = .75;
        
        currentLevel = 1;
		
        _background = [GasBackground spriteWithFile:@"nyc.jpg"];
        _background.anchorPoint = ccp(0,0);
        [self addChild:_background];
        
        //Add Fire
        
        [self addChild:particleFire];
        
		easyLevelGenerator = [[EasyLevelFrames alloc] init];
		
		ship.position = ccp(windowSize.width / 4 + 100, windowSize.height/2);
		[self addChild:ship];
		
		scoresString = [NSMutableString stringWithString:@"1"];
		
		scoresTotal = [CCLabelTTF labelWithString:scoresString fontName:@"Helvetica" fontSize:16.0];
		[scoresTotal setPosition:ccp(450, windowSize.height - 10)];
		[self addChild:scoresTotal z:1];
		
		[self scheduleUpdate];
		
        // Set up accelerometer
        self.isAccelerometerEnabled = YES;
        
        ship.anchorPoint = ccp(1,.5);
        
        CCMenuItemFont *replay = [CCMenuItemFont itemFromString:@"replay" target:self selector:@selector(resetShip)];
        
        CCMenuItemFont *backButton = [CCMenuItemFont itemFromString:@"back" target:self selector:@selector(backButtonAction)];
        
        // Create menu that contains our buttons
		CCMenu *menu = [CCMenu menuWithItems:replay, backButton, nil];
		
        [menu alignItemsVerticallyWithPadding:5.0];
        
		// Set position of menu to be below the scores
		[menu setPosition:ccp(420, windowSize.height - 50)];
		
		// Add menu to layer
		[self addChild:menu z:2];
        
        _boostGiven = FALSE;
        
        _iterator = 2;
        
		[self startLevel];
		
	}
	return self;
}

- (void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	if (ship.acceleration < 0)
	{
	
		NSArray *touchArray = [touches allObjects];
		
		if ([touchArray count] > 1)
		{
			NSLog(@"TWO TOUCHES");
		}
        
        NSLog(@"ONE TOUCH");

        _boostGiven = TRUE;
		//id boostForward = [CCMoveTo actionWithDuration:1 position:ccp(ship.position.x + 100, ship.position.y)];
        //id ease = [CCEaseExponentialIn actionWithAction:boostForward];
        //[ship runAction: ease];
		
		//ship.acceleration = 2;
	}
}

- (void)ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
	if ((ship.acceleration > 0)) 
	{
		ship.acceleration = -2;
	}
}

- (void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration {
    
    //ALWAYS allow the ship to move at 90 from 50 to 270
    
    [self moveShip:acceleration.y];

    //Going Up
    if (acceleration.y > .10) {
        // If the background is still on the stage.
        if (-35 < _background.position.y) {
            
            //Move obstacles, allow for ship rotation and move the background
            
            [self moveBackground:acceleration.y];
            
            [self rotateShip:acceleration.y rate:1 min:70 max:110];
            
            [self moveObstacles:acceleration.y];

        } else {
            
            //Return rotation to 90, don't move the background or obstacles on y axis.
            
            [self stabalizeShip];
            
            [self moveBackground:0];

            [self moveObstacles:0];
            
        }
    }
    //Going down
    else if (acceleration.y < -.10) {
        //If the background is still on the stage
        if (_background.position.y < 0) {
            //Move obstacles, allow for rotation and move the stage.

            [self moveBackground:acceleration.y];
            
            [self rotateShip:acceleration.y rate:1 min:70 max:110];
            
            [self moveObstacles:acceleration.y];
           
        } else {
            //Return ship rotation to 90, don't move obstacles or background on y axis.
            
            [self stabalizeShip];
            
            [self moveBackground:0];
            
            [self moveObstacles:0];
            
        }
        
    } else {
        //If the accelerometer is small (between .10 and -.10) don't return rotation to 90 don't move obstacles.
        //Maybe open up this window to have a small tilt large tilt gameplay dynamic. So if you rotate less you can navigate certain patterns.
                
        [self rotateShip:acceleration.y rate:.5 min:70 max:110];
        
        [self moveBackground:acceleration.y];
        //The small tilt game gives a better ratio of objects moving away from you. Be careful not to make it too large...
        [self moveObstacles:(acceleration.y * 1.25)];
        
    }
}

- (void)moveShip:(float)acceleration
{
    if (220 <= ship.position.y <= 100) {
        [ship setPosition:ccp(ship.position.x, ship.position.y + (45 * acceleration))];
    }
    
    if (ship.position.y <= 50) {
        [ship setPosition:ccp(ship.position.x, 50)];
    }
    if (ship.position.y >= 270) {
        [ship setPosition:ccp(ship.position.x, 270)];
        
    }
}

-(void)moveBackground:(float)acceleration
{
    [_background setPosition:ccp(_background.position.x - .5, _background.position.y - (10 * acceleration))];
}

-(void)moveObstacles:(float)acceleration
{
    for (obstacle *a in levelMap.obstacles)
    {
        [a setPosition:ccp(a.position.x - 10 , a.position.y - (75 *acceleration))];
    }
    
    for (obstacle *p in levelMap.planets)
    {
        [p setPosition:ccp(p.position.x - 10, p.position.y - (75 *acceleration))];
    }
}

- (void)rotateShip:(float)acceleration rate:(int)rate min:(int)min max:(int)max
{
    if (min <= ship.rotation <= max) {
        ship.rotation -= (50 * acceleration);
    }
    
    if (ship.rotation > max){
        ship.rotation = max;
    }
    
    if (ship.rotation < min) {
        ship.rotation = min;
    }
}

- (void)stabalizeShip
{
    if (ship.rotation < 90) {
        ship.rotation+=2;
    }
    if (ship.rotation > 90) {
        ship.rotation-=2;
    }
    if ((int)ship.rotation == 90 || (int)ship.rotation == 91) {
        ship.rotation = 90;
    }
}

- (void)startLevel
{
	
	//Currenty generates random number between one and ten. 
	
	int pattern = (arc4random() % 10) + 1;
	//NSLog(@"PATTERN : %d",pattern);
	switch (pattern) 
	{
		case 1:
			levelMap = [easyLevelGenerator createLevel1];
			break;
		case 2:
			levelMap = [easyLevelGenerator createLevel2];
			break;
		case 3:
			levelMap = [easyLevelGenerator createLevel3];
			break;
		case 4:
			levelMap = [easyLevelGenerator createLevel4];
			break;
		case 5:
			levelMap = [easyLevelGenerator createLevel5];
			break;
    }
	
	for (obstacle *a in levelMap.obstacles)
	{
		[self addChild:a];
		
		// Check if asteroid hits ship WILL BE USEFUL when you add deaths.
		if ([a collidesWith:ship])
		{
			[self hitDetected];
		}
	}
    
	for (obstacle *p in levelMap.planets)
	{
		[self addChild:p];
		
		// Check if asteroid hits ship WILL BE USEFUL when you add deaths.
		if ([p collidesWith:ship])
		{
			[self hitDetected];
		}
	}
}

- (void)resetShip
{
	// Reset ship position/speed
	CGSize windowSize = [CCDirector sharedDirector].winSize;
	ship.position = ccp(windowSize.width / 4, windowSize.height / 2);
	
}

// Mostly handles collision detection
- (void)update:(ccTime)dt
{
 
    particleFire.position = ccp(ship.position.x - 30, ship.position.y - 10);
    
    particleFire.rotation = (ship.rotation + 180);
    
	scoresString = [NSString stringWithFormat:@"%i", ship.score];
	[scoresTotal setString:scoresString];
	
	// If there are no more asteroids left, increment the level counter and start the new level
	if ([levelMap.obstacles count] == 0)
	{
		currentLevel++;
		[self startLevel];
	}

	// Check for collisions vs. asteroids
	for (obstacle *a in levelMap.obstacles)
	{
		
		if ([a collidesWith:ship])
		{
			[self hitDetected];
		}
		if (a.position.x <= 0)
		{
            // Need a better way to dealloc and restart the levels.
        }
        
	}	// End obstacle loop
}

-(void)hitDetected
{
	[self gameOver];
}

- (NSString*) submitScore:(NSString *) theScore username:(NSString *) username {
    
    
    NSString * udid = [[UIDevice currentDevice] uniqueIdentifier];
	NSString * secret = @"some_secret";
	username = [username stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSString *urlString = [NSString stringWithFormat:@"http://jasonzigelbaum.com/pocketRocket/put_score.php?secret=%@&udid=%@&name=%@&score=%@",secret,udid,username,theScore];
	NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:urlString]];
    NSLog(@"%@", request);
	NSError * e;
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:&e];
	return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    
}

- (void)gameOver
{
	
	// Hide ship
	ship.visible = NO;
	ship.keepScore = FALSE;
    
    [self unscheduleUpdate];
	
	// Get window size
	CGSize windowSize = [CCDirector sharedDirector].winSize;
	
	// Show "game over" text
	CCLabelTTF *title = [CCLabelTTF labelWithString:@"game over" fontName:@"Helvetica" fontSize:24.0];
	
	// Position title at center of screen
	[title setPosition:ccp(windowSize.width / 2, windowSize.height / 2)];
	
	// Add to layer
	[self addChild:title z:1];
	
	// Create button that will take us back to the title screen
	CCMenuItemFont *backButton = [CCMenuItemFont itemFromString:@"back to title" target:self selector:@selector(backButtonAction)];
	
	// Create menu that contains our button
	CCMenu *menu = [CCMenu menuWithItems:backButton, nil];
	
	// Set position of menu to be below the "game over" text
	[menu setPosition:ccp(windowSize.width / 2, title.position.y - title.contentSize.height)];
	
	// Add menu to layer
	[self addChild:menu z:2];
    
    UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"Submit your score?" message:@"Insert your name.\n\n\n" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
    
    UITextField *myTextField = [[UITextField alloc] initWithFrame:CGRectMake(22.0, 55.0, 240.0, 25.0)];
    [myTextField setBackgroundColor:[UIColor whiteColor]];
    [myTextField setUserInteractionEnabled:YES];
    
    [myAlertView addSubview:myTextField];
    [myAlertView show];
    [myAlertView release];
    [myTextField release];
    
    [self submitScore:scoresString username:@"Jason"];

}

- (void)backButtonAction
{
	NSLog(@"Switch to TitleScene");
    [[CCDirector sharedDirector] replaceScene:[TitleLayer scene]];
}

- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
    [easyLevelGenerator dealloc];
	[super dealloc];
}
@end