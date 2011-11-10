//
//  KitakazeAppDelegate.h
//  Kitakaze
//
//  Created by  on 11/10/12.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@class KitakazeViewController;

@interface KitakazeAppDelegate : NSObject <UIApplicationDelegate>

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet KitakazeViewController *viewController;

@end
