//
//  ServiceMO+CoreDataProperties.m
//  
//
//  Created by Syngmaster on 12/07/2017.
//
//

#import "ServiceMO+CoreDataProperties.h"

@implementation ServiceMO (CoreDataProperties)

+ (NSFetchRequest<ServiceMO *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Service"];
}

@dynamic name;
@dynamic price;
@dynamic relationship;

@end
