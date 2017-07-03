//
//  ServicesTableViewCell.m
//  JVK
//
//  Created by Max&Viktoria on 16/02/2017.
//  Copyright © 2017 Max&Viktoria. All rights reserved.
//

#import "ServicesTableViewCell.h"

@implementation ServicesTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.layer.borderWidth = 5;
    self.layer.borderColor = [UIColor colorWithRed:150/255.0 green:150/255.0 blue:150/255.0 alpha:0.5].CGColor;
    
    self.customViewWithLabel.alpha = 0.3;
    
    [self addSubview:[self createLabelInView:self.customViewWithLabel]];

}

- (UIView *)createLabelInView:(UIView *)view {
    
    CGRect labelFrame = CGRectMake(CGRectGetMinX(view.frame),CGRectGetMinY(view.frame), CGRectGetWidth(view.frame), CGRectGetHeight(view.frame));
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:labelFrame];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.text = @"Hello!";
    
    UIFont *font = [UIFont fontWithName:@"Optima" size:35];
    UIColor *textColor = [UIColor colorWithRed:0/255.0 green:176/255.0 blue:240/255.0 alpha:1.0];
    NSDictionary *attributes = @{NSForegroundColorAttributeName : textColor, NSFontAttributeName : font};
    NSAttributedString *attrString = [[NSAttributedString alloc] initWithString:titleLabel.text attributes:attributes];
    [titleLabel setAttributedText:attrString];
    
    return titleLabel;
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    self.serviceImageView.frame = CGRectMake(0, 0, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds));
    
}

@end
