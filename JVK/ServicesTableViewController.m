//
//  ServicesTableViewController.m
//  JVK
//
//  Created by Max&Viktoria on 16/02/2017.
//  Copyright © 2017 Max&Viktoria. All rights reserved.
//

#import "ServicesTableViewController.h"
#import "ServicesTableViewCell.h"
#import "ServiceDetailViewController.h"

@interface ServicesTableViewController () {
    
    NSArray *imageList, *titleList;

}

@end

@implementation ServicesTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    titleList = @[@"Hands",@"Legs", @"Face", @"Tint"];
    imageList = @[@"manicure.jpeg", @"pedicure.jpeg", @"face1.jpeg", @"eyebrow.jpeg"];
    
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    
    UIImage *backBtn = [UIImage imageNamed:@"arrow1.png"];
    backBtn = [backBtn imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.navigationItem.backBarButtonItem.title=@"";
    self.navigationController.navigationBar.backIndicatorImage = backBtn;
    self.navigationController.navigationBar.backIndicatorTransitionMaskImage = backBtn;
    
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return titleList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ServicesTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    cell.label.text = titleList[indexPath.row];
    cell.image.image = [UIImage imageNamed:imageList[indexPath.row]];
    
    cell.layer.borderWidth = 5;
    cell.layer.borderColor = [UIColor colorWithRed:150/255.0 green:150/255.0 blue:150/255.0 alpha:0.5].CGColor;
    
    return cell;
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"showDetail"]) {
        
        ServiceDetailViewController *DVC = [segue destinationViewController];
        NSIndexPath *indexPath = self.tableView.indexPathForSelectedRow;
        
        NSString *title = titleList[indexPath.row];
        DVC.sentData = title;
        
    }    
}

@end
