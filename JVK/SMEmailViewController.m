//
//  SMEmailViewController.m
//  JVK
//
//  Created by Max&Viktoria on 20/02/2017.
//  Copyright © 2017 Max&Viktoria. All rights reserved.
//

#import "SMEmailViewController.h"
#import <MessageUI/MessageUI.h>

@interface SMEmailViewController () <UITextViewDelegate, MFMailComposeViewControllerDelegate, UITextFieldDelegate>

@property (assign, nonatomic) BOOL hasAtSign;

@end

@implementation SMEmailViewController 

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"Email us";
    self.emailBodyTextView.delegate = self;
    self.nameField.delegate = self;
    self.emailField.delegate = self;
    
    self.hasAtSign = YES;
    
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    if (!self.isMovingFromParentViewController && ([self.nameField.text isEqualToString:@""] && [self.emailField.text isEqualToString:@""])) {
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

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error {
    
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

- (BOOL) textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    if ([textField isEqual:self.emailField]) {
        
        return [self validationCheckOfCharactersEmailFieldFrom:textField string:string inRange:range];
    }
    
    return YES;
    
}

#pragma mark - Validation Checks for TextFields

- (BOOL)validationCheckOfCharactersEmailFieldFrom:(UITextField *) textField string:(NSString *) string inRange:(NSRange) range {
    
    NSCharacterSet *set = [NSCharacterSet characterSetWithCharactersInString:@":;'\"()+-"];
    NSString* newString = [textField.text stringByReplacingCharactersInRange:range withString:string];
    
    
    if ([textField isEqual:self.emailField]){
        
        NSArray *words = [string componentsSeparatedByCharactersInSet:set];
        
        if ([words count] > 1 || [newString length] > 50) {
            return NO;
        }
        
        
        if ([textField.text length] == 0 && [string isEqualToString:@"@"]) {
            
            return NO;
            
        } else if ([string isEqualToString:@"@"] && self.hasAtSign) {
            
            self.hasAtSign = NO;
            
        } else if ([string isEqualToString:@"@"] && !self.hasAtSign) {
            
            return NO;
            
        }
        
    }
    
    return YES;
    
}

@end
