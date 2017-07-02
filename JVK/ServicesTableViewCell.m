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
    
     /*CALayer *layer = [CALayer layer];
     layer.frame = CGRectMake(0,
                              0,
                              self.label.bounds.size.width,
                              self.label.bounds.size.height);
    
     layer.backgroundColor = [UIColor whiteColor].CGColor;
     layer.opacity = 1.0;
     [self.layer insertSublayer:layer atIndex:1];*/
    
    self.label.font = [UIFont fontWithName:@"Optima" size:35];
    self.label.textColor = [UIColor colorWithRed:0/255.0 green:176/255.0 blue:240/255.0 alpha:1.0];
    //self.label.shadowColor = [UIColor whiteColor];
    //self.label.shadowOffset = CGSizeMake(0, -1.0);
    self.background.backgroundColor = [UIColor whiteColor];
    self.background.layer.opacity = 0.3;

}

-(void) layoutSubviews {
    
    [super layoutSubviews];
    self.image.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
    
}

@end
