//
//  SMContactUsViewController.h
//  JVK
//
//  Created by Max&Viktoria on 20/02/2017.
//  Copyright © 2017 Max&Viktoria. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface SMContactUsViewController : UIViewController

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

- (IBAction)directButton:(id)sender;
- (IBAction)callButton:(id)sender;
- (IBAction)faceButton:(id)sender;



@end
