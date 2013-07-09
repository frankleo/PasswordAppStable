//
//  ConfirmResetMasterPasswordViewController.m
//  PasswordApp070113
//
//  Created by Frank Rivera on 7/9/13.
//  Copyright (c) 2013 Frank Rivera. All rights reserved.
//


#import "ConfirmResetMasterPasswordViewController.h"

@interface ConfirmResetMasterPasswordViewController ()

@end

@implementation ConfirmResetMasterPasswordViewController

/* helper method that keeps our barButtonItem creation seperate from our viewDidLoad (this is only done to keep viewDidLoad a little cleaner */
- (void)addBarButtonItem
{
    UIBarButtonItem *saveBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Save" style:UIBarButtonItemStyleBordered target:self action:@selector(saveBarButtonItemPressed:)];
    self.navigationItem.rightBarButtonItem = saveBarButtonItem;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.enterPasswordTextField.delegate = self;
    self.confirmPasswordTextField.delegate = self;
    
    [self addBarButtonItem];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField

{
    
    if (textField == self.enterPasswordTextField)
    {
        [self.confirmPasswordTextField becomeFirstResponder];
    }
    else if (textField == self.confirmPasswordTextField)
    {
        [self.confirmPasswordTextField resignFirstResponder];
    }
    return YES;
}

-(void)saveBarButtonItemPressed: (id) selector

{
    
    if ([self.enterPasswordTextField.text isEqualToString:self.confirmPasswordTextField.text])
        
    {
        
        NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
        
        [standardUserDefaults setObject:self.enterPasswordTextField.text forKey:@"password"];
        
        [standardUserDefaults synchronize];
        
        
        
        HomeCollectionViewController *homeViewController = [[HomeCollectionViewController alloc] initWithNibName:nil bundle:nil];
        
        [self.navigationController presentViewController:homeViewController animated:YES completion:NULL];
        
        
        
    }
    
    else
        
    {
        
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Oops!" message:@"Passwords Do Not Match" delegate:self cancelButtonTitle:@"Try Again" otherButtonTitles:nil];
        
        [alertView show];
        
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
