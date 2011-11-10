//
//  Cloud.m
//  Kitakaze
//
//  Created by  on 11/10/13.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Cloud.h"
#include "PlayViewController.h"

@implementation Cloud

@synthesize startPos_;

- (id)init
{
    self = [super init];
    if (self) {
//        type_ = Windy;
        firstDrag_ = YES;
    }
    
    return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    startPos_ = [[touches anyObject] locationInView:self];
    [[self superview] bringSubviewToFront:self];
    
    PlayViewController* playViewController = [PlayViewController sharedObject];
    [playViewController addCloudToMainView:self];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    CGPoint pos = [[touches anyObject] locationInView:self];
    CGRect frame = [self frame];
    frame.origin.x += pos.x - startPos_.x;
    frame.origin.y += pos.y - startPos_.y;
    [self setFrame:frame];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{    
    PlayViewController* playViewController = [PlayViewController sharedObject];
    [playViewController addCloudToScrollView:self];
    
    if (firstDrag_) {
        CGRect frame = [self frame];
        frame.origin.x += playViewController.scrollView_.contentOffset.x;
        frame.origin.y += playViewController.scrollView_.contentOffset.y;
        [self setFrame:frame];

        firstDrag_ = NO;
    }
}

- (void)attack
{
    // サブクラスごとに実装
}

@end
