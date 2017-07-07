//
//  SMCustomTabBar.m
//  JVK
//
//  Created by Syngmaster on 06/07/2017.
//  Copyright © 2017 Max&Viktoria. All rights reserved.
//

#import "SMCustomTabBar.h"

@interface SMCustomTabBar ()


@end

@implementation SMCustomTabBar

- (void)layoutSubviews {
    [super layoutSubviews];

    self.unselectedItemTintColor = [UIColor colorWithRed:50.0/255.0 green:50.0/255.0 blue:50.0/255.0 alpha:1.0];
    
    self.tintColor = [UIColor colorWithRed:0/255.0 green:176/255.0 blue:240/255.0 alpha:1];
    
}

@end
