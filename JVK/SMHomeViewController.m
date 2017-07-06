//
//  SMHomeViewController.m
//  JVK
//
//  Created by Max&Viktoria on 13/02/2017.
//  Copyright © 2017 Max&Viktoria. All rights reserved.
//

#import "SMHomeViewController.h"
#import "SMCustomButton.h"

typedef NS_ENUM(NSInteger, UICustomButtonType) {
    UICustomButtonTypeServices = 1,
    UICustomButtonTypePortfolio,
    UICustomButtonTypeAboutUs,
    UICustomButtonTypeContactUs
};

@implementation SMHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

- (IBAction)buttonAction:(SMCustomButton *)sender {
    
    switch (sender.tag) {
        case UICustomButtonTypeServices : self.tabBarController.selectedIndex = 2;
            break;
        case UICustomButtonTypePortfolio : self.tabBarController.selectedIndex = 3;
            break;
        case UICustomButtonTypeAboutUs : self.tabBarController.selectedIndex = 1;
            break;
        case UICustomButtonTypeContactUs : self.tabBarController.selectedIndex = 4;
            break;

    }
    
}

@end
