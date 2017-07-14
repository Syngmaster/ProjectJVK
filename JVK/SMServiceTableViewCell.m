//
//  SMServiceTableViewCell.m
//  JVK
//
//  Created by Max&Viktoria on 17/02/2017.
//  Copyright © 2017 Max&Viktoria. All rights reserved.
//

#import "SMServiceTableViewCell.h"
#import "ServiceMO+CoreDataClass.h"

@implementation SMServiceTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)configureCell:(ServiceMO *) model {
    
    self.nameLabel.text = model.name;
    self.priceLabel.text = [NSString stringWithFormat:@"%@ €", model.price];
    
}


@end
