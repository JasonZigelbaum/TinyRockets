//
//  HighScoresViewController.m
//  3dRocketProject
//
//  Created by Jason on 5/28/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "HighScoresViewController.h"
#import "cocos2d.h"
#import "TitleLayer.h"
#import "ScoreScene.h"
#import "OpenGL_Internal.h"
#import "RootViewController.h"

@implementation HighScoresViewController

@synthesize webview;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSString *address = @"http://jasonzigelbaum.com/pocketRocket/get_scores.php";
    NSURL *url = [NSURL URLWithString:address];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [self.webview loadRequest:requestObj];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(IBAction) done:(id) sender {
 
    //COME UP WITH A DONE ACTION THAT RETURNS YOU TO THE MAIN SCENE
	
}

@end
