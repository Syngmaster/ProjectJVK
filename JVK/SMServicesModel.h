//
//  SMServicesModel.h
//  JVK
//
//  Created by Syngmaster on 02/07/2017.
//  Copyright © 2017 Max&Viktoria. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SMServicesModel : NSObject

@property (strong, nonatomic) NSString *serviceTitle;
@property (strong, nonatomic) NSString *servicePrice;

- (instancetype)initWithDict:(NSDictionary *) dict;

@end
