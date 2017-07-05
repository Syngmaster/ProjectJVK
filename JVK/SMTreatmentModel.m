//
//  SMTreatmentModel.m
//  JVK
//
//  Created by Syngmaster on 02/07/2017.
//  Copyright © 2017 Max&Viktoria. All rights reserved.
//

#import "SMTreatmentModel.h"
#import "SMServicesModel.h"

@implementation SMTreatmentModel

- (instancetype)initWithDict:(NSDictionary *) dict {
    
    self = [super init];
    if (self) {
        
        self.treatmentTitle = [dict objectForKey:@"title"];
        
        if ([self.treatmentTitle isEqualToString:@"Hands"]) {
            self.treatImage = [UIImage imageNamed:@"manicure.jpeg"];
        } else if ([self.treatmentTitle isEqualToString:@"Legs"]) {
            self.treatImage = [UIImage imageNamed:@"pedicure.jpeg"];
        } else if ([self.treatmentTitle isEqualToString:@"Treading"]) {
            self.treatImage = [UIImage imageNamed:@"face1.jpeg"];
        } else {
            self.treatImage = [UIImage imageNamed:@"eyebrow.jpeg"];
        }
                
        NSMutableArray *array = [NSMutableArray array];
        NSDictionary *serviceDict = [dict objectForKey:@"Services"];
        for (NSString *key in serviceDict) {
            SMServicesModel *model = [[SMServicesModel alloc] initWithDict:serviceDict[key]];
            [array addObject:model];
        }
        self.serviceArray = array;
    }
    
    return self;
}

@end
