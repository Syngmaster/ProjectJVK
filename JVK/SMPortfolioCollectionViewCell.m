//
//  SMPortfolioCollectionViewCell.m
//  JVK
//
//  Created by Max&Viktoria on 17/02/2017.
//  Copyright © 2017 Max&Viktoria. All rights reserved.
//

#import "SMPortfolioCollectionViewCell.h"
#import "SMPortfolioModel.h"
#import "UIImageView+AFNetworking.h"

@implementation SMPortfolioCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.layer.borderWidth = 8;
    self.layer.borderColor = [UIColor colorWithRed:90.0/255.0 green:90.0/255.0 blue:90.0/255.0 alpha:0.5].CGColor;
    CGRect frame = CGRectMake(CGRectGetMinX(self.frame), CGRectGetMinY(self.frame), CGRectGetWidth(self.frame), CGRectGetHeight(self.frame));
    UIImageView *frameImageView = [[UIImageView alloc] initWithFrame:frame];
    frameImageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.contentView insertSubview:frameImageView aboveSubview:self.portfolioImage];

}

- (void)configureCell:(SMPortfolioModel *) model {
    
    [self.portfolioImage setImageWithURL:[NSURL URLWithString:model.imageURL] placeholderImage:nil];

}

@end
