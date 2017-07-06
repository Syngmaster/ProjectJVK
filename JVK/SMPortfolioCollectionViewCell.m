//
//  SMPortfolioCollectionViewCell.m
//  JVK
//
//  Created by Max&Viktoria on 17/02/2017.
//  Copyright © 2017 Max&Viktoria. All rights reserved.
//

#import "SMPortfolioCollectionViewCell.h"
#import "SMPortfolioModel.h"

@implementation SMPortfolioCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.layer.borderWidth = 4;
    self.layer.borderColor = [UIColor colorWithRed:0.0/255.0 green:0.0/255.0 blue:0.0/255.0 alpha:1.0].CGColor;
    CGRect frame = CGRectMake(CGRectGetMinX(self.frame), CGRectGetMinY(self.frame), CGRectGetWidth(self.frame), CGRectGetHeight(self.frame));
    UIImageView *frameImageView = [[UIImageView alloc] initWithFrame:frame];
    frameImageView.image = [UIImage imageNamed:@"frame.png"];
    frameImageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.contentView insertSubview:frameImageView aboveSubview:self.portfolioImage];

}

- (void)configureCell:(SMPortfolioModel *) model {
    self.portfolioImage.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:model.imageURL]]];
}

@end
