//
//  SMPortfolioCollectionViewCell.h
//  JVK
//
//  Created by Max&Viktoria on 17/02/2017.
//  Copyright © 2017 Max&Viktoria. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SMPortfolioModel;

@interface SMPortfolioCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *portfolioImage;

- (void)configureCell:(SMPortfolioModel *) model;

@end
