//
//  RainyCloud.m
//  Kitakaze
//
//  Created by  on 11/10/13.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "RainyCloud.h"

@implementation RainyCloud

- (void)initialize
{
    type_ = Rainy;
    firstDrag_ = YES;
}

- (id)init
{
    self = [super init];
    if (self) {
        [self initialize];
    }
    
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initialize];
    }
    return self;    
}

- (id)initWithImage:(UIImage *)image {
    self = [super initWithImage:image];
    if (self) {
        [self initialize];
    }
    return self;
}

- (void)attack
{
    
}

@end
