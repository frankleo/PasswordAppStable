//
//  EditPasswordViewController.m
//  PasswordApp070113
//
//  Created by Frank Rivera on 7/1/13.
//  Copyright (c) 2013 Frank Rivera. All rights reserved.
//


#import "EditPasswordViewController.h"

@interface EditPasswordViewController ()

@end

@implementation EditPasswordViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.editAccount.delegate = self;
    self.editUsername.delegate = self;
    self.editPassword.delegate = self;
    self.editUrl.delegate = self;
    NSString *date1 = @"17-03-2000";
    NSString *date2 = @"20-03-2005";
    //    NSString *string = [NSString stringWithFormat:@"%d", theinteger];
    //self.addPassword.text = [NSString]
    int dateDiff = [self dateDiffrenceFromDate: date1 second: date2];
    
    self.passwordLastUpdated.text = [NSString stringWithFormat:@"%d since last update", dateDiff];
    
    
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Save" style:UIBarButtonItemStyleBordered target:self action:@selector(saveBarButtonItemPressed:)];
    self.navigationItem.rightBarButtonItem = barButtonItem;
    
    [self.generatePassword setTitle:@"Generate" forState:UIControlStateNormal];
}

- (void)addBarButtonItem
{
    UIBarButtonItem *saveBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Save" style:UIBarButtonItemStyleBordered target:self action:@selector(saveBarButtonItemPressed:)];
    self.navigationItem.rightBarButtonItem = saveBarButtonItem;
}

-(void)saveBarButtonItemPressed:(id)sender
{
    if ([self.editPassword.text isEqualToString:@""]){
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error" message:@"You must enter a password" delegate:self cancelButtonTitle:@"cancel" otherButtonTitles: nil];
        [alertView show];
    }
    else {
        Account *account = [[Account alloc] init];
        account.account = self.editAccount.text;
        account.password = self.editPassword.text;
        account.url = self.editUrl.text;
        account.username = self.editUsername.text;
        [self.delegate passwordAdded:account];
        [self.navigationController popViewControllerAnimated:YES];
    }
}

-(NSString *)randomString:(NSInteger)length

{
    
    NSString *letters = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    
    NSMutableString *randomString = [NSMutableString stringWithCapacity:length];
    
    for (int i = 0; i < length; i++) {
        
        [randomString appendFormat:@"%C", [letters characterAtIndex:arc4random() % [letters length]]];
        
    }
    
    return randomString;
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWasShown:)
                                                 name:UIKeyboardDidShowNotification
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
    
    
}

- (void)keyboardWasShown:(NSNotification *)notification
{
    // Step 1: Get the size of the keyboard.
    CGSize keyboardSize = [[[notification userInfo] objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    // Step 2: Adjust the bottom content inset of your scroll view by the keyboard height.
    UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0, keyboardSize.height, 0);
    self.keyboardScrollView.contentInset = contentInsets;
    self.keyboardScrollView.scrollIndicatorInsets = contentInsets;
    NSLog(@"Keyboard was shown");
    // Step 3: Scroll the target text field into view.
    CGRect aRect = self.view.frame;
    aRect.size.height -= keyboardSize.height;
    if (!CGRectContainsPoint(aRect, self.editPassword.frame.origin) ) {
        CGPoint scrollPoint = CGPointMake(0.0, self.editPassword.frame.origin.y - (keyboardSize.height-15));
        
        [self.keyboardScrollView setContentOffset:scrollPoint animated:YES];
    }
}

- (void) keyboardWillHide:(NSNotification *)notification {
    UIEdgeInsets contentInsets = UIEdgeInsetsZero;
    self.keyboardScrollView.contentInset = contentInsets;
    self.keyboardScrollView.scrollIndicatorInsets = contentInsets;
    NSLog(@"Keyboard hide");
}

//-(BOOL)textFieldShouldReturn:(UITextField *)textField
//{
//    [self.editAccount resignFirstResponder];
//    [self.editUsername resignFirstResponder];
//    [self.editPassword resignFirstResponder];
//    [self.editUrl resignFirstResponder];
//    return YES;
//}

- (BOOL)textFieldShouldReturn:(UITextField *)textField

{
    
    if (textField == self.editAccount)
        
    {
        
        [self.editUsername
         becomeFirstResponder];
    }
    else if (textField == self.editUsername)
        
    {
        
        [self.editPassword
         becomeFirstResponder];
        
    }
    else if (textField == self.editPassword)
        
    {
        
        [self.editUrl
         becomeFirstResponder];
        
    }
    else
    {
        [self.editUrl resignFirstResponder];
        
    }
    return YES;
    
}

//
//-(void)addBarButtonItem
//{
//    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Save" style:UIBarButtonItemStyleBordered target:self action:@selector(saveBarButtonItemPressed:)];
//    self.navigationItem.rightBarButtonItem = barButtonItem;
//}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)generatePasswordButtonPressed:(id)sender {
    self.editPassword.text = [self randomString:8];
}

-(int)dateDiffrenceFromDate:(NSString *)date1 second:(NSString *)date2 {
    // Manage Date Formation same for both dates
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd-MM-yyyy"];
    NSDate *startDate = [formatter dateFromString:date1];
    NSDate *endDate = [formatter dateFromString:date2];
    
    
    unsigned flags = NSDayCalendarUnit;
    NSDateComponents *difference = [[NSCalendar currentCalendar] components:flags fromDate:startDate toDate:endDate options:0];
    
    int dayDiff = [difference day];
    
    return dayDiff;
}

@end
