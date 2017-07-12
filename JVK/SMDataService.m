//
//  SMDataService.m
//  JVK
//
//  Created by Syngmaster on 03/07/2017.
//  Copyright © 2017 Max&Viktoria. All rights reserved.
//

#import "SMDataService.h"
#import "SMTreatmentModel.h"
#import "SMServicesModel.h"
#import "SMPortfolioModel.h"
#import <FBSDKCoreKit.h>
#import "TreatmentMO+CoreDataClass.h"
#import "ServiceMO+CoreDataClass.h"

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

- (NSManagedObjectContext*) managedObjectContext {
    
    if (!_managedObjectContext) {
        _managedObjectContext = [[SMDataService sharedInstance] persistentContainer].viewContext;
    }
    return _managedObjectContext;
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
        completionHandler(array, nil);
        
    }];
    
}

- (void)saveToDatabase:(NSArray *) resultArray {
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:[NSEntityDescription entityForName:@"Treatment" inManagedObjectContext:self.managedObjectContext]];
    NSArray *result = [self.managedObjectContext executeFetchRequest:request error:nil];
    
    if ([result count] == 0) {
        
        for (SMTreatmentModel *model in resultArray) {
            
            TreatmentMO *treat = [NSEntityDescription insertNewObjectForEntityForName:@"Treatment" inManagedObjectContext:self.managedObjectContext];
            
            
            treat.title = model.treatmentTitle;
            if ([treat.title isEqualToString:@"Hands"]) {
                treat.image = UIImageJPEGRepresentation([UIImage imageNamed:@"manicure.jpeg"], 0);
                
            } else if ([treat.title isEqualToString:@"Legs"]) {
                
                treat.image = UIImageJPEGRepresentation([UIImage imageNamed:@"pedicure.jpeg"], 0);
                
            } else if ([treat.title isEqualToString:@"Treading"]) {
                
                treat.image = UIImageJPEGRepresentation([UIImage imageNamed:@"face1.jpeg"], 0);
                
            } else {
                
                treat.image = UIImageJPEGRepresentation([UIImage imageNamed:@"eyebrow.jpeg"], 0);
                
            }
            
            NSArray *services = model.serviceArray;
            
            for (SMServicesModel *model in services) {
                
                ServiceMO *service = [NSEntityDescription insertNewObjectForEntityForName:@"Service" inManagedObjectContext:self.managedObjectContext];
                service.name = model.serviceTitle;
                service.price = [NSString stringWithFormat:@"%@", model.servicePrice];
                [treat addServicesObject:service];
            }
            [self.managedObjectContext save:nil];

        }
        

    }
 
}

- (void)getPortfolioPhotos:(modelBlock) completionHandler {
    
    NSDictionary *params = @{@"fields" : @"source", @"access_token" : @"315704588878166|200edbb2d7276476f9949f5f5bbadc0c", @"count" : @183};
    
    FBSDKGraphRequest *request = [[FBSDKGraphRequest alloc] initWithGraphPath:@"1720223838243039/photos" parameters:params HTTPMethod:@"GET"];
    
    [request startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, NSDictionary *result, NSError *error) {

        if (!error) {
            
            //NSLog(@"Result: %@", result);
            
            NSArray *resultArray = [result objectForKey:@"data"];
            NSMutableArray *array = [NSMutableArray array];
            
            for (NSDictionary *dict in resultArray) {
                SMPortfolioModel *model = [[SMPortfolioModel alloc] initWithDict:dict];
                [array addObject:model];
            }
            
            completionHandler(array, nil);
            
        } else {
            
            completionHandler(nil, error);
        }
    }];
}


#pragma mark - Core Data stack

@synthesize persistentContainer = _persistentContainer;

- (NSPersistentContainer *)persistentContainer {
    // The persistent container for the application. This implementation creates and returns a container, having loaded the store for the application to it.
    @synchronized (self) {
        if (_persistentContainer == nil) {
            _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"SMCoreDataModel"];
            [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error) {
                if (error != nil) {
                    // Replace this implementation with code to handle the error appropriately.
                    // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                    
                    /*
                     Typical reasons for an error here include:
                     * The parent directory does not exist, cannot be created, or disallows writing.
                     * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                     * The device is out of space.
                     * The store could not be migrated to the current model version.
                     Check the error message to determine what the actual problem was.
                     */
                    NSLog(@"Unresolved error %@, %@", error, error.userInfo);
                    abort();
                }
            }];
        }
    }
    
    return _persistentContainer;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    NSError *error = nil;
    if ([context hasChanges] && ![context save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
}


@end
