//
//  SMLocationModel.h
//  JVK
//
//  Created by Syngmaster on 05/07/2017.
//  Copyright © 2017 Max&Viktoria. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface SMLocationModel : NSObject <MKAnnotation>

@property (copy, nonatomic) NSString *title;
@property (copy, nonatomic) NSString *subtitle;
@property (assign, nonatomic) CLLocationCoordinate2D coordinate;
@property (assign, nonatomic) MKCoordinateRegion region;

+ (SMLocationModel *)generateLocation;

@end
