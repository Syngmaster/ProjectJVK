//
//  ServiceMO+CoreDataProperties.h
//  
//
//  Created by Syngmaster on 12/07/2017.
//
//

#import "ServiceMO+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface ServiceMO (CoreDataProperties)

+ (NSFetchRequest<ServiceMO *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, copy) NSString *price;
@property (nullable, nonatomic, retain) TreatmentMO *treatment;

@end

NS_ASSUME_NONNULL_END
