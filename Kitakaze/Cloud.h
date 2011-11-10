//
//  Cloud.h
//  Kitakaze
//
//  Created by  on 11/10/13.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    Windy,
    Rainy,
    Thunder,
} CloudType;

@interface Cloud : UIImageView {
    CloudType type_;
    BOOL firstDrag_;
    
@public
    CGPoint startPos_;
}

@property (assign) CGPoint startPos_;

- (void)attack;

@end
