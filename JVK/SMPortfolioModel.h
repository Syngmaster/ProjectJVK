//
//  SMPortfolioModel.h
//  JVK
//
//  Created by Syngmaster on 06/07/2017.
//  Copyright © 2017 Max&Viktoria. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SMPortfolioModel : NSObject

@property (strong, nonatomic) NSString *imageURL;

- (instancetype)initWithDict:(NSDictionary *) dict;

@end
