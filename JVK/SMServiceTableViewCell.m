//
//  SMServiceTableViewCell.m
//  JVK
//
//  Created by Max&Viktoria on 17/02/2017.
//  Copyright © 2017 Max&Viktoria. All rights reserved.
//

#import "SMServiceTableViewCell.h"
#import "SMServicesModel.h"

@implementation SMServiceTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)configureCell:(SMServicesModel *) model {
    
    self.nameLabel.text = model.serviceTitle;
    self.priceLabel.text = [NSString stringWithFormat:@"%@ €", model.servicePrice];
    
}


@end
