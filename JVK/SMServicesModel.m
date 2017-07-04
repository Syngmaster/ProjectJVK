//
//  SMServicesModel.m
//  JVK
//
//  Created by Syngmaster on 02/07/2017.
//  Copyright © 2017 Max&Viktoria. All rights reserved.
//

#import "SMServicesModel.h"

@implementation SMServicesModel

- (instancetype)initWithDict:(NSDictionary *) dict {
    
    self = [super init];
    if (self) {
        
        self.serviceTitle = [dict objectForKey:@"title"];
        self.servicePrice = [dict objectForKey:@"price"];
        
    }
    
    return self;
}

@end
