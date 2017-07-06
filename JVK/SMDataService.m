//
//  SMDataService.m
//  JVK
//
//  Created by Syngmaster on 03/07/2017.
//  Copyright © 2017 Max&Viktoria. All rights reserved.
//

#import "SMDataService.h"
#import "SMTreatmentModel.h"
#import "SMPortfolioModel.h"
#import <FBSDKCoreKit.h>

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
        //NSLog(@"Dict: %@", dict);
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

- (void)getPortfolioPhotos:(modelBlock) completionHandler {
    
    NSDictionary *params = @{@"fields" : @"source", @"access_token" : @"315704588878166|200edbb2d7276476f9949f5f5bbadc0c", @"count" : @183};
    
    FBSDKGraphRequest *request = [[FBSDKGraphRequest alloc] initWithGraphPath:@"1720223838243039/photos" parameters:params HTTPMethod:@"GET"];
    
    [request startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, NSDictionary *result, NSError *error) {

    
        NSLog(@"Result: %@", result);
        
        NSArray *resultArray = [result objectForKey:@"data"];
        NSMutableArray *array = [NSMutableArray array];
        
        for (NSDictionary *dict in resultArray) {
            SMPortfolioModel *model = [[SMPortfolioModel alloc] initWithDict:dict];
            [array addObject:model];
        }
        
        completionHandler(array);
        
        if (error) {
            NSLog(@"Error: %@", error.debugDescription);
        }
    
    }];
    
}


@end
