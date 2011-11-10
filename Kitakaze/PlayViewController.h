//
//  PlayViewController.h
//  Kitakaze
//
//  Created by  on 11/10/12.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Cloud;

@interface PlayViewController : UIViewController<UIScrollViewDelegate> {
    
    // ベースのスクロールビュー
    IBOutlet UIScrollView* scrollView_;
    
    // ステータスバー
    IBOutlet UIView* statusView_;
    
    // ポーズボタン
    IBOutlet UIView* pauseButtonView_;
    IBOutlet UIButton* pauseButton_;
    
    IBOutlet UIButton* menuButton_;    
    NSMutableArray* cloudsList_;
    
    BOOL isPause_;
    int life_;
    int score_;
}

@property (nonatomic, readonly) UIScrollView* scrollView_;

+ (id)sharedObject;
- (void)addCloudToMainView:(Cloud*)cloud;
- (void)addCloudToScrollView:(Cloud*)cloud;

- (IBAction)showTitleView;
- (IBAction)pause;

@end
