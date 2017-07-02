//
//  SMCustomImageView.m
//  JVK
//
//  Created by Max&Viktoria on 01/03/2017.
//  Copyright © 2017 Max&Viktoria. All rights reserved.
//

#import "SMCustomImageView.h"

@implementation SMCustomImageView

- (void)awakeFromNib {
    
    [super awakeFromNib];
    
    self.layer.borderColor = [UIColor whiteColor].CGColor;
    self.layer.borderWidth = 5;
    
}

@end
