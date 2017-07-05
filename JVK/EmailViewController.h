//
//  EmailViewController.h
//  JVK
//
//  Created by Max&Viktoria on 20/02/2017.
//  Copyright © 2017 Max&Viktoria. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SMCustomButton;

@interface EmailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UITextView *emailBodyTextView;

- (IBAction)sendEmailAction:(SMCustomButton *)sender;

@end
