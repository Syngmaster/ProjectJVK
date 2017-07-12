//
//  SMTreatmentModel.h
//  JVK
//
//  Created by Syngmaster on 02/07/2017.
//  Copyright © 2017 Max&Viktoria. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface SMTreatmentModel : NSObject

@property (strong, nonatomic) NSString *treatmentTitle;
@property (strong, nonatomic) UIImage *treatImage;
@property (strong, nonatomic) NSArray *serviceArray;
@property (strong, nonatomic) NSManagedObjectContext* managedObjectContext;

- (instancetype)initWithDict:(NSDictionary *) dict;

@end
