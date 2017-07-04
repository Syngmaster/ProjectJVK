//
//  SMServiceTableViewController.m
//  JVK
//
//  Created by Max&Viktoria on 16/02/2017.
//  Copyright © 2017 Max&Viktoria. All rights reserved.
//

#import "SMServiceTableViewController.h"
#import "DescriptionTableViewCell.h"

@interface SMServiceTableViewController () {
    
    NSArray *array, *price, *array1, *price1, *array2, *price2, *array3, *price3;
    
}


@end

@implementation SMServiceTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    array = @[@"Mini Manicure",@"Almond SPA Manicure",@"Shellac",@"Acrylic full set", @"Gel full set", @"Acrylic/gel overlay", @"Paraffin wax treatment"];
    price = @[@"10€",@"25€",@"15€",@"30€", @"30€", @"20€", @"5€"];
    
    array1 = @[@"Mini pedicure",@"Almond SPA pedicure",@"Shellac on toes"];
    price1 = @[@"10€",@"30€",@"15€"];
    
    array2 = @[@"Treading:", @"         Eyebrows",@"         Upper Lip",@"         Chin",@"         Side Face"];
    price2 = @[@"10€", @"", @"" ,@"", @""];
    
    array3 = @[@"Eyebrows Tint",@"Eyelashes Tint"];
    price3 = @[@"5€",@"10€"];
    

    
    self.navigationItem.title = self.sentData;
    

    


}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if([self.navigationItem.title isEqualToString:@"Hands"]) {
        
        return array.count;
        
    }
    
    if([self.navigationItem.title isEqualToString:@"Legs"]) {
        
        return array1.count;
    }
    
    if([self.navigationItem.title isEqualToString:@"Face"]) {
        
        return array2.count;
    }
    
    return array3.count;
    
 }

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *simpleTableIdentifier = @"tablecell";
    
    DescriptionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
 
    
    if([self.navigationItem.title isEqualToString:@"Hands"]) {
        
        cell.nameLabel.text = array[indexPath.row];
        cell.priceLabel.text = price[indexPath.row];
        
    }
    
    if([self.navigationItem.title isEqualToString:@"Legs"]) {
        
        cell.nameLabel.text = array1[indexPath.row];
        cell.priceLabel.text = price1[indexPath.row];
        
    }
    
    if([self.navigationItem.title isEqualToString:@"Face"]) {
        
        cell.nameLabel.text = array2[indexPath.row];
        cell.priceLabel.text = price2[indexPath.row];
        
    }
    
    if([self.navigationItem.title isEqualToString:@"Tint"]) {
        
        cell.nameLabel.text = array3[indexPath.row];
        cell.priceLabel.text = price3[indexPath.row];
        
    }
    
    
    return cell;
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
