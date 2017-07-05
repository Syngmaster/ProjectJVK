//
//  SMServiceTableViewController.m
//  JVK
//
//  Created by Max&Viktoria on 16/02/2017.
//  Copyright © 2017 Max&Viktoria. All rights reserved.
//

#import "SMServiceTableViewController.h"
#import "SMServiceTableViewCell.h"
#import "SMTreatmentModel.h"
#import "SMServicesModel.h"

@interface SMServiceTableViewController ()

@end

@implementation SMServiceTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //array2 = @[@"Treading:", @"         Eyebrows",@"         Upper Lip",@"         Chin",@"         Side Face"];
    
    self.navigationItem.title = self.model.treatmentTitle;

}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    if (!self.isMovingFromParentViewController) {
        [self.navigationController popViewControllerAnimated:NO];
    }

}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.model.serviceArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    SMServiceTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"serviceCell"];
 
    if (!cell) {
        cell = [[SMServiceTableViewCell alloc] init];
    }
    
    SMServicesModel *model = [self.model.serviceArray objectAtIndex:indexPath.row];
    
    [cell configureCell:model];
    
    return cell;
    
}

@end
