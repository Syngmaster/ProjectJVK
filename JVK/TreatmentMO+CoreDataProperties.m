//
//  TreatmentMO+CoreDataProperties.m
//  
//
//  Created by Syngmaster on 12/07/2017.
//
//

#import "TreatmentMO+CoreDataProperties.h"

@implementation TreatmentMO (CoreDataProperties)

+ (NSFetchRequest<TreatmentMO *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Treatment"];
}

@dynamic image;
@dynamic title;
@dynamic services;

@end
