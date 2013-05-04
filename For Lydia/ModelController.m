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
    NSArray *storyboard_idents = @[@"p0", @"p1", @"p2"];
    for (NSString *ident in storyboard_idents) {
      CardPageViewController *vc = [storyboard instantiateViewControllerWithIdentifier:ident];
      [self.pages addObject:vc];
    }
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