//
//  CALayer+animationCALayer.m
//  Kitakaze
//
//  Created by 幸 村山 on 11/11/10.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "CALayer+animationCALayer.h"

@implementation CALayer (animationCALayer)

- (void)pauseAnimation:(BOOL)aPause
{
    if (aPause) {
        CFTimeInterval pausedTime = [self convertTime:CACurrentMediaTime() fromLayer:nil];
        self.speed = 0.2f;
        self.timeOffset = pausedTime;
    } else {
        CFTimeInterval pausedTime = [self timeOffset];
        self.speed = 1.0f;
        self.timeOffset = 0.0f;
        self.beginTime = 0.0f;
        CFTimeInterval timeSincePaused = [self convertTime:CACurrentMediaTime() fromLayer:nil] - pausedTime;
        self.beginTime = timeSincePaused;
    }
}

@end
