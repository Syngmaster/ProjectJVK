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
    
    [self.activityIndicator startAnimating];
    
    // Register cell classes
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    [[SMDataService sharedInstance] getPortfolioPhotos:^(NSArray *resultArray) {
        self.photosArray = resultArray;
        [self.activityIndicator stopAnimating];
        [self updateTableData];
        
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
