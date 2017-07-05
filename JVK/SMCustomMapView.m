//
//  SMCustomMapView.m
//  JVK
//
//  Created by Syngmaster on 05/07/2017.
//  Copyright © 2017 Max&Viktoria. All rights reserved.
//

#import "SMCustomMapView.h"

@implementation SMCustomMapView

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.layer.borderColor = [UIColor blackColor].CGColor;
    self.layer.borderWidth = 1.0;
    
}

@end
