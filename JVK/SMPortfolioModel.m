//
//  SMPortfolioModel.m
//  JVK
//
//  Created by Syngmaster on 06/07/2017.
//  Copyright © 2017 Max&Viktoria. All rights reserved.
//

#import "SMPortfolioModel.h"

@implementation SMPortfolioModel

- (instancetype)initWithDict:(NSDictionary *) dict {
    
    self = [super init];
    if (self) {
        
        self.imageURL = [dict objectForKey:@"source"];
        
    }
    return self;
}

@end
