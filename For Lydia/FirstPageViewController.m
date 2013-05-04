//
//  FirstPageViewController.m
//  For Lydia
//
//  Created by alden on 4/28/13.
//  Copyright (c) 2013 Alden Keefe Sampson. All rights reserved.
//

#import "FirstPageViewController.h"

@interface FirstPageViewController ()

@end

@implementation FirstPageViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
    // Custom initialization
  }
  return self;
}

- (void)viewDidLoad
{
  [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated
{
  [self tick];
}

- (void)viewWillDisappear:(BOOL)animated
{
  [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(tick) object:nil];
}

#pragma mark - animation

- (void)tick
{
  CGFloat hue, sat, bright, alpha, _;
  [self.view.backgroundColor getHue:&hue saturation:&sat brightness:&bright alpha:&alpha];
  //hue += 0.2;
  hue += 0.02;
  UIColor *shiftedColor = [UIColor colorWithHue:modff(hue, &_) saturation:sat brightness:bright alpha:alpha];
  self.view.backgroundColor = shiftedColor;
  hue += 0.5;
  UIColor *shiftedTextColor = [UIColor colorWithHue:modff(hue, &_) saturation:sat brightness:bright alpha:alpha];
  self.happyBirthdayLabel.textColor = shiftedTextColor;
  [self performSelector:@selector(tick) withObject:nil afterDelay:0.04];
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
  [self setHappyBirthdayLabel:nil];
  [super viewDidUnload];
}
@end
