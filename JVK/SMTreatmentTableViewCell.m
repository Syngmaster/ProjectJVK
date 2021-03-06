//
//  SMTreatmentTableViewCell.m
//  JVK
//
//  Created by Max&Viktoria on 16/02/2017.
//  Copyright © 2017 Max&Viktoria. All rights reserved.
//

#import "SMTreatmentTableViewCell.h"
#import "SMDataService.h"
#import "TreatmentMO+CoreDataClass.h"

@interface SMTreatmentTableViewCell ()

@property (strong, nonatomic) UILabel *titleLabel;

@end

@implementation SMTreatmentTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.layer.borderWidth = 5;
    self.layer.borderColor = [UIColor colorWithRed:150/255.0 green:150/255.0 blue:150/255.0 alpha:0.5].CGColor;
    
    self.customViewWithLabel.alpha = 0.3;
    
    UILabel *titleLabel = [self createLabelInView];
    [self insertSubview:titleLabel aboveSubview:self.customViewWithLabel];
    self.titleLabel = titleLabel;

}

- (UILabel *)createLabelInView {
    
    CGRect labelFrame = CGRectMake(CGRectGetMinX(self.frame),CGRectGetMinY(self.frame), CGRectGetWidth(self.frame), CGRectGetHeight(self.frame));
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:labelFrame];
    UIFont *font = [UIFont fontWithName:@"Optima" size:35];
    UIColor *textColor = [UIColor colorWithRed:0/255.0 green:176/255.0 blue:240/255.0 alpha:1.0];
    
    titleLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.font = font;
    titleLabel.textColor = textColor;

    return titleLabel;
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
      
    self.serviceImageView.frame = CGRectMake(0, 0, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds));

}

- (void)configureCell:(TreatmentMO *) model {
    
    self.serviceImageView.image = [UIImage imageWithData:model.image];
    self.titleLabel.text = model.title;
}

@end
