//
//  PlayViewController.m
//  Kitakaze
//
//  Created by  on 11/10/12.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "PlayViewController.h"
#import "Cloud.h"
#import "WindyCloud.h"
#import "RainyCloud.h"
#import "ThunderCloud.h"
#import "CALayer+animationCALayer.h"

@interface PlayViewController (PrivateMethods)
- (void)setInstance;
- (void)initialize;
- (void)uninitialize;
- (void)setBaseImage;
- (void)createClouds:(int)windy rainy:(int)rainy thunder:(int)thunder;

- (void)teemoWalking;
- (void)cloudAnimation;
@end

@implementation PlayViewController

@synthesize scrollView_;

static id playViewController_ = nil;

+ (id)sharedObject
{
    return playViewController_;
}

- (void)setInstance
{
    if (playViewController_) {
        [playViewController_ release], playViewController_ = nil;
    }
    playViewController_ = self;
}

- (id)init
{
    self = [super init];
    if (self) {
        // Custom initialization
        [self setInstance];
    }
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        [self setInstance];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        // Custom initialization
        [self setInstance];
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewWillAppear:(BOOL)animated
{
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setBaseImage];
    [self initialize];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    [self uninitialize];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    //return (interfaceOrientation == UIInterfaceOrientationPortrait);
    return (interfaceOrientation == UIInterfaceOrientationLandscapeRight);
}

- (void)createClouds:(int)windy rainy:(int)rainy thunder:(int)thunder
{
    CGRect cloudRect;
    Cloud* cloud;
    
    for (int i = 0; i < windy; i++) {
        cloudRect = CGRectMake(0.0, 0.0, 64.0, 64.0);
        cloudRect.origin = CGPointMake(286.0f, 256.0f);
        cloud = [[WindyCloud alloc] initWithFrame:cloudRect];
        [cloud setUserInteractionEnabled:YES];
        [cloud setImage:[UIImage imageNamed:@"cloud_1.png"]];
        [self.view addSubview:cloud];
        [cloudsList_ addObject:cloud];
    }
    
    for (int i = 0; i < rainy; i++) {
        cloudRect.origin = CGPointMake(350.0f, 256.0f);
        cloud = [[RainyCloud alloc] initWithFrame:cloudRect];
        [cloud setUserInteractionEnabled:YES];
        [cloud setImage:[UIImage imageNamed:@"cloud_2.png"]];
        [self.view addSubview:cloud];
        [cloudsList_ addObject:cloud];
    }
    
    for (int i = 0; i < thunder; i++) {
        cloudRect.origin = CGPointMake(414.0f, 256.0f);
        cloud = [[ThunderCloud alloc] initWithFrame:cloudRect];
        [cloud setUserInteractionEnabled:YES];
        [cloud setImage:[UIImage imageNamed:@"cloud_3.png"]];
        [self.view addSubview:cloud];
        [cloudsList_ addObject:cloud];
    }
}

- (void)initialize
{
    isPause_ = YES;
    life_ = 3;
    score_ = 0;
    
    cloudsList_ = [[NSMutableArray alloc] init];
    
    [self createClouds:3 rainy:3 thunder:1];
}

- (void)uninitialize
{
    [cloudsList_ removeAllObjects];
    [cloudsList_ release];
}

- (void)setBaseImage
{
    scrollView_.frame = self.view.bounds;
    scrollView_.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    scrollView_.showsHorizontalScrollIndicator = NO;
    scrollView_.scrollsToTop = NO;
    
    UIImageView* imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"playview.png"]];
    [scrollView_ addSubview:imageView];
    scrollView_.delegate = self;
    scrollView_.bounces = NO;
    scrollView_.contentSize = imageView.bounds.size;    
    [imageView release];
    
    [self.view addSubview:scrollView_];
    [self.view bringSubviewToFront:statusView_];
    [self.view bringSubviewToFront:pauseButtonView_];
}

- (void)addCloudToMainView:(Cloud*)cloud
{
    /*
    if ([cloud superview] != self.view) {
        [cloud removeFromSuperview];
        [self.view addSubview:cloud];
    }
     */
    scrollView_.scrollEnabled = NO;
}

- (void)addCloudToScrollView:(Cloud*)cloud
{
    if ([cloud superview] != scrollView_) {
        [cloud removeFromSuperview];
        [scrollView_ addSubview:cloud];
    }
    scrollView_.scrollEnabled = YES;
}

- (void)teemoWalking
{
    NSArray* imageArray = [[NSArray alloc] initWithObjects:
                           [UIImage imageNamed:@"teemo01.png"],
                           [UIImage imageNamed:@"teemo02.png"],
                           nil];
    UIImageView* animationView = [[UIImageView alloc] initWithFrame:CGRectMake(-64, 195, 64, 64)];
    animationView.animationImages = imageArray;
    animationView.animationDuration = 0.7f;
    [scrollView_ addSubview:animationView];
    [animationView startAnimating];
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:10.0];
    [UIView setAnimationDelay:0.0];
    [UIView setAnimationRepeatCount:1.0];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];  // アニメーションは一定速度    
    CGAffineTransform translation = CGAffineTransformMakeTranslation(1024, 0);
    [animationView setTransform:translation];
    [UIView commitAnimations];
    
    [animationView release];
    [imageArray release];
}

/*
- (void)personAnimation
{
    UIImage* personImage = [UIImage imageNamed:@"person.png"];
    UIImageView* personImageView = [[UIImageView alloc] initWithImage:personImage];
    [scrollView_ addSubview:personImageView];
    personImageView.frame = CGRectMake(0, 0, 64, 64);
    personImageView.center = CGPointMake(-32, 224);
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:5.0];
    [UIView setAnimationDelay:3.0];
    [UIView setAnimationRepeatCount:5.0];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];  // アニメーションは一定速度
    //personImageView.center = CGPointMake(480, 192);
    
    CGAffineTransform translation = CGAffineTransformMakeTranslation(480, 0);
    [personImageView setTransform:translation];
    
    [UIView commitAnimations];  // アニメーション開始
}
*/

- (void)cloudAnimation
{
}

- (IBAction)showTitleView
{
    [self dismissModalViewControllerAnimated:YES];
}

- (IBAction)pause
{
    if (!isPause_) {
        isPause_ = YES;
        [pauseButton_ setImage:[UIImage imageNamed:@"play.png"] forState:UIControlStateNormal];
        //[scrollView_.layer pauseAnimation:YES];
    } else {
        isPause_ = NO;
        [pauseButton_ setImage:[UIImage imageNamed:@"pause.png"] forState:UIControlStateNormal];
        [self teemoWalking];
        NSLog(@"teemo!");
    }
}



@end
