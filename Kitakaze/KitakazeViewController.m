//
//  KitakazeViewController.m
//  Kitakaze
//
//  Created by  on 11/10/12.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "KitakazeViewController.h"
#import "PlayViewController.h"
#import "OptionViewController.h"

@implementation KitakazeViewController

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    //return (interfaceOrientation == UIInterfaceOrientationPortrait);
    return (interfaceOrientation == UIInterfaceOrientationLandscapeRight);
}

- (IBAction)showPlayView
{
    PlayViewController* controller = [[PlayViewController alloc] initWithNibName:@"PlayViewController" bundle:nil];
    controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentModalViewController:controller animated:YES];
    
    [controller release];
}

- (IBAction)showOptionView
{
    OptionViewController* controller = [[OptionViewController alloc] initWithNibName:@"OptionViewController" bundle:nil];
    controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentModalViewController:controller animated:YES];
    
    [controller release];
}

@end
