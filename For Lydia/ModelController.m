//
//  ModelController.m
//  For Lydia
//
//  Created by alden on 4/28/13.
//  Copyright (c) 2013 Alden Keefe Sampson. All rights reserved.
//

#import "ModelController.h"

#import "FirstPageViewController.h"
#import "CardPageViewController.h"

/*
 A controller object that manages a simple model -- a collection of month names.
 
 The controller serves as the data source for the page view controller; it therefore implements pageViewController:viewControllerBeforeViewController: and pageViewController:viewControllerAfterViewController:.
 It also implements a custom method, viewControllerAtIndex: which is useful in the implementation of the data source methods, and in the initial configuration of the application.
 
 There is no need to actually create view controllers for each page in advance -- indeed doing so incurs unnecessary overhead. Given the data model, these methods create, configure, and return a new view controller on demand.
 */

@interface ModelController()
@property (readonly, nonatomic) NSMutableArray *pages;
@end

@implementation ModelController

- (id)init
{
  self = [super init];
  if (self) {
    // Create the data model.
    _pages = [NSMutableArray array];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard"
                                                         bundle:[NSBundle mainBundle]];
    NSArray *storyboard_idents = @[@"p0", @"p1"];
    for (NSString *ident in storyboard_idents) {
      CardPageViewController *vc = [storyboard instantiateViewControllerWithIdentifier:ident];
      [self.pages addObject:vc];
    }
    NSLog(@"Pages: %@", self.pages);
  }
  return self;
}

- (UIViewController *)viewControllerAtIndex:(NSUInteger)i storyboard:(UIStoryboard *)storyboard
{
  if (([self.pages count] == 0) || (i >= [self.pages count])) {
    return nil;
  }
  return self.pages[i];
}

- (NSUInteger)indexOfViewController:(UIViewController *)viewController storyboard:(UIStoryboard *)storyboard
{
  return [self.pages indexOfObject:viewController];
}

#pragma mark - Page View Controller Data Source

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger index = [self indexOfViewController:viewController storyboard:viewController.storyboard];
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    index--;
    return [self viewControllerAtIndex:index storyboard:viewController.storyboard];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index = [self indexOfViewController:viewController storyboard:viewController.storyboard];
    if (index == NSNotFound) {
        return nil;
    }
    
    index++;
    if (index == [self.pages count]) {
        return nil;
    }
    return [self viewControllerAtIndex:index storyboard:viewController.storyboard];
}

@end