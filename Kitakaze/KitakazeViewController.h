//
//  KitakazeViewController.h
//  Kitakaze
//
//  Created by  on 11/10/12.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KitakazeViewController : UIViewController {
    IBOutlet UIButton* playButton_;
    IBOutlet UIButton* optionButton_;
}

- (IBAction)showPlayView;
- (IBAction)showOptionView;

@end
