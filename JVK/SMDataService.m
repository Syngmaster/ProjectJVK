//
//  SMDataService.m
//  JVK
//
//  Created by Syngmaster on 03/07/2017.
//  Copyright © 2017 Max&Viktoria. All rights reserved.
//

#import "SMDataService.h"
#import "SMTreatmentModel.h"

@implementation SMDataService

- (instancetype)init {
    
    self = [super init];
    if (self) {
        
        NSCache *cache = [[NSCache alloc] init];
        self.imageCache = cache;
    }
    return self;
}

+ (SMDataService *)sharedInstance {
    
    static SMDataService *sharedInstance = nil;
    
    if (!sharedInstance) {
        sharedInstance = [[SMDataService alloc] init];
    }
    
    return sharedInstance;
    
}


- (void)getTreatments:(modelBlock) completionHandler {
    
    self.ref = [[FIRDatabase database] reference];
    
    [self.ref observeEventType:FIRDataEventTypeValue withBlock:^(FIRDataSnapshot * _Nonnull snapshot) {
        
        NSDictionary *dict = snapshot.value;
        NSMutableArray *array = [NSMutableArray array];
        
        for (NSString *key in dict) {
            SMTreatmentModel *newTreatment = [[SMTreatmentModel alloc] initWithDict:dict[key]];
            [array addObject:newTreatment];
        }
        
        NSSortDescriptor *desc = [NSSortDescriptor sortDescriptorWithKey:@"treatmentTitle" ascending:YES];
        
        [array sortUsingDescriptors:@[desc]];
        completionHandler(array);
        
    }];
    
}


@end
