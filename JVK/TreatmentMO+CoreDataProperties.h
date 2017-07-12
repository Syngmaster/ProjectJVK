//
//  TreatmentMO+CoreDataProperties.h
//  
//
//  Created by Syngmaster on 12/07/2017.
//
//

#import "TreatmentMO+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface TreatmentMO (CoreDataProperties)

+ (NSFetchRequest<TreatmentMO *> *)fetchRequest;

@property (nullable, nonatomic, retain) NSData *image;
@property (nullable, nonatomic, copy) NSString *title;
@property (nullable, nonatomic, retain) NSSet<ServiceMO *> *services;

@end

@interface TreatmentMO (CoreDataGeneratedAccessors)

- (void)addServicesObject:(ServiceMO *)value;
- (void)removeServicesObject:(ServiceMO *)value;
- (void)addServices:(NSSet<ServiceMO *> *)values;
- (void)removeServices:(NSSet<ServiceMO *> *)values;

@end

NS_ASSUME_NONNULL_END
