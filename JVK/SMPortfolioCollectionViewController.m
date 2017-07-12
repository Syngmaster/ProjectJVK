//
//  SMPortfolioCollectionViewController.m
//  JVK
//
//  Created by Max&Viktoria on 17/02/2017.
//  Copyright © 2017 Max&Viktoria. All rights reserved.
//

#import "SMPortfolioCollectionViewController.h"
#import "SMPortfolioCollectionViewCell.h"
#import "SMDataService.h"

@interface SMPortfolioCollectionViewController ()

@property (strong, nonatomic) NSArray *photosArray;

@end

@implementation SMPortfolioCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Register cell classes
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self.activityIndicator startAnimating];

    [[SMDataService sharedInstance] getPortfolioPhotos:^(NSArray *resultArray, NSError *error) {
        
        if (resultArray) {
            
            self.photosArray = resultArray;
            [self.activityIndicator stopAnimating];
            [self.activityIndicator hidesWhenStopped];
            [self updateTableData];
            
        } else {
            
            [self.activityIndicator stopAnimating];
            
            UIAlertController *controller = [UIAlertController alertControllerWithTitle:@"No connection!" message:@"Please check your internet connection!" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *action = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleCancel handler:nil];
            [controller addAction:action];
            [self presentViewController:controller animated:YES completion:nil];
        }
    }];
}

- (void)updateTableData {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.collectionView reloadData];
    });
}

#pragma mark - UICollectionViewDataSource


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.photosArray count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    SMPortfolioCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"portfoliocell" forIndexPath:indexPath];
    
    if (!cell) {
        cell = [[SMPortfolioCollectionViewCell alloc] init];
    }
    
    SMPortfolioModel *model = [self.photosArray objectAtIndex:indexPath.row];
    [cell configureCell:model];
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {

    return CGSizeMake(CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds)/2);
    
}

@end
