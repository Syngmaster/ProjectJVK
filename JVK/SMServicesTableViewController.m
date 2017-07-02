//
//  SMServicesTableViewController.m
//  JVK
//
//  Created by Max&Viktoria on 16/02/2017.
//  Copyright © 2017 Max&Viktoria. All rights reserved.
//

#import "SMServicesTableViewController.h"
#import "ServicesTableViewCell.h"
#import "ServiceDetailViewController.h"

@interface SMServicesTableViewController ()

@property (nonatomic, strong) NSArray *imageList;
@property (nonatomic, strong) NSArray *titleList;

@end

@implementation SMServicesTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.titleList = @[@"Hands",@"Legs", @"Face", @"Tint"];
    self.imageList = @[@"manicure.jpeg", @"pedicure.jpeg", @"face1.jpeg", @"eyebrow.jpeg"];
    
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem.title=@"";
    
}


#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.titleList count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ServicesTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    if (!cell) {
        cell = [[ServicesTableViewCell alloc] init];
    }
    
    cell.label.text = self.titleList[indexPath.row];
    cell.image.image = [UIImage imageNamed:self.imageList[indexPath.row]];
    
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
