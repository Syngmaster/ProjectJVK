//
//  ContactUsViewController.m
//  JVK
//
//  Created by Max&Viktoria on 20/02/2017.
//  Copyright © 2017 Max&Viktoria. All rights reserved.
//

#import "ContactUsViewController.h"
#import <MapKit/MapKit.h>

@interface ContactUsViewController () {
    
    float lat, lon;
    
}

@end

@implementation ContactUsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // Do any additional setup after loading the view.
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    
    UIImage *backBtn = [UIImage imageNamed:@"arrow1.png"];
    backBtn = [backBtn imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.navigationItem.backBarButtonItem.title=@"";
    self.navigationController.navigationBar.backIndicatorImage = backBtn;
    self.navigationController.navigationBar.backIndicatorTransitionMaskImage = backBtn;
    
    
    lat = 53.71659349999999;
    lon = -6.355589900000041;

    
    //create span for the location
    MKCoordinateSpan span;
    span.latitudeDelta = 0.008;
    span.longitudeDelta = 0.008;
    
    
    CLLocationCoordinate2D location;
    location.latitude = lat;
    location.longitude = lon;
    
    
    MKCoordinateRegion region;
    region.center = location;
    region.span = span;
    
    [self.mapView setRegion:region];
    
    //set a pin point
    
    CLLocationCoordinate2D pinLocation;
    pinLocation.latitude = lat;
    pinLocation.longitude = lon;
    
    
    
    MKPointAnnotation *objAnn = [[MKPointAnnotation alloc] init];
    objAnn.coordinate = pinLocation;
    objAnn.title = @"JVK";
    objAnn.subtitle = @"Nails&Beauty";
    [self.mapView addAnnotation:objAnn];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)directButton:(id)sender {
    

    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://maps.apple.com/maps?daddr=%f,%f", lat, lon]] options:@{} completionHandler:nil];
}

- (IBAction)callButton:(id)sender {
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel://0899510834"] options:@{} completionHandler:nil];
    
}

- (IBAction)faceButton:(id)sender {
  
    NSURL *url = [NSURL URLWithString:@"https://www.facebook.com/JVK-Nails-Beauty-1720220001576756/"];
    [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];

    

}
@end
