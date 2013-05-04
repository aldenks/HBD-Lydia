//
//  ModelController.h
//  For Lydia
//
//  Created by alden on 4/28/13.
//  Copyright (c) 2013 Alden Keefe Sampson. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CardPageViewController;

@interface ModelController : NSObject <UIPageViewControllerDataSource>

- (UIViewController *)viewControllerAtIndex:(NSUInteger)index storyboard:(UIStoryboard *)storyboard;
- (NSUInteger)indexOfViewController:(UIViewController *)viewController storyboard:(UIStoryboard *)storyboard;

@end
