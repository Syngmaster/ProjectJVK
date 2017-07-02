//
//  EmailViewController.m
//  JVK
//
//  Created by Max&Viktoria on 20/02/2017.
//  Copyright © 2017 Max&Viktoria. All rights reserved.
//

#import "EmailViewController.h"
#import <MessageUI/MessageUI.h>

@interface EmailViewController () <UITextViewDelegate, MFMailComposeViewControllerDelegate>
@end

@implementation EmailViewController 

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"Email us";
    self.textField.delegate = self;
    
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range
 replacementText:(NSString *)text
{
    
    if ([text isEqualToString:@"\n"]) {
        
        [textView resignFirstResponder];
        // Return FALSE so that the final '\n' character doesn't get added
        return NO;
    }
    // For any other character return TRUE so that the text gets added to the view
    return YES;
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
- (IBAction)dismissKeyboard:(id)sender {
    
    [self resignFirstResponder];
    
}





- (IBAction)sendEmail:(id)sender {
    if ([MFMailComposeViewController canSendMail]) {
    
    NSArray *recipients = [NSArray arrayWithObject:@"fugza155@gmail.com"];
    MFMailComposeViewController *mc = [[MFMailComposeViewController alloc] init];
    mc.mailComposeDelegate = self;
    [mc setToRecipients:recipients];
    [mc setSubject:[NSString stringWithFormat:@"%@", self.nameField.text]];
    [mc setMessageBody:[NSString stringWithFormat:@"Name: %@\r\n Email: %@\r\n Message: \n%@",self.nameField.text, self.emailField.text, self.textField.text] isHTML: NO];

    [self presentViewController:mc animated:YES completion:nil];
    }
}


-(void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error {
    
    [self dismissViewControllerAnimated:true completion:nil];
    
}


@end
