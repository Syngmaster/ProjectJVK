//
//  SMServiceTableViewController.h
//  JVK
//
//  Created by Max&Viktoria on 16/02/2017.
//  Copyright © 2017 Max&Viktoria. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SMTreatmentModel;

@interface SMServiceTableViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) SMTreatmentModel *model;


@end
