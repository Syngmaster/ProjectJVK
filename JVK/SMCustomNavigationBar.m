//
//  SMCustomNavigationBar.m
//  JVK
//
//  Created by Max&Viktoria on 01/03/2017.
//  Copyright © 2017 Max&Viktoria. All rights reserved.
//

#import "SMCustomNavigationBar.h"

@implementation SMCustomNavigationBar

- (void)awakeFromNib {
    [super awakeFromNib];
    
    UIImage *backBtn = [UIImage imageNamed:@"arrow1.png"];
    backBtn = [backBtn imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.backIndicatorImage = backBtn;
    self.backIndicatorTransitionMaskImage = backBtn;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CAGradientLayer *gradient = [CAGradientLayer layer];
    
    gradient.frame = CGRectMake(0, 0, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds) + CGRectGetHeight([UIApplication sharedApplication].statusBarFrame));
    gradient.colors = @[(__bridge id)[UIColor colorWithRed:220.0/255.0 green:220.0/255.0 blue:220.0/255.0 alpha:1.0].CGColor, (__bridge id)[UIColor whiteColor].CGColor];
    gradient.startPoint = CGPointMake(0.0, 0.5);
    gradient.endPoint = CGPointMake(0.5, 0.5);
    
    UIGraphicsBeginImageContext(gradient.bounds.size);
    [gradient renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *gradientImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    [self setBackgroundImage:gradientImage forBarMetrics:UIBarMetricsDefault];
    
}


@end
