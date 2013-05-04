//
//  RootViewController.h
//  For Lydia
//
//  Created by alden on 4/28/13.
//  Copyright (c) 2013 Alden Keefe Sampson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVAudioPlayer.h>

@interface RootViewController : UIViewController <UIPageViewControllerDelegate>

@property (strong, nonatomic) UIPageViewController *pageViewController;
@property (nonatomic, readonly) AVAudioPlayer *partyBlowerPlayer;

- (void)playPartyBlower:(NSNotification *)notification;

@end
