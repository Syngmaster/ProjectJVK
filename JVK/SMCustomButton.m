//
//  SMCustomButton.m
//  JVK
//
//  Created by Syngmaster on 15/02/2017.
//  Copyright © 2017 Syngmaster. All rights reserved.
//

#import "SMCustomButton.h"

@implementation SMCustomButton


- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    self.layer.cornerRadius = CGRectGetHeight(self.bounds)/2;
    self.layer.borderColor = [UIColor blackColor].CGColor;
    self.layer.borderWidth = 1.0;
    
    self.layer.shadowColor = [UIColor blackColor].CGColor;
    self.layer.shadowOffset = CGSizeMake(1.5, 1.5);
    self.layer.shadowOpacity = 1.0;
    self.layer.shadowRadius = 0.2;
    
    UIFont *font = [UIFont fontWithName:@"Optima" size:25];
    UIColor *textColor = [UIColor colorWithRed:0/255.0 green:176/255.0 blue:240/255.0 alpha:1.0];
    NSDictionary *attributes = @{NSForegroundColorAttributeName : textColor, NSFontAttributeName : font};
    NSAttributedString *attrString = [[NSAttributedString alloc] initWithString:self.titleLabel.text attributes:attributes];
    
    [self setAttributedTitle:attrString forState:UIControlStateNormal];
    
    [self setGragient];
    
}

- (void)setGragient {
    
    CAGradientLayer *gradient = [CAGradientLayer layer];
    
    gradient.frame = CGRectMake(0, 0, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds));
    gradient.startPoint = CGPointMake(0.5, 0.5);
    gradient.endPoint = CGPointMake(0.0, 0.5);
    gradient.colors = [NSArray arrayWithObjects:(id)[UIColor whiteColor].CGColor,(id)[UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1.0].CGColor, nil];
    gradient.cornerRadius = self.layer.cornerRadius;
    
    [self.layer insertSublayer:gradient atIndex:0];
}





@end
