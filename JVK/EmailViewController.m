//
//  EmailViewController.m
//  JVK
//
//  Created by Max&Viktoria on 20/02/2017.
//  Copyright © 2017 Max&Viktoria. All rights reserved.
//

#import "EmailViewController.h"
#import <MessageUI/MessageUI.h>

@interface EmailViewController () <UITextViewDelegate, MFMailComposeViewControllerDelegate, UITextFieldDelegate>
@end

@implementation EmailViewController 

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"Email us";
    self.emailBodyTextView.delegate = self;
    self.nameField.delegate = self;
    self.emailField.delegate = self;
    
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    if (!self.isMovingFromParentViewController && (!self.nameField.text && !self.emailField.text)) {
        [self.navigationController popViewControllerAnimated:NO];
    }
    
}

#pragma mark - UITextViewDelegate

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    
    if ([text isEqualToString:@"\n"]) {
        
        [textView resignFirstResponder];
        // Return FALSE so that the final '\n' character doesn't get added
        return NO;
    }
    // For any other character return TRUE so that the text gets added to the view
    return YES;
}

#pragma mark - Action

- (IBAction)sendEmailAction:(SMCustomButton *)sender {
    
    if ([MFMailComposeViewController canSendMail]) {
        
        NSArray *recipients = [NSArray arrayWithObject:@"fugza155@gmail.com"];
        MFMailComposeViewController *mc = [[MFMailComposeViewController alloc] init];
        mc.mailComposeDelegate = self;
        [mc setToRecipients:recipients];
        [mc setSubject:[NSString stringWithFormat:@"%@", self.nameField.text]];
        [mc setMessageBody:[NSString stringWithFormat:@"Name: %@\r\n Email: %@\r\n Message: \n%@",self.nameField.text, self.emailField.text, self.emailBodyTextView.text] isHTML: NO];
        
        [self presentViewController:mc animated:YES completion:nil];
        
    }
}

#pragma mark - MFMailComposeViewControllerDelegate

-(void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error {
    
    [self dismissViewControllerAnimated:true completion:nil];
    
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    if ([textField isEqual:self.nameField]) {
        [self.emailField becomeFirstResponder];
    } else {
        [textField resignFirstResponder];
    }
    
    return YES;
    
}

@end
