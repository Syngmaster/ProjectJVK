//
//  SMLocationModel.m
//  JVK
//
//  Created by Syngmaster on 05/07/2017.
//  Copyright © 2017 Max&Viktoria. All rights reserved.
//

#import "SMLocationModel.h"

static CGFloat latitude = 53.71659349999999;
static CGFloat longitude = -6.355589900000041;

@implementation SMLocationModel

+ (SMLocationModel *)generateLocation {
    
    SMLocationModel *model = [[SMLocationModel alloc] init];
    
    CLLocationCoordinate2D coordinate;
    coordinate.latitude = latitude;
    coordinate.longitude = longitude;
    
    MKCoordinateSpan span;
    span.latitudeDelta = 0.008;
    span.longitudeDelta = 0.008;
    
    MKCoordinateRegion region;
    region.center = coordinate;
    region.span = span;
    
    model.region = region;
    model.coordinate = coordinate;
    model.title = @"JVK";
    model.subtitle = @"Nails&Beauty";
    
    return model;
    
}

@end
