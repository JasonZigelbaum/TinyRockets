//
//  HighScoresViewController.h
//  3dRocketProject
//
//  Created by Jason on 5/28/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HighScoresViewController : UIViewController {
	IBOutlet UIWebView * webview;
}

@property(nonatomic, retain) UIWebView *webview;
-(IBAction) done:(id) sender;

@end
