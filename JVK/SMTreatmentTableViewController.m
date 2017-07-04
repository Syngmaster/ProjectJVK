//
//  SMServicesTableViewController.m
//  JVK
//
//  Created by Max&Viktoria on 16/02/2017.
//  Copyright © 2017 Max&Viktoria. All rights reserved.
//

#import "SMTreatmentTableViewController.h"
#import "ServicesTableViewCell.h"
#import "ServiceDetailViewController.h"
#import "SMDataService.h"
#import "SMTreatmentModel.h"

@interface SMTreatmentTableViewController ()

@property (nonatomic, strong) NSArray *imageList;
@property (nonatomic, strong) NSArray *titleList;

@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation SMTreatmentTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.titleList = @[@"Hands",@"Legs", @"Face", @"Tint"];
    self.imageList = @[@"manicure.jpeg", @"pedicure.jpeg", @"face1.jpeg", @"eyebrow.jpeg"];
    
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem.title=@"";
    
    
    [[SMDataService sharedInstance] getTreatments:^(NSArray *resultArray) {
        
        self.dataArray = resultArray;
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
        
    }];
    
}


#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ServicesTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    if (!cell) {
        cell = [[ServicesTableViewCell alloc] init];
    }
    
    SMTreatmentModel *model = [self.dataArray objectAtIndex:indexPath.row];
        
    [cell configureCell:model];
    
    return cell;
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"showDetail"]) {
        
        ServiceDetailViewController *DVC = [segue destinationViewController];
        NSIndexPath *indexPath = self.tableView.indexPathForSelectedRow;
        
        NSString *title = self.titleList[indexPath.row];
        DVC.sentData = title;
        
    }    
}

@end
