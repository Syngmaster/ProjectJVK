//
//  SMContactUsViewController.m
//  JVK
//
//  Created by Max&Viktoria on 20/02/2017.
//  Copyright © 2017 Max&Viktoria. All rights reserved.
//

#import "SMContactUsViewController.h"
#import <MapKit/MapKit.h>
#import "SMLocationModel.h"
#import "SMCustomAnnotationView.h"

@interface SMContactUsViewController () <MKMapViewDelegate>

@property (strong, nonatomic) SMLocationModel *model;

@end

@implementation SMContactUsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem.title=@"";
    
    SMLocationModel *model = [SMLocationModel generateLocation];
    self.model = model;
    [self.mapView setRegion:model.region];
    [self.mapView addAnnotation:model];

    
}

#pragma mark - Actions

- (IBAction)directButton:(id)sender {
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://maps.apple.com/maps?daddr=%f,%f", self.model.coordinate.latitude, self.model.coordinate.longitude]] options:@{} completionHandler:nil];
}

- (IBAction)callButton:(id)sender {
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel://0899510834"] options:@{} completionHandler:nil];
    
}

- (IBAction)faceButton:(id)sender {
  
    NSURL *url = [NSURL URLWithString:@"https://www.facebook.com/JVK-Nails-Beauty-1720220001576756/"];
    [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];

}

#pragma mark - MKMapViewDelegate

- (nullable SMCustomAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(SMLocationModel <MKAnnotation> *)annotation {
    
    static NSString *identifier = @"PinView";
    
    SMCustomAnnotationView *pin = (SMCustomAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
    
    if (!pin) {
        
        pin = [[SMCustomAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
        pin.image = [UIImage imageNamed:@"pin-view.png"];
        pin.canShowCallout = YES;

    } else {
        pin.annotation = annotation;
    }
    
    return pin;

}

@end
