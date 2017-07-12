//
//  SMTreatmentTableViewCell.h
//  JVK
//
//  Created by Max&Viktoria on 16/02/2017.
//  Copyright © 2017 Max&Viktoria. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TreatmentMO;

@interface SMTreatmentTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *serviceImageView;
@property (weak, nonatomic) IBOutlet UIView *customViewWithLabel;

- (void)configureCell:(TreatmentMO *) model;

@end
