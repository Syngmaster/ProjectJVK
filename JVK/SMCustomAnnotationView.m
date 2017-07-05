//
//  SMCustomAnnotationView.m
//  JVK
//
//  Created by Syngmaster on 05/07/2017.
//  Copyright © 2017 Max&Viktoria. All rights reserved.
//

#import "SMCustomAnnotationView.h"

@implementation SMCustomAnnotationView

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.layer.borderWidth = 1.0;
    self.layer.borderColor = [UIColor blackColor].CGColor;
    
    self.layer.shadowColor = [UIColor colorWithRed:20.0/255.0 green:20.0/255.0 blue:20.0/255.0 alpha:0.6].CGColor;
    self.layer.shadowOpacity = 0.8;
    self.layer.shadowRadius = 2.0;
    self.layer.shadowOffset = CGSizeMake(1.0, 1.0);
    
}

@end
