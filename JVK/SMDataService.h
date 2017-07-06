//
//  SMDataService.h
//  JVK
//
//  Created by Syngmaster on 03/07/2017.
//  Copyright © 2017 Max&Viktoria. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <FirebaseDatabase/FirebaseDatabase.h>
#import <FirebaseStorage/FirebaseStorage.h>

typedef void(^modelBlock)(NSArray *resultArray);
typedef void(^imageDataBlock)(NSData *data, NSError *error);

@class SMTreatmentModel;

@interface SMDataService : NSObject

@property (strong, nonatomic) FIRDatabaseReference *ref;
@property (strong, nonatomic) FIRStorageReference *storageRef;

@property (nonatomic, strong) NSCache *imageCache;

+ (SMDataService *)sharedInstance;
- (void)getTreatments:(modelBlock) completionHandler;
- (void)getPortfolioPhotos:(modelBlock) completionHandler;

@end
