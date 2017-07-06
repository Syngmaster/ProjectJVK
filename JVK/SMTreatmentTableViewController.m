//
//  SMServicesTableViewController.m
//  JVK
//
//  Created by Max&Viktoria on 16/02/2017.
//  Copyright © 2017 Max&Viktoria. All rights reserved.
//

#import "SMTreatmentTableViewController.h"
#import "SMTreatmentTableViewCell.h"
#import "SMServiceTableViewController.h"
#import "SMDataService.h"
#import "SMTreatmentModel.h"

@interface SMTreatmentTableViewController ()

@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation SMTreatmentTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.activityIndicator startAnimating];
    
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem.title=@"";
    
    [[SMDataService sharedInstance] getTreatments:^(NSArray *resultArray) {
        
        self.dataArray = resultArray;
        [self.activityIndicator stopAnimating];
        [self updateTableData];
        
    }];
    
}

- (void)updateTableData {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
    });
}


#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    SMTreatmentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    if (!cell) {
        cell = [[SMTreatmentTableViewCell alloc] init];
    }
    
    SMTreatmentModel *model = [self.dataArray objectAtIndex:indexPath.row];
        
    [cell configureCell:model];
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    SMTreatmentModel *model = [self.dataArray objectAtIndex:indexPath.row];
    
    [self performSegueWithIdentifier:@"detailVC" sender:model];
    
}



#pragma mark - Segue method

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

    SMServiceTableViewController *detailVC = [segue destinationViewController];
    SMTreatmentModel *model = sender;
    detailVC.model = model;

}

@end
